import sublime
import sublime_plugin

# an alternative to show_scope_name
class DisplayScopesCommand(sublime_plugin.TextCommand):

  def run(self, edit, show_statusbar=False, show_panel=True, clipboard=False, rowcol=False, points=False, multiselect=True, console_log=False):
    self.window = self.view.window()
    view = self.window.get_output_panel('scope_viewer')
    self.scope_bfr = []
    self.clips = []
    self.status = ""
    self.show_statusbar = show_statusbar
    self.show_panel = show_panel
    self.clipboard = clipboard
    self.rowcol = rowcol
    self.points = points
    self.first = True

    # Get scope info for each selection wanted
    if len(self.view.sel()):
      if multiselect:
        for sel in self.view.sel():
          self.get_scope(sel.b)
      else:
        self.get_scope(self.view.sel()[0].b)

    # Copy scopes to clipboard
    if clipboard:
      sublime.set_clipboard('\n'.join(self.clips))

    # Display in status bar
    if show_statusbar:
      sublime.status_message(self.status)

    # Show panel
    if show_panel:
      self.window.run_command("show_panel", {"panel": "output.scope_viewer"})
      view.insert(edit, 0, ''.join(self.scope_bfr))

    if console_log:
      print ''.join(self.scope_bfr)

  def get_scope(self, pt):
    if self.rowcol or self.points:
      pts = self.view.extract_scope(pt)
      if self.points:
        self.scope_bfr.append("%-25s (%d, %d)\n" % ("Scope Extent pts:", pts.begin(), pts.end()))
      if self.rowcol:
        row1, col1 = self.view.rowcol(pts.begin())
        row2, col2 = self.view.rowcol(pts.end())
        self.scope_bfr.append(
          "%-25s (line: %d char: %d, line: %d char: %d)\n" % ("Scope Extent row/col:", row1 + 1, col1 + 1, row2 + 1, col2 + 1)
        )
    scope = self.view.scope_name(pt)

    if self.clipboard:
      self.clips.append(scope)

    if self.first and self.show_statusbar:
      self.status = scope
      self.first = False

    # self.scope_bfr.append("%-25s %s\n\n" % ("Scope:", scope))
    self.scope_bfr.append("%s\n\n" % "\n".join(scope.split()))
