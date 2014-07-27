# encoding: utf-8

preferences 'Comments' => 'source.java' do
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  uuid "FBA964F9-EA31-44D1-A5FD-AE8AB3FF8954"
end

preferences 'Folding (Java)' => 'source.java', file: 'Folding - Java' do
  folding_start_marker %r'(\{\s*(//.*)?$|^\s*// \{\{\{)'
  folding_stop_marker %r'^\s*(\}|// \}\}\}$)'
  uuid "6DF65B4B-D1A2-4B9C-9821-8B81EC3DA8FA"
end

preferences 'Folding (JSP)' => 'text.html.jsp', file: 'Folding - JSP' do
  folding_start_marker %r'/\*\*|\{\s*$'
  folding_stop_marker %r'\*\*/|^\s*\}'
  uuid "2C5379EE-F0E8-410F-8E5F-362D5A85FDEE"
end

preferences 'Folding (JUnit)' => 'text.junit-test-report', file: 'Folding - JUnit' do
  folding_start_marker %r'(\{\s*(//.*)?$|^\s*// \{\{\{)'
  folding_stop_marker %r'^\s*(\}|// \}\}\}$)'
  uuid "D542DC17-5A9E-4DDF-B825-EC5C04F847B4"
end

preferences 'Indentation Rules' => 'source.java' do
  decrease_indent_pattern %r'^(.*\*/)?\s*\}|^\s*(public|private|protected):\s*$'
  increase_indent_pattern %r/^.*\{(\}|[^}"']*)$|^\s*(public|private|protected):\s*$/
  indent_next_line_pattern %r'^(?!\s*@\w+(\(|\s*$)|(.*[};:])?\s*(//|/\*.*\*/\s*$)).*[^\s;:{}]\s*$'
  uuid "20E93106-18CF-4BA3-9DA3-8F0C955DB774"
end

preferences 'Comments: Properties File' => 'source.java-properties', file: 'Java Properties Comments' do
  shell_variable 'TM_COMMENT_START', '# '
  shell_variable 'TM_COMMENT_START_2', '! '
  uuid "CD9D5650-7188-498F-9305-1BA9D8D8D27F"
end

preferences 'Symbol List: Classes' => 'source.java meta.class meta.class.identifier' do
  show_in_symbol_list true
  uuid "22E489AE-989E-4A76-9C18-89944CF5013D"
end

preferences 'Symbol List: Inner Class Methods' => 'source.java meta.class.body meta.class.body meta.method.identifier' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/\s{2,}/ /g;
    s/.*/    $0/g;
  TXT
  uuid "11D7DA6F-1AE7-4BC7-BB5E-8DF05984FEEE"
end

preferences 'Symbol List: Inner Classes' => 'source.java meta.class.body meta.class.identifier' do
  show_in_symbol_list true
  symbol_transformation "s/.*/  $0/g"
  uuid "7A55A2BC-CD9D-4EBF-ABF4-3401AA64B7B3"
end

preferences 'Symbol List: Inner Inner Class Methods' => 'source.java meta.class.body meta.class.body meta.class.body meta.method.identifier' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/\s{2,}/ /g;
    s/.*/    $0/g;
  TXT
  uuid "FD0CE2DC-6D44-4E22-B4E5-C47C57F5B677"
end

preferences 'Symbol List: Inner Inner Classes' => 'source.java meta.class.body meta.class.body meta.class.identifier' do
  show_in_symbol_list true
  symbol_transformation "s/.*/    $0/g"
  uuid "C80430E0-F37F-448F-ACAE-D590C96C4EAD"
end

preferences 'Symbol List: Methods' => 'source.java meta.class.body meta.method.identifier', file: 'Symbol List˸ Method' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/\s{2,}/ /g;
    s/.*/  $0/g;
  TXT
  uuid "FA4CD3FA-A79B-43E3-A432-DA53DA4A060D"
end
