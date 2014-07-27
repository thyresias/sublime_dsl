import re, sublime, sublime_plugin

class ReduceIndentCommand(sublime_plugin.TextCommand):
  def run(self, edit):
    edit = self.view.begin_edit('reduce_indent')
    self.view.run_command('expand_tabs', {"set_translate_tabs": True})
    for region in self.view.sel():
      region = self.view.line(region)   # extend to BOL & EOL
      offset = 0
      for line in self.view.lines(region):
        line = sublime.Region(line.begin() + offset, line.end() + offset)
        text = self.view.substr(line)
        match = re.search(r'^\s+', text)
        if match:
          indent = match.group()
          half_indent = len(indent) / 2
          if half_indent:
            r = sublime.Region(line.begin(), line.begin() + half_indent)
            self.view.erase(edit, r)
            offset -= half_indent
    self.view.end_edit(edit)
