# encoding: utf-8

preferences 'Folding' => 'source.scheme' do
  folding_start_marker %r/(?x)^ [ \t]* \(
    (?<par>
      ( [^()\n]++ | \( \g<par> \)? )*+
    )
  $/
  folding_stop_marker %r/^\s*$/
  uuid "E853BE87-67FC-4948-897B-A112F9B21D18"
end

preferences 'Miscellaneous' => 'source.scheme' do
  decrease_indent_pattern %r/(?x)^ [ \t]*+
    (?<par>
      ( [^()\n]++ | \( \g<par> \) )*+
    )
    ( \) [ \t]*+ ) ++
  $/
  increase_indent_pattern %r/(?x)^ [ \t]*+ \(
    (?<par>
      ( [^()\n]++ | \( \g<par> \)? )*+
    )
  $/
  shell_variable 'TM_COMMENT_START', ';'
  smart_typing_pairs "\"\" () {} []"
  uuid "08AF3E95-4BF0-4F28-BC76-31B9424A20CE"
end
