# encoding: utf-8

preferences 'Comments' => 'source.coffee, source.litcoffee, source.coffee.md', file: 'CoffeeScript' do
  shell_variable 'TM_COMMENT_START', '# '
  shell_variable 'TM_COMMENT_START_2', '###'
  shell_variable 'TM_COMMENT_END_2', '###'
  uuid "0A92C6F6-4D73-4859-B38C-4CC19CBC191F"
end

preferences 'Disable Indent Corrections' => 'source.coffee' do
  disable_indent_corrections true
  indent_on_paste "simple"
  uuid "5E57C0C3-77D5-4809-A131-F777EE264908"
end

preferences 'Folding' => 'source.coffee -(source.coffee string)' do
  folding_indented_block_start %r/(?x)
  \b class \b |           # class definition
  [=-]> \s* (\#.*)? $     # line-ending function arrow
  /
  uuid "A6FC6CDA-1572-4D42-A8F0-D96048D49873"
end

preferences 'Indent' => 'source.coffee' do
  decrease_indent_pattern %r/^\s*(\}|\]|else|catch|finally)$/
  increase_indent_pattern %r'(?x)
    ^\s*
    (.*class
    |[a-zA-Z\$_](\w|\$|:|\.)*\s*(?=\:(\s*\(.*\))?\s*((=|-)>\s*$)) # function that is not one line
    |[a-zA-Z\$_](\w|\$|\.)*\s*(:|=)\s*((if|while)(?!.*?then)|for|$) # assignment using multiline if/while/for
    |(if|else|unless|while)\b(?!.*?then)|for|loop\b
    |(try|finally|catch\s+\S.*)\s*$
    |.*[-=]>$
    |.*[\{\[]$)'
  uuid "C5D6C716-12FE-4CE8-A916-6CABEDE8AFE7"
end

preferences 'Symbol List: Method' => 'source.coffee meta.function.coffee', file: 'Symbol List Method 2' do
  show_in_symbol_list true
  symbol_transformation 's/^\s*([a-zA-Z\$_]+)\s*=/$2/'
  uuid "419D24D8-0DD6-4D9A-8CA0-6D9CD740BEEC"
end

preferences 'Symbol List: Method Instance' => 'source.coffee entity.name.type.instance', file: 'Symbol List Method' do
  show_in_symbol_list false
  uuid "B087AF2F-8946-4EA9-8409-49E7C4A2EEF0"
end
