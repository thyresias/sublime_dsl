# encoding: utf-8

preferences 'Comments' => 'source.java' do
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  uuid "FBA964F9-EA31-44D1-A5FD-AE8AB3FF8954"
end

preferences 'Completion Rules' => 'source.java' do
  # FIXME: (warning) nested repeat operator + and * was replaced with '*'
  cancel_completion %r/^\s*(\}?\s*(else|try|do|finally)|(class|package|enum)\s*[a-zA-Z_0-9]+*)$/
end

preferences 'Indentation Rules Annex' => 'source.java' do
  un_indented_line_pattern %r'^\s*((\*/|//| \*).*)?$'
end

preferences 'Indentation Rules' => 'source.java - comment' do
  decrease_indent_pattern %r'^(.*\*/)?\s*\}.*$|^\s*(public|private|protected):\s*$'
  increase_indent_pattern %r/^.*\{[^}"']*$|^\s*(public|private|protected):\s*$/
  bracket_indent_next_line_pattern %r/(?x)
    ^ \s* \b(if|while|else)\b [^;]* $
    | ^ \s* \b(for)\b .* $
    /
  uuid "20E93106-18CF-4BA3-9DA3-8F0C955DB774"
end

preferences 'Symbol List: Classes' => 'source.java meta.class meta.class.identifier', file: 'Symbol List%3A Classes' do
  show_in_symbol_list true
  uuid "22E489AE-989E-4A76-9C18-89944CF5013D"
end

preferences 'Symbol List: Inner Class Methods' => 'source.java meta.class.body meta.class.body meta.method.identifier', file: 'Symbol List%3A Inner Class Methods' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/\s{2,}/ /g;
    s/.*/    $0/g;
  TXT
  uuid "11D7DA6F-1AE7-4BC7-BB5E-8DF05984FEEE"
end

preferences 'Symbol List: Inner Classes' => 'source.java meta.class.body meta.class.identifier', file: 'Symbol List%3A Inner Classes' do
  show_in_symbol_list true
  symbol_transformation "s/.*/  $0/g"
  uuid "7A55A2BC-CD9D-4EBF-ABF4-3401AA64B7B3"
end

preferences 'Symbol List: Inner Inner Class Methods' => 'source.java meta.class.body meta.class.body meta.class.body meta.method.identifier', file: 'Symbol List%3A Inner Inner Class Methods' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/\s{2,}/ /g;
    s/.*/    $0/g;
  TXT
  uuid "FD0CE2DC-6D44-4E22-B4E5-C47C57F5B677"
end

preferences 'Symbol List: Inner Inner Classes' => 'source.java meta.class.body meta.class.body meta.class.identifier', file: 'Symbol List%3A Inner Inner Classes' do
  show_in_symbol_list true
  symbol_transformation "s/.*/    $0/g"
  uuid "C80430E0-F37F-448F-ACAE-D590C96C4EAD"
end

preferences 'Symbol List: Methods' => 'source.java meta.class.body meta.method.identifier', file: 'Symbol List%3A Method' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/\s{2,}/ /g;
    s/.*/  $0/g;
  TXT
  uuid "FA4CD3FA-A79B-43E3-A432-DA53DA4A060D"
end
