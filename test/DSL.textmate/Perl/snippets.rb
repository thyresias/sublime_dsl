# encoding: utf-8

snippets do

  default_scope 'source.perl'
  file_format :textmate

  key "^>", 'Hash Pointer', " => ", uuid: '4F1B9AE2-F90C-4A1B-B7D0-FE59D236B12B', file: 'hash pointer'

  tab 'class', 'Package', <<-'TXT', uuid: '4FB403FC-F441-447F-9AAD-E2BE13AD49ED', file: 'class'
package ${1:ClassName};

${2:use base qw(${3:ParentClass});

}sub new {
	my \$class = shift;
	\$class = ref \$class if ref \$class;
	my \$self = bless {}, \$class;
	\$self;
}

1;

TXT

  tab 'eval', 'Try/Except', <<-'TXT', uuid: '3A524B0E-C793-429A-AC49-6FB8370D4B77', file: 'eval'
eval {
	${1:# do something risky...}
};
if (\$@) {
	${2:# handle failure...}
}

TXT

  tab 'for', 'For Loop', <<-'TXT', uuid: 'B2A21D7E-F241-42D3-A6C4-5CA5470EC5C3', file: 'for'
for (my \$${1:var} = 0; \$$1 < ${2:expression}; \$$1++) {
	${3:# body...}
}

TXT

  tab 'fore', 'Foreach Loop', <<-'TXT', uuid: '92CEBA9A-D9C9-477B-9B34-931B0521EC79', file: 'foreach'
foreach ${1:my \$${2:x}} (@${3:array}) {
	${4:# body...}
}

TXT

  tab 'if', 'If', <<-'TXT', uuid: '07200FA1-0292-4B6B-853D-F35573A9C5C7', file: 'if'
if ($1) {
	${2:# body...}
}

TXT

  tab 'ife', 'If.…else', <<-'TXT', uuid: 'A970FC46-17DA-4B20-A6F7-866319A3DD70', file: 'Conditional if..else (ife)'
if ($1) {
	${2:# body...}
} else {
	${3:# else...}
}

TXT

  tab 'ifee', 'If…elsif…else', <<-'TXT', uuid: '4EA1224E-2FBA-496D-87F4-9C92CEC2F86F', file: 'Conditional if..elsif..else (ifee)'
if ($1) {
	${2:# body...}
} elsif ($3) {
	${4:# elsif...}
} else {
	${5:# else...}
}

TXT

  tab 'pl', '#!/usr/bin/env perl', <<-'TXT', scope: 'L:dyn.caret.begin.document', uuid: '34BC5CED-8468-476C-85E7-0E4F13809354', file: '#!˸usr˸bin˸env perl'
#!/usr/bin/env perl

TXT

  tab 'slurp', 'Read File', <<-'TXT', uuid: 'CEE866A5-FA4B-4C5D-A80C-137A620E825E', file: 'slurp'
my \$${1:var};
{ local \$/ = undef; local *FILE; open FILE, "<${2:file}"; \$$1 = <FILE>; close FILE }

TXT

  tab 'sub', 'Function', <<-'TXT', uuid: '4734090D-F23D-4D6B-8581-AC1E1B776DCD', file: 'Function (sub)'
sub ${1:function_name} {
	${2:# body...}
}

TXT

  tab 'test', 'Test', <<-'TXT', uuid: '1B0FB64D-63C1-469E-B0B6-945477603B01'
#!/usr/bin/perl -w

use strict;
use Test::More tests => ${1:1};
use ${2:ModuleName};

ok(${3:assertion});

TXT

  tab 'unless', 'Unless', <<-'TXT', uuid: '7E294411-67C5-4886-856F-B45F0510974E', file: 'unless'
unless ($1) {
	${2:# body...}
}

TXT

  tab 'while', 'While', <<-'TXT', uuid: '08C2210D-7F28-4FA6-93C6-D03D69A69EED', file: 'while'
while ($1) {
	${2:# body...}
}

TXT

  tab 'xfore', 'Foreach –  One Line', <<-'TXT', uuid: '0130788D-F714-4964-83A3-26EC0E01D3C9', file: 'Loop one-line (xforeach)'
${1:expression} foreach @${2:array};

TXT

  tab 'xif', 'If – One Line', <<-'TXT', uuid: 'EB212713-70FC-4948-AABD-C6E991060E93', file: 'Conditional one-line (xif)'
${1:expression} if ${2:condition};

TXT

  tab 'xunless', 'Unless – One Line', <<-'TXT', uuid: '991A53EE-9471-45EC-9D78-1258AB1BC2AC', file: 'Conditional one-line (unless)'
${1:expression} unless ${2:condition};

TXT

  tab 'xwhile', 'While – One LIne', <<-'TXT', uuid: '0154A96A-844C-4C8A-909E-A2ED822320EE', file: 'Loop one-line (xwhile)'
${1:expression} while ${2:condition};

TXT

end