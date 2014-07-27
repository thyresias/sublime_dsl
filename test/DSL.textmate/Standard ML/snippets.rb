# encoding: utf-8

snippets do

  default_scope 'source.ml'
  file_format :textmate

  tab 'fs', 'Base Funsig', <<-'TXT', uuid: '3C345A84-3C76-4D6B-9E21-9BE9C99BF4A4'
funsig $1 ($2) =
sig
	$3
end
TXT

  tab 'functor', 'Base Functor', <<-'TXT', uuid: '37C2F4AF-A285-4455-BE67-579CE6612A09'
functor $1($2) : $3 =
struct
	$4
end
TXT

  tab 'itos', 'itos', <<-'TXT', uuid: '10EB8449-D6DC-483F-8E6F-D354280BDD6D'
Int.toString $1
TXT

  tab 'rbm', 'RedBlackMap', <<-'TXT', uuid: '11C8B9AA-1C41-479A-800D-EEE0465BF9CD'
structure ${1:Map} = RedBlackMapFn(struct
                                          type ord_key = $2
                                          val compare = $3
                                    end)
TXT

  tab 'rbs', 'RedBlackSet', <<-'TXT', uuid: '292E34A2-BD32-4BD2-8B17-1B1B1A5099DC'
structure ${1:Set} = RedBlackSetFn (struct
                                           type ord_key = $2
									 val compare = $3
                                    end)

TXT

  tab 'sig', 'Base Signature', <<-'TXT', scope: 'source.ml, source.sig', uuid: '21E2CB12-84F2-48DF-A99B-0266CD96C439'
signature $1 =
sig
	$2
end
TXT

  tab 'struct', 'Base Structure', <<-'TXT', uuid: 'E757D38B-C220-4E37-9F23-52B9B23BAB36'
structure $1 =
struct
	$2
end
TXT

end