# encoding: utf-8

snippets do

  default_scope 'source.js.objj'
  file_format :textmate

  tab '_acc', '_Accessors', "- (${1:id})${2:thing}\n{\n\treturn _$2;\n}\n\n- (void)set${2/./\\u$0/}:($1)aValue\n{\n\t_$2 = aValue; \n}", uuid: '85B0746B-AE1C-47B3-8B9A-2B9A95F4C71E'

  tab 'acc', 'Accessors', "- (${1:id})${2:thing}\n{\n\treturn $2;\n}\n\n- (void)set${2/./\\u$0/}:($1)aValue\n{\n\t$2 = aValue; \n}", uuid: 'AA41BEF8-5F81-4A5A-85DE-2E81A112778B'

  tab 'cla', 'Class', <<-'TXT', uuid: '96C39647-4346-4750-9F96-58070F24EDE6'
@implementation ${1:class} : ${2:CPObject}
{
}

- (id)init
{
	if(self = [super init])
	{$0
	}
	return self;
}

@end

TXT

end