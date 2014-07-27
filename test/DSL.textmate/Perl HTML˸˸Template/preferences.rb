# encoding: utf-8

preferences 'Folding' => 'text.html.html-template' do
  folding_start_marker %r'(<(?i:(head|table|tr|div|style|script|ul|ol|form|dl))\b.*?>|^ *<(?i:TMPL_(?:LOOP|UNLESS|IF))\b(?!.*</(?i:TMPL_(?:LOOP|UNLESS|IF))>))'
  folding_stop_marker %r'(</(?i:(head|table|tr|div|style|script|ul|ol|form|dl))>|^ *</(?i:TMPL_(?:LOOP|UNLESS|IF)) *>)'
  uuid "83D3F1F1-D138-41D2-911F-DD3940E7477D"
end
