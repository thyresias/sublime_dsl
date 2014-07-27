# encoding: utf-8

snippets do

  default_scope 'source.perl'

  tab 'class', 'Package', <<-'TXT', file: 'class'
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

  tab 'eval', 'Try/Except', <<-'TXT', file: 'eval'
eval {
	${1:# do something risky...}
};
if (\$@) {
	${2:# handle failure...}
}

TXT

  tab 'for', 'Loop', <<-'TXT', file: 'for'
for (my \$${1:var} = 0; \$$1 < ${2:expression}; \$$1++) {
	${3:# body...}
}

TXT

  tab 'fore', 'Loop', <<-'TXT', file: 'foreach'
foreach ${1:my \$${2:x}} (@${3:array}) {
	${4:# body...}
}

TXT

  tab 'if', 'Conditional', <<-'TXT', file: 'if'
if ($1) {
	${2:# body...}
}

TXT

  tab 'ife', 'Conditional if..else', <<-'TXT', file: 'Conditional-if..else-(ife)'
if ($1) {
	${2:# body...}
} else {
	${3:# else...}
}

TXT

  tab 'ifee', 'Conditional if..elsif..else', <<-'TXT', file: 'Conditional-if..elsif..else-(ifee)'
if ($1) {
	${2:# body...}
} elsif ($3) {
	${4:# elsif...}
} else {
	${5:# else...}
}

TXT

  tab 'slurp', 'Read File', <<-'TXT', file: 'slurp'
my \$${1:var};
{ local \$/ = undef; local *FILE; open FILE, "<${2:file}"; \$$1 = <FILE>; close FILE }

TXT

  tab 'sub', 'Function', <<-'TXT', file: 'Function-(sub)'
sub ${1:function_name} {
	${2:# body...}
}

TXT

  tab 'test', 'Test', <<-'TXT'
#!/usr/bin/perl -w

use strict;
use Test::More tests => ${1:1};
use ${2:ModuleName};

ok(${3:assertion});

TXT

  tab 'unless', 'Conditional', <<-'TXT', file: 'unless'
unless ($1) {
	${2:# body...}
}

TXT

  tab 'while', 'Loop', <<-'TXT', file: 'while'
while ($1) {
	${2:# body...}
}

TXT

  tab 'xfore', 'Loop One-line', <<-'TXT', file: 'Loop-one-line-(xforeach)'
${1:expression} foreach @${2:array};

TXT

  tab 'xif', 'Conditional One-line', <<-'TXT', file: 'Conditional-one-line-(xif)'
${1:expression} if ${2:condition};

TXT

  tab 'xunless', 'Conditional One-line', <<-'TXT', file: 'Conditional-one-line-(unless)'
${1:expression} unless ${2:condition};

TXT

  tab 'xwhile', 'Loop One-line', <<-'TXT', file: 'Loop-one-line-(xwhile)'
${1:expression} while ${2:condition};

TXT

end