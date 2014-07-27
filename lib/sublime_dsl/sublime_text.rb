# encoding: utf-8

require_relative 'sublime_text/command'
require_relative 'sublime_text/command_set'
require_relative 'sublime_text/keyboard'
require_relative 'sublime_text/keymap'
require_relative 'sublime_text/macro'
require_relative 'sublime_text/menu'
require_relative 'sublime_text/mouse'
require_relative 'sublime_text/mousemap'
require_relative 'sublime_text/package'
require_relative 'sublime_text/setting_set'

module SublimeDSL
module SublimeText

  # Path to the Packages directory.

  def self.packages_dir
    @packages_dir ||=
      case Tools.os
      when :Windows
        ENV['APPDATA'].gsub('\\', '/') << '/Sublime Text 2/Packages'
      when :OSX
        "~/Library/Application Support/Sublime Text 2/Packages"
      when :Linux
        "~/.config/sublime-text-2/Packages"
      else
        raise NotImplementedError,
          "don't know the location of Sublime Text packages on #{os}"
      end
  end

  # Order a series of config files like ST does:
  # - Default/* first,
  # - then packages alphabetically,
  # - then User/Default*,
  # - then User/* alphabetically.

  def self.order_config(files)
    default, other = files.partition { |f| f.start_with?('Default') }
    user, other = other.partition { |f| f.start_with?('User') }
    user_default, user_other = user.partition { |f| f.start_with?('User/Default') }
    default.sort + other.sort + user_default.sort + user_other.sort
  end

end
end
