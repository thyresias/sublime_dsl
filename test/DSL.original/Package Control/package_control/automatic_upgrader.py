import threading
import re
import os
import datetime
import time

import sublime

from .console_write import console_write
from .package_installer import PackageInstaller
from .package_renamer import PackageRenamer
from .open_compat import open_compat, read_compat


class AutomaticUpgrader(threading.Thread):
    """
    Automatically checks for updated packages and installs them. controlled
    by the `auto_upgrade`, `auto_upgrade_ignore`, and `auto_upgrade_frequency`
    settings.
    """

    def __init__(self, found_packages):
        """
        :param found_packages:
            A list of package names for the packages that were found to be
            installed on the machine.
        """

        self.installer = PackageInstaller()
        self.manager = self.installer.manager

        self.load_settings()

        self.package_renamer = PackageRenamer()
        self.package_renamer.load_settings()

        self.auto_upgrade = self.settings.get('auto_upgrade')
        self.auto_upgrade_ignore = self.settings.get('auto_upgrade_ignore')

        self.load_last_run()
        self.determine_next_run()

        # Detect if a package is missing that should be installed
        self.missing_packages = list(set(self.installed_packages) -
            set(found_packages))

        if self.auto_upgrade and self.next_run <= time.time():
            self.save_last_run(time.time())

        threading.Thread.__init__(self)

    def load_last_run(self):
        """
        Loads the last run time from disk into memory
        """

        self.last_run = None

        self.last_run_file = os.path.join(sublime.packages_path(), 'User',
            'Package Control.last-run')

        if os.path.isfile(self.last_run_file):
            with open_compat(self.last_run_file) as fobj:
                try:
                    self.last_run = int(read_compat(fobj))
                except ValueError:
                    pass

    def determine_next_run(self):
        """
        Figure out when the next run should happen
        """

        self.next_run = int(time.time())

        frequency = self.settings.get('auto_upgrade_frequency')
        if frequency:
            if self.last_run:
                self.next_run = int(self.last_run) + (frequency * 60 * 60)
            else:
                self.next_run = time.time()

    def save_last_run(self, last_run):
        """
        Saves a record of when the last run was

        :param last_run:
            The unix timestamp of when to record the last run as
        """

        with open_compat(self.last_run_file, 'w') as fobj:
            fobj.write(str(int(last_run)))


    def load_settings(self):
        """
        Loads the list of installed packages from the
        Package Control.sublime-settings file
        """

        self.settings_file = 'Package Control.sublime-settings'
        self.settings = sublime.load_settings(self.settings_file)
        self.installed_packages = self.settings.get('installed_packages', [])
        self.should_install_missing = self.settings.get('install_missing')
        if not isinstance(self.installed_packages, list):
            self.installed_packages = []

    def run(self):
        self.install_missing()

        if self.next_run > time.time():
            self.print_skip()
            return

        self.upgrade_packages()

    def install_missing(self):
        """
        Installs all packages that were listed in the list of
        `installed_packages` from Package Control.sublime-settings but were not
        found on the filesystem and passed as `found_packages`.
        """

        if not self.missing_packages or not self.should_install_missing:
            return

        console_write(u'Installing %s missing packages' % len(self.missing_packages), True)
        for package in self.missing_packages:
            if self.installer.manager.install_package(package):
                console_write(u'Installed missing package %s' % package, True)

    def print_skip(self):
        """
        Prints a notice in the console if the automatic upgrade is skipped
        due to already having been run in the last `auto_upgrade_frequency`
        hours.
        """

        last_run = datetime.datetime.fromtimestamp(self.last_run)
        next_run = datetime.datetime.fromtimestamp(self.next_run)
        date_format = '%Y-%m-%d %H:%M:%S'
        message_string = u'Skipping automatic upgrade, last run at %s, next run at %s or after' % (
            last_run.strftime(date_format), next_run.strftime(date_format))
        console_write(message_string, True)

    def upgrade_packages(self):
        """
        Upgrades all packages that are not currently upgraded to the lastest
        version. Also renames any installed packages to their new names.
        """

        if not self.auto_upgrade:
            return

        self.package_renamer.rename_packages(self.installer)

        package_list = self.installer.make_package_list(['install',
            'reinstall', 'downgrade', 'overwrite', 'none'],
            ignore_packages=self.auto_upgrade_ignore)

        # If Package Control is being upgraded, just do that and restart
        for package in package_list:
            if package[0] != 'Package Control':
                continue

            def reset_last_run():
                # Re-save the last run time so it runs again after PC has
                # been updated
                self.save_last_run(self.last_run)
            sublime.set_timeout(reset_last_run, 1)
            package_list = [package]
            break

        if not package_list:
            console_write(u'No updated packages', True)
            return

        console_write(u'Installing %s upgrades' % len(package_list), True)

        disabled_packages = []

        def do_upgrades():
            # Wait so that the ignored packages can be "unloaded"
            time.sleep(0.5)

            # We use a function to generate the on-complete lambda because if
            # we don't, the lambda will bind to info at the current scope, and
            # thus use the last value of info from the loop
            def make_on_complete(name):
                return lambda: self.installer.reenable_package(name)

            for info in package_list:
                if info[0] in disabled_packages:
                    on_complete = make_on_complete(info[0])
                else:
                    on_complete = None

                self.installer.manager.install_package(info[0])

                version = re.sub('^.*?(v[\d\.]+).*?$', '\\1', info[2])
                if version == info[2] and version.find('pull with') != -1:
                    vcs = re.sub('^pull with (\w+).*?$', '\\1', version)
                    version = 'latest %s commit' % vcs
                message_string = u'Upgraded %s to %s' % (info[0], version)
                console_write(message_string, True)
                if on_complete:
                    sublime.set_timeout(on_complete, 1)

        # Disabling a package means changing settings, which can only be done
        # in the main thread. We then create a new background thread so that
        # the upgrade process does not block the UI.
        def disable_packages():
            disabled_packages.extend(self.installer.disable_packages([info[0] for info in package_list]))
            threading.Thread(target=do_upgrades).start()
        sublime.set_timeout(disable_packages, 1)
