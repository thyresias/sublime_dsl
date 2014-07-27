# encoding: utf-8

snippets do

  default_scope 'text.html'

  # FIXME: name assigned from the file name
  tab 'html', 'html', <<-'TXT'
<html>
<head>
	<title>$1</title>
</head>
<body>
$0
</body>
</html>
TXT

end