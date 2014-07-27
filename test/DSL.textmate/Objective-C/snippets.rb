# encoding: utf-8

snippets do

  default_scope 'source.objc, source.objc++'
  file_format :textmate

  tab 'acc', 'Interface: Accessors for Primitive Type', <<-'TXT', scope: 'source.objc meta.scope.interface, source.objc++ meta.scope.interface', uuid: 'BA432891-294B-47A4-BECF-F3C95B3766C1', file: 'Scalar Accessors Interface (acc)'
- (${1:unsigned int})${2:thing};
- (void)set${2/./\u$0/}:($1)new${2/./\u$0/};
TXT

  tab 'acc', 'Primitive Type', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: 'DADC6C91-415F-463A-9C24-7A059BB5EE56', file: 'Scalar Accessors (acc)'
- (${1:unsigned int})${2:thing}
{
	return ${3:$2};
}

- (void)set${2/./\u$0/}:(${1:unsigned int})new${2/./\u$0/}
{
	$3 = new${2/./\u$0/};
}
TXT

  tab 'alert', 'NSRunAlertPanel', <<-'TXT', uuid: '9EF84198-BDAF-11D9-9140-000D93589AF6', file: 'NSRunAlertPanel (alert)'
NSInteger choice = NSRunAlertPanel(@"${1:Something important!}", @"${2:Something important just happend, and now I need to ask you, do you want to continue?}", @"${3:Continue}", @"${4:Cancel}", nil);
if(choice == NSAlertDefaultReturn) // "${3:Continue}"
{
	$0;
}
else if(choice == NSAlertAlternateReturn) // "${4:Cancel}"
{

}
TXT

  tab 'arracc', 'Interface: Accessors for KVC Array', <<-'TXT', scope: 'source.objc meta.scope.interface, source.objc++ meta.scope.interface', uuid: 'C125E6DB-7FB5-4B19-8648-0A5617B1B5BC', file: 'LoD array interface (arracc)'
- (void)addObjectTo${1:Things}:(${2:id})anObject;
- (void)insertObject:($2)anObject in$1AtIndex:(unsigned int)i;
- ($2)objectIn$1AtIndex:(unsigned int)i;
- (unsigned int)indexOfObjectIn$1:($2)anObject;
- (void)removeObjectFrom$1AtIndex:(unsigned int)i;
- (unsigned int)countOf$1;
- (NSArray${TM_C_POINTER/(^(.+?)\s*$)?/(?1:$2: *)/})${1/./\l$0/};
- (void)set$1:(NSArray${TM_C_POINTER/(^(.+?)\s*$)?/(?1:$2: *)/})new$1;
TXT

  tab 'arracc', 'KVC Array', "- (void)addObjectTo${1:Things}:(${2:id})anObject\n{\n\t[${3:${1/./\\l$0/}} addObject:anObject];\n}\n\n- (void)insertObject:($2)anObject in$1AtIndex:(unsigned int)i \n{\n\t[$3 insertObject:anObject atIndex:i];\n}\n\n- ($2)objectIn$1AtIndex:(unsigned int)i\n{\n\treturn [$3 objectAtIndex:i];\n}\n\n- (unsigned int)indexOfObjectIn$1:($2)anObject\n{\n\treturn [$3 indexOfObject:anObject];\n}\n\n- (void)removeObjectFrom$1AtIndex:(unsigned int)i\n{\n\t[$3 removeObjectAtIndex:i];\n}\n\n- (unsigned int)countOf$1\n{\n\treturn [$3 count];\n}\n\n- (NSArray${TM_C_POINTER/(^(.+?)\\s*$)?/(?1:$2: *)/})${1/./\\l$0/}\n{\n\treturn $3;\n}\n\n- (void)set$1:(NSArray${TM_C_POINTER/(^(.+?)\\s*$)?/(?1:$2: *)/})new$1\n{\n\t[$3 setArray:new$1];\n}", scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: 'DECC6BAC-94AF-429A-8609-D101C940D18D', file: 'LoD array (arracc)'

  tab 'array', 'NSArray', <<-'TXT', uuid: 'BC8B9CAD-5F16-11D9-B9C3-000D93589AF6', file: '030 NSArray (array)'
NSMutableArray${TM_C_POINTER: *}${1:array} = [NSMutableArray array];
TXT

  tab 'bez', 'NSBezierPath', <<-'TXT', uuid: '917BA9ED-9A62-11D9-9A65-000A95A89C98', file: 'NSBezierPath (bez)'
NSBezierPath${TM_C_POINTER: *}${1:path} = [NSBezierPath bezierPath];
$0
TXT

  tab 'bind', 'Bind Property to Key Path of Object', <<-'TXT', uuid: '59FC2842-A645-11D9-B2CB-000D93589AF6', file: 'Key˸value binding (bind)'
bind:@"${2:binding}" toObject:${3:observableController} withKeyPath:@"${4:keyPath}" options:${5:nil}
TXT

  tab 'cat', 'Category', <<-'TXT', uuid: '27AC6270-9900-11D9-9BB8-000A95A89C98', file: 'Category (cat)'
@interface ${1:${TM_FILENAME/.*?(\w+).*|.*/(?1:$1:NSObject)/}} (${2:${TM_FILENAME/.*?\w+\W+(\w+).*\..+|.*/(?1:$1:Category)/}})
@end

@implementation $1 ($2)
$0
@end
TXT

  tab 'cath', 'Category Interface', <<-'TXT', uuid: '596B13EC-9900-11D9-9BB8-000A95A89C98', file: 'Category Interface Only (cati)'
@interface ${1:${TM_FILENAME/.*?(\w+).*|.*/(?1:$1:NSObject)/}} (${2:${TM_FILENAME/.*?\w+\W+(\w+).*\..+|.*/(?1:$1:Category)/}})
$0
@end
TXT

  tab 'catm', 'Category Implementation', <<-'TXT', uuid: '3E270C37-E7E2-4D1D-B28F-CEDD8DE0041C'
@implementation ${1:${TM_FILENAME/.*?(\w+).*|.*/(?1:$1:NSObject)/}} (${2:${TM_FILENAME/.*?\w+\W+(\w+).*\..+|.*/(?1:$1:Category)/}})
$0
@end
TXT

  tab 'cdacc', 'CoreData', <<-'TXT', uuid: '563B2FDB-A163-46FE-9380-4178EFC1AD14', file: 'CoreData Accessors Implementation'
- (${1:id})${2:attribute}
{
	[self willAccessValueForKey:@"${2: attribute}"];
	${1:id} value = [self primitiveValueForKey:@"${2: attribute}"];
	[self didAccessValueForKey:@"${2: attribute}"];
	return value;
}

- (void)set${2/./\u$0/}:($1)aValue
{
	[self willChangeValueForKey:@"${2: attribute}"];
	[self setPrimitiveValue:aValue forKey:@"${2: attribute}"];
	[self didChangeValueForKey:@"${2: attribute}"];
}
TXT

  tab 'cl', 'Class', <<-'TXT', scope: 'source.objc, source.objc++ - meta.scope.implementation.objc', uuid: 'BC8B9C24-5F16-11D9-B9C3-000D93589AF6', file: '020 Class (objc)'
@interface ${1:${TM_FILENAME/\...*$|(^$)/(?1:object)/}} : ${2:NSObject}
{
}
@end

@implementation $1
- (id)init
{
	if((self = [super init]))
	{$0
	}
	return self;
}
@end
TXT

  tab 'clh', 'Class Interface', <<-'TXT', uuid: '06F15373-9900-11D9-9BB8-000A95A89C98', file: 'Class Interface Only (classi)'
@interface ${1:${TM_FILENAME/\...*$|(^$)/(?1:object)/}} : ${2:NSObject}
{$3
}
$0
@end
TXT

  tab 'clm', 'Class Implementation', <<-'TXT', uuid: 'BE0B2832-D88E-40BF-93EE-281DDA93840B'
@implementation ${1:${TM_FILENAME/\...*$|(^$)/(?1:object)/}}
- (id)init
{
	if((self = [super init]))
	{$0
	}
	return self;
}
@end
TXT

  tab 'delegate', 'Delegate Responds to Selector', <<-'TXT', uuid: '622842E6-11F7-4D7B-A322-F1B8A1FE8CE5'
if([${1:[self delegate]} respondsToSelector:@selector(${2:selfDidSomething:})])
	[$1 ${3:${2/((^\s*([A-Za-z0-9_]*:)\s*)|(:\s*$)|(:\s*))/(?2:$2self :\:<>)(?4::)(?5: :)/g}}];

TXT

  tab 'dict', 'NSDictionary', <<-'TXT', uuid: 'BC8B9D3A-5F16-11D9-B9C3-000D93589AF6', file: '040 NSDictionary (dict)'
NSMutableDictionary${TM_C_POINTER: *}${1:dict} = [NSMutableDictionary dictionary];
TXT

  tab 'focus', 'Lock Focus', <<-'TXT', uuid: '3F57DB1B-9373-46A6-9B6E-19F2D25658DE'
[self lockFocus];
$0
[self unlockFocus];
TXT

  tab 'forin', 'for(… in …)', <<-'TXT', uuid: 'B47D188C-C0F7-4C53-A6ED-9EFE09371F37'
for(${1:id} ${2:item} in ${3:array})
{
	$0
}
TXT

  tab 'format', 'NSString With Format', <<-'TXT', uuid: 'B07879C7-F1E0-4606-93F1-1A948965CD0E', file: 'NSString stringWithFormat (format)'
[NSString stringWithFormat:@"$1", $2]$0
TXT

  tab 'getprefs', 'Read Defaults Value', <<-'TXT', uuid: '3EF96A1F-B597-11D9-A114-000D93589AF6', file: 'Read from defaults (getprefs)'
[[NSUserDefaults standardUserDefaults] objectForKey:${1:key}];
TXT

  tab 'gsave', 'Save and Restore Graphics Context', <<-'TXT', uuid: 'F2D5B215-2C10-40BC-B973-0A859A3E3CBD', file: 'Save and Restore Graphics Context (gsave)'
[NSGraphicsContext saveGraphicsState];
$0
[NSGraphicsContext restoreGraphicsState];

TXT

  tab 'I', 'Method: Initialize', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: '366DBAB0-554B-4A38-966E-793DFE13A1EC', file: 'Initialize Implementation (I)'
+ (void)initialize
{
	[[NSUserDefaults standardUserDefaults] registerDefaults:@{
		$0@"key" : @"value",
	}];
}
TXT

  tab 'ibo', 'IBOutlet', <<-'TXT', uuid: '30C260A7-AFB1-11D9-9D48-000D93589AF6', file: 'IBOutlet (ibo)'
IBOutlet ${1:NSSomeClass}${TM_C_POINTER: *}${2:${1/^[A-Z](?:[A-Z]+|[a-z]+)([A-Z]\w*)/\l$1/}};
TXT

  tab 'imp', '#import "…"', <<-'TXT', uuid: '1E3A92DA-7299-11D9-813A-000D93589AF6', file: '#import ʺʺ (imp)'
#import "${1:${TM_FILENAME/\...*$/.h/}}"
TXT

  tab 'Imp', '#import <…>', <<-'TXT', uuid: '20241464-7299-11D9-813A-000D93589AF6', file: '#import ˂˃ (Imp)'
#import <${1:Cocoa/Cocoa.h}>
TXT

  tab 'log', 'NSLog(.., _cmd)', <<-'TXT', scope: 'source.objc meta.scope.implementation, source.objc++ meta.scope.implementation', uuid: 'A3555C49-D367-4CF5-8032-13B291820CD3', file: 'NSLog(.., _cmd) (log)'
NSLog(@"%s$1", sel_getName(_cmd)${1/[^%]*(%)?.*/(?1:, :\);)/}$2${1/[^%]*(%)?.*/(?1:\);)/}
TXT

  tab 'log', 'NSLog(…)', <<-'TXT', uuid: '1251B7E8-6BF0-11D9-8384-000D93589AF6', file: 'NSLog (log) 2'
NSLog(@"$1"${1/[^%]*(%)?.*/(?1:, :\);)/}$2${1/[^%]*(%)?.*/(?1:\);)/}
TXT

  tab 'M', 'Class Method', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: '1251B9E2-6BF0-11D9-8384-000D93589AF6', file: 'Class Method (M)'
+ (${1:id})${2:method}${3::(${4:id})${5:${4/(NS([AEIOQUY])?(\w+).*)|(.)?.*/(?1:a(?2:n$2)$3:(?4:anArgument))/}}}
{$0${1/^(void|IBAction)$|(.*)/(?2:
	return nil;)/}
}
TXT

  tab 'M', 'Interface: Class Method', <<-'TXT', scope: 'source.objc meta.scope.interface, source.objc++ meta.scope.interface', uuid: '9D01148D-1073-40D2-936E-FFF67580D2B3', file: 'Class Method Interface (M)'
+ (${1:id})${0:method};
TXT

  tab 'm', 'Interface: Method', <<-'TXT', scope: 'source.objc meta.scope.interface, source.objc++ meta.scope.interface', uuid: '325B0A2B-5939-4805-80A1-6DED5B373283', file: 'Method Interface (m)', key_equivalent: "^M"
- (${1:id})${2:${TM_SELECTED_TEXT:method}}${3::(${4:id})${5:${4/(NS([AEIOQUY])?(\w+).*)|(.)?.*/(?1:a(?2:n$2)$3:(?4:anArgument))/}}};
TXT

  tab 'm', 'Method', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: 'BC8B9DD7-5F16-11D9-B9C3-000D93589AF6', file: '050 Method (m)', key_equivalent: "^M"
- (${1:id})${2:${TM_SELECTED_TEXT:method}}${3::(${4:id})${5:${4/(NS([AEIOQUY])?(\w+).*)|(.)?.*/(?1:a(?2:n$2)$3:(?4:anArgument))/}}}
{$0${1/^(void|IBAction)$|(.*)/(?2:
	return nil;)/}
}
TXT

  tab 'objacc', 'Interface: Accessors for Object', <<-'TXT', scope: 'source.objc meta.scope.interface, source.objc++ meta.scope.interface', uuid: '013BFEBB-A744-46F1-94A5-F851635E00FA', file: 'Object Accessors Interface (objacc)'
- (${1:id})${2:thing};
- (void)set${2/./\u$0/}:($1)aValue;
TXT

  tab 'objacc', 'Object', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: '65844040-1D13-4F29-98CC-E742F151527F', file: '090 Object Accessors (objacc)'
- (${1:id})${2:thing}
{
	return $2;
}

- (void)set${2/./\u$0/}:($1)aValue
{
	$0${1/( \*)?$/(?1:$1: )/}old${2/./\u$0/} = $2;
	$2 = [aValue retain];
	[old${2/./\u$0/} release];
}
TXT

  tab 'obs', 'Register for Notification', <<-'TXT', scope: 'source.objc meta.scope.implementation, source.objc++ meta.scope.implementation', uuid: 'E8107901-70F1-45D9-8633-81BD5E57CC89'
[[NSNotificationCenter defaultCenter] addObserver:${1:self} selector:@selector(${3:${2/^([A-Z]{2})?(.+?)(Notification)?$/\l$2/}}:) name:${2:NSWindowDidBecomeMainNotification} object:${4:nil}];
TXT

  tab 'pool', 'Autorelease Pool', <<-'TXT', uuid: 'D402B10A-149B-414D-9961-110880389A8E', file: 'NSAutoreleasePool (pool)'
@autoreleasepool {
    $0
}
TXT

  tab 'pro', 'Protocol', <<-'TXT', uuid: 'B638A0D2-1B84-4932-99D4-3134230C3EC8'
@protocol ${1:${2:${TM_FILENAME:?${TM_FILENAME/\..+$//}:My}}Delegate}${3: <NSObject>}
$0
@optional
@end
TXT

  tab 'prop', 'Property (Objective-C 2.0)', <<-'TXT', scope: 'source.objc meta.scope.interface, source.objc++ meta.scope.interface', uuid: 'EE603767-8BA3-4F54-8DE5-0C9E64BE5DF7', file: 'Property'
@property (${2:nonatomic${1/.+/, /}}${1|readonly,weak,strong,copy,retain,assign|}) ${3:NSSomeClass}${3/^((?!NS(U?Integer|Point|Size|Rect)|C[GF]|BOOL|SEL)[A-Z]\w*)|.*/${1:?${TM_C_POINTER: *}: }/}${4:${3/^(?:(BOOL)|(SEL)|[A-Z](?:[A-Z]+|[a-z]+)([A-Z]\w*))/${1:?flag:${2:?action:\l$3}}/}};
TXT

  tab 'responds', 'Responds to Selector', <<-'TXT', uuid: '171FBCAE-0D6F-4D42-B24F-871E3BB6DFF0'
${TM_COMMENT_START} ${4:Send $2 to $1, if $1 supports it}${TM_COMMENT_END}
if ([${1:self} respondsToSelector:@selector(${2:someSelector:})])
{
    [$1 ${3:${2/((:\s*$)|(:\s*))/:<>(?3: )/g}}];
}
TXT

  tab 'sel', '@selector(…)', <<-'TXT', uuid: '7829F2EC-B8BA-11D9-AE51-000393A143CC', file: '@selector'
@selector(${1:method}:)
TXT

  tab 'setprefs', 'Write Defaults Value', <<-'TXT', uuid: '53672612-B597-11D9-A114-000D93589AF6', file: 'Write to defaults (setprefs)'
[[NSUserDefaults standardUserDefaults] setObject:${1:object} forKey:${2:key}];
TXT

  tab 'sm', 'Sub-method (Call Super)', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: 'BC8B9E72-5F16-11D9-B9C3-000D93589AF6', file: '060 SubMethod (sm)'
- (${1:id})${2:method}${3::(${4:id})${5:${4/(NS([AEIOQUY])?(\w+).*)|(.)?.*/(?1:a(?2:n$2)$3:(?4:anArgument))/}}}
{
	${1/^(void|IBAction)$|(.*)/(?2:$2 res = )/}[super ${2:method}${5/.+/:$0/}];$0${1/^(void|IBAction)$|(.*)/(?2:
	return res;)/}
}
TXT

  tab 'stracc', 'Interface: Accessors for String', <<-'TXT', scope: 'source.objc meta.scope.interface, source.objc++ meta.scope.interface', uuid: '35EB2F86-DEA0-443B-8DC2-4815F0478F67', file: 'String Accessors Interface (stracc)'
- (NSString${TM_C_POINTER/(^(.+?)\s*$)?/(?1:$2: *)/})${1:thing};
- (void)set${1/./\u$0/}:(NSString${TM_C_POINTER/(^(.+?)\s*$)?/(?1:$2: *)/})${2:a${1/.*/\u$0/}};
TXT

  tab 'stracc', 'String', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: '5449EC50-98FE-11D9-9BB8-000A95A89C98', file: 'String Accessors (stracc)'
- (NSString${TM_C_POINTER/(^(.+?)\s*$)?/(?1:$2: *)/})${1:thing}
{
	return ${2:$1};
}

- (void)set${1/.*/\u$0/}:(NSString${TM_C_POINTER/(^(.+?)\s*$)?/(?1:$2: *)/})${3:a${1/.*/\u$0/}}
{
	$3 = [$3 copy];
	[$2 release];
	$2 = $3;
}
TXT

  tab 'syn', 'Synthesize Property', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: 'C0B942C9-07CE-46B6-8FAE-CB8496F9F544', file: 'Synthesize'
@synthesize ${1:property};
TXT

  tab 'thread', 'Detach New NSThread', <<-'TXT', uuid: '25AD69B4-905B-4EBC-A3B3-0BAB6D8BDD75'
[NSThread detachNewThreadSelector:@selector(${1:method}:) toTarget:${2:aTarget} withObject:${3:anArgument}]
TXT

end