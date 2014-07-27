# encoding: utf-8

snippets do

  default_scope 'source.logtalk'
  file_format :textmate

  # FIXME: no tab trigger nor key equivalent
  key nil, '    Category with protocol', <<-'TXT', uuid: '8A263B8A-73F7-11D9-8083-000D93589AF6', file: 'Category with protocol'

:- category(${1:Category},
	implements(${2:Protocol})).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${3:Description}']).

$0

:- end_category.

TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, '    Class with all', <<-'TXT', uuid: '8A26A112-73F7-11D9-8083-000D93589AF6', file: 'Class with all'

:- object(${1:Class},
	implements(${2:Protocol}),
	imports(${3:Category}),
	instantiates(${4:Metaclass}),
	specializes(${5:Superclass})).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${6:Description}']).

$0

:- end_object.

TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, '    Class with category', <<-'TXT', uuid: '8A26CCD5-73F7-11D9-8083-000D93589AF6', file: 'Class with category'

:- object(${1:Class},
	imports(${2:Category}),
	specializes(${3:Superclass})).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${4:Description}']).

$0

:- end_object.

TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, '    Class with metaclass', <<-'TXT', uuid: '8A270068-73F7-11D9-8083-000D93589AF6', file: 'Class with metaclass'

:- object(${1:Class},
	instantiates(${2:Metaclass}),
	specializes(${3:Superclass})).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${4:Description}']).

$0

:- end_object.

TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, '    Class with protocol', <<-'TXT', uuid: '8A272A62-73F7-11D9-8083-000D93589AF6', file: 'Class with protocol'

:- object(${1:Class},
	implements(${2:Protocol}),
	specializes(${3:Superclass})).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${4:Description}']).

$0

:- end_object.

TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, '    Extended protocol', <<-'TXT', uuid: '8A277A4C-73F7-11D9-8083-000D93589AF6', file: 'Extended protocol'

:- protocol(${1:Extended},
	extends(${2:Minimal})).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${3:Description}']).

$0

:- end_protocol.

TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, '    Instance with all', <<-'TXT', uuid: '8A27A016-73F7-11D9-8083-000D93589AF6', file: 'Instance with all'

:- object(${1:Instance},
	implements(${2:Protocol}),
	imports(${3:Category}),
	instantiates(${4:Class})).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${5:Description}']).

$0

:- end_object.

TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, '    Instance with category', <<-'TXT', uuid: '8A27C6D7-73F7-11D9-8083-000D93589AF6', file: 'Instance with category'

:- object(${1:Instance},
	imports(${2:Category}),
	instantiates(${3:Class})).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${4:Description}']).

$0

:- end_object.

TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, '    Instance with protocol', <<-'TXT', uuid: '8A27EAEC-73F7-11D9-8083-000D93589AF6', file: 'Instance with protocol'

:- object(${1:Instance},
	implements(${2:Protocol}),
	instantiates(${3:Class})).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${4:Description}']).

$0

:- end_object.

TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, '    Prototype with all', <<-'TXT', uuid: '8A28E048-73F7-11D9-8083-000D93589AF6', file: 'Prototype with all'

:- object(${1:Prototype},
	implements(${2:Protocol}),
	imports(${3:Category}),
	extends(${4:Parent})).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${5:Description}']).

$0

:- end_object.

TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, '    Prototype with category', <<-'TXT', uuid: '8A290A27-73F7-11D9-8083-000D93589AF6', file: 'Prototype with category'

:- object(${1:Prototype},
	imports(${2:Category})).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${3:Description}']).

$0

:- end_object.

TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, '    Prototype with parent', <<-'TXT', uuid: '8A292E31-73F7-11D9-8083-000D93589AF6', file: 'Prototype with parent'

:- object(${1:Prototype},
	extends(${2:Parent})).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${3:Description}']).

$0

:- end_object.

TXT

  # FIXME: no tab trigger nor key equivalent
  key nil, '    Prototype with protocol', <<-'TXT', uuid: '8A29547D-73F7-11D9-8083-000D93589AF6', file: 'Prototype with protocol'

:- object(${1:Prototype},
	implements(${2:Protocol})).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${3:Description}']).

$0

:- end_object.

TXT

  tab 'category', 'Category', <<-'TXT', uuid: '8A2679C6-73F7-11D9-8083-000D93589AF6'

:- category(${1:Category}).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${2:Description}']).

$0

:- end_category.

TXT

  tab 'class', 'Class', <<-'TXT', uuid: '8A275494-73F7-11D9-8083-000D93589AF6'

:- object(${1:Class},
	specializes(${2:Superclass})).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${3:Description}']).

$0

:- end_object.

TXT

  tab 'instance', 'Instance', <<-'TXT', uuid: '8A2814B5-73F7-11D9-8083-000D93589AF6'

:- object(${1:Instance},
	instantiates(${2:Class})).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${3:Description}']).

$0

:- end_object.

TXT

  tab 'object', 'Prototype', <<-'TXT', uuid: '8A298BE0-73F7-11D9-8083-000D93589AF6'

:- object(${1:Object}).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${2:Description}']).

$0

:- end_object.

TXT

  tab 'private', 'Private predicate', <<-'TXT', uuid: '8A284660-73F7-11D9-8083-000D93589AF6'
	:- private(${1:Functor}/${2:Arity}).
	:- mode(${1:Functor}(${3:Arguments}), ${4:Solutions}).
	:- info(${1:Functor}/${2:Arity}, [
		comment is '${5:Description}',
		arguments is ['$6'-'$7']]).

$0
TXT

  tab 'private0', '    (with no arguments)', <<-'TXT', uuid: 'DBFDEDF5-7F59-11D9-BA7A-000A95DAA580', file: 'Private predicate (no arguments)'
	:- private(${1:Functor}/0).
	:- mode(${1:Functor}, ${2:Solutions}).
	:- info(${1:Functor}/0, [
		comment is '${3:Description}']).

$0
TXT

  tab 'protected', 'Protected predicate', <<-'TXT', uuid: '8A286F7E-73F7-11D9-8083-000D93589AF6'
	:- protected(${1:Functor}/${2:Arity}).
	:- mode(${1:Functor}(${3:Arguments}), ${4:Solutions}).
	:- info(${1:Functor}/${2:Arity}, [
		comment is '${5:Description}',
		arguments is ['$6'-'$7']]).

$0
TXT

  tab 'protected0', '    (with no arguments)', <<-'TXT', uuid: '4A25F29C-7F59-11D9-BA7A-000A95DAA580', file: 'Protected predicate (no arguments)'
	:- protected(${1:Functor}/0).
	:- mode(${1:Functor}, ${2:Solutions}).
	:- info(${1:Functor}/0, [
		comment is '${3:Description}']).

$0
TXT

  tab 'protocol', 'Protocol', <<-'TXT', uuid: '8A28B0F6-73F7-11D9-8083-000D93589AF6'

:- protocol(${1:Protocol}).

	:- info([
		version is 1.0,
		author is '$TM_FULLNAME',
		date is `date +%Y/%m/%d`,
		comment is '${2:Description}']).

$0

:- end_protocol.

TXT

  tab 'public', 'Public predicate', <<-'TXT', uuid: '8A29B12E-73F7-11D9-8083-000D93589AF6'
	:- public(${1:Functor}/${2:Arity}).
	:- mode(${1:Functor}(${3:Arguments}), ${4:Solutions}).
	:- info(${1:Functor}/${2:Arity}, [
		comment is '${5:Description}',
		arguments is ['$6'-'$7']]).

$0
TXT

  tab 'public0', '    (with no arguments)', <<-'TXT', uuid: 'D96B0926-7F56-11D9-BA7A-000A95DAA580', file: 'Public predicate (no arguments)'
	:- public(${1:Functor}/0).
	:- mode(${1:Functor}, ${2:Solutions}).
	:- info(${1:Functor}/0, [
		comment is '${3:Description}']).

$0
TXT

end