# encoding: utf-8

preferences 'Comments' => 'source.asp' do
  shell_variable 'TM_COMMENT_START', '\''
  uuid "D7521F79-A6B1-4682-BABB-2CF601BBF02B"
end

preferences 'Folding (ASP)' => 'source.asp', file: 'Folding - ASP' do
  folding_start_marker %r/(?i)^\s*(Public|Private)?\s*(Class|Function|Sub|Property)\s*([a-zA-Z_]\w*)\s*(\(.*\)\s*)?$/
  folding_stop_marker %r/(?i)^\s*End (Class|Function|Sub|Property)\s*$/
  uuid "991BE858-1328-44F9-80A8-28EA3B9284EF"
end

preferences 'Folding (HTML - ASP)' => 'text.html.asp', file: 'Folding - HTML-ASP' do
  folding_start_marker %r/(<(?i:(head|table|div|style|script|ul|ol|form|dl))\b.*?>|\{)/
  folding_stop_marker %r'(</(?i:(head|table|div|style|script|ul|ol|form|dl))>|\})'
  uuid "3361CAD9-B3AB-48EF-B6D1-1DA692C32140"
end
