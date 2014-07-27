# encoding: utf-8

snippets do

  default_scope 'source.objc, source.objc++'
  file_format :textmate

  tab 'ar', 'NSArray With Objects', <<-'TXT', uuid: 'E7576EB4-B8BC-11D9-AE51-000393A143CC', file: 'New NSArray (ar)'
NSArray${TM_C_POINTER: *}${1:array} = [NSArray arrayWithObjects:
						${2:object},$0
						nil];
TXT

  tab 'awa', '- awakeFromNib', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: 'B9311E3C-B8B8-11D9-AE51-000393A143CC', file: '- awakeFromNib (awa)'
- (void)awakeFromNib
{
	$0
}

TXT

  tab 'b', '- (BOOL)decl;', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.interface', uuid: '2E4E33DA-B8B9-11D9-AE51-000393A143CC', file: '- (BOOL)decl; (bb)'
- (BOOL)${1:method};
TXT

  tab 'b', '- (BOOL)method', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: '13CE9D22-B8B9-11D9-AE51-000393A143CC', file: '- (BOOL)method (b)'
- (BOOL)${1:method}
{
	return ${2:value};
}

TXT

  tab 'can', 'Cancel Perform Selector', <<-'TXT', uuid: '151935C2-B8C0-11D9-AE51-000393A143CC', file: 'cancel performSelector (can)'
[NSObject cancelPreviousPerformRequestsWithTarget:${1:self} selector:@selector(${2:method}:) object:${3:nil}];
TXT

  tab 'd', '- dealloc', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: '41ABB337-B8B9-11D9-AE51-000393A143CC', file: '- dealloc (d)'
- (void)dealloc
{
	[${1:ivar} release];
	[super dealloc];
}

TXT

  tab 'dd', 'NSDictionary With Objects and Keys', <<-'TXT', uuid: 'BBAF783A-B8BC-11D9-AE51-000393A143CC', file: 'New NSDictionary (dd)'
NSDictionary${TM_C_POINTER: *}${1:dict} = [NSDictionary dictionaryWithObjectsAndKeys:
	${2:object}, ${3:key},$0
	nil];

TXT

  tab 'during', 'NS_DURING block', <<-'TXT', uuid: '5992DC58-B8C0-11D9-AE51-000393A143CC', file: 'NS_DURING block (during)'
NS_DURING
	$0
NS_HANDLER
NS_ENDHANDLER
TXT

  tab 'enum', 'NSEnumerator Loop', <<-'TXT', uuid: '71439280-B8C0-11D9-AE51-000393A143CC', file: 'Enumerate array (enum)'
NSEnumerator${TM_C_POINTER: *}${2:${1:string}Enum} = [${3:$1Array} objectEnumerator];
${5:id} ${4:curr${1/(.)(.*)/\U$1\E$2/}};

while (($4 = [$2 nextObject])) {
    $0
}
TXT

  tab 'ff', 'NSString With Format', <<-'TXT', uuid: 'CE7E1A78-B8C2-11D9-9635-000393A143CC', file: 'stringWithFormat (ff)'
[NSString stringWithFormat:@"${1:%@}"${1/([^%]|%%)*(%.)?.*/(?2:, :])/}$2${1/([^%]|%%)*(%.)?.*/(?2:])/}
TXT

  tab 'fm', 'NSFileManager', <<-'TXT', uuid: 'AE9280E5-B8BE-11D9-AE51-000393A143CC', file: 'Default file manager (fm)'
NSFileManager${TM_C_POINTER: *}${1:fm} = [NSFileManager defaultManager];
TXT

  tab 'i', '- (int)decl;', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.interface', uuid: 'CBCFDA9F-B8BA-11D9-AE51-000393A143CC', file: '- (int)decl; (ii)'
- (int)${1:method};
TXT

  tab 'i', '- (int)method', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: 'B71DF251-B8BA-11D9-AE51-000393A143CC', file: '- (int)method (i)'
- (int)${1:method}
{
	return ${2:value};
}

TXT

  tab 'iba', '- (IBAction)decl;', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.interface', uuid: '1ED92307-AE72-4F11-82C8-9A2751690C90', file: '- (IBAction)method; (iba)'
- (IBAction)${1:method}:(id)sender;
TXT

  tab 'iba', '- (IBAction)method', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: '92BB3BAE-B8B9-11D9-AE51-000393A143CC', file: '- (IBAction)method (iba)'
- (IBAction)${1:method}:(id)sender
{
	$0
}

TXT

  tab 'id', '- (id)decl;', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.interface', uuid: '7BF73194-B8B9-11D9-AE51-000393A143CC', file: '- (id)decl; (iid)'
- (id)${1:method};
TXT

  tab 'id', '- (id)method', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: '64C7F64A-B8B9-11D9-AE51-000393A143CC', file: '- (id)method (id)'
- (id)${1:method}
{
	return ${2:object};
}
TXT

  tab 'init', '- init', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: 'C9CD762E-B8B9-11D9-AE51-000393A143CC', file: '- init (init)'
- (id)init
{
	if((self = [super init]))
	{
		$0
	}
	return self;
}

TXT

  tab 'nn', '[NSNumber ...', <<-'TXT', uuid: '1AF2C047-B8BC-11D9-AE51-000393A143CC', file: '[NSNumber ... (nn)'
[NSNumber numberWith${1:Int}:${2:value}]
TXT

  tab 'oe', 'objectEnumerator', <<-'TXT', scope: 'meta.bracketed.objc', uuid: 'EF2A1830-B8BF-11D9-AE51-000393A143CC', file: 'objectEnumerator (oe)'
objectEnumerator
TXT

  tab 'oi', 'objectAtIndex', <<-'TXT', scope: 'meta.bracketed.objc', uuid: 'D4527EEE-B8BF-11D9-AE51-000393A143CC', file: 'objectAtIndex (oi)'
objectAtIndex:${1:i}
TXT

  tab 'ok', 'objectForKey', <<-'TXT', scope: 'meta.bracketed.objc', uuid: 'E0E7FB1D-B8BF-11D9-AE51-000393A143CC', file: 'objectForKey (ok)'
objectForKey:
TXT

  tab 'perf', 'Perform Selector', <<-'TXT', uuid: '5DAD4AE0-B8BF-11D9-AE51-000393A143CC', file: 'performSelector (perf)'
[self performSelector:@selector(${1:method}:) withObject:${2:nil} afterDelay:${3:1.0}];
TXT

  tab 'post', 'Post Notification', <<-'TXT', uuid: 'A6B9C556-B8BF-11D9-AE51-000393A143CC', file: 'Post notification (post)'
[[NSNotificationCenter defaultCenter] postNotificationName:$1 object:self];
TXT

  tab 'ro', 'Remove Observer', <<-'TXT', uuid: '79F1D540-B8BF-11D9-AE51-000393A143CC', file: 'Remove observer (ro)'
[[NSNotificationCenter defaultCenter] removeObserver:self];
TXT

  tab 'rr', '[object release];', <<-'TXT', uuid: 'E5A7F24B-B8BB-11D9-AE51-000393A143CC', file: '[object release]; (rr)'
[${1:object} release];
TXT

  tab 'so', 'setObject:forKey:', <<-'TXT', scope: 'meta.bracketed.objc', uuid: 'CDFEF4EC-81C4-44EC-B638-3B93803AA2B5'
setObject:$1 forKey:
TXT

  tab 'v', '- (void)decl;', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.interface', uuid: '9DAAFC70-B8BA-11D9-AE51-000393A143CC', file: '- (void)decl; (vv)'
- (void)${1:method}${2::(id)sender};
TXT

  tab 'v', '- (void)method', <<-'TXT', scope: '(source.objc | source.objc++) & meta.scope.implementation.objc - meta.function-with-body', uuid: '91A55D91-B8BA-11D9-AE51-000393A143CC', file: '- (void)method (v)'
- (void)${1:method}${2::(id)sender}
{
	$0
}

TXT

  tab 'ws', 'NSWorkspace', <<-'TXT', uuid: '4BBEB085-B8C3-11D9-9635-000393A143CC', file: 'NSWorkspace (ws)'
NSWorkspace${TM_C_POINTER: *}${1:workspace} = [NSWorkspace sharedWorkspace];
TXT

end