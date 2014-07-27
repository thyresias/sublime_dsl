# encoding: utf-8

snippets do

  default_scope 'source.js.prototype'
  file_format :textmate

  key "^@(", '(function()...})', <<-'TXT', uuid: '5F877B41-21B1-4466-9BE4-77D946C01897', file: '(function()___})'
(function(${1:value}) {
	${2:$1}$0
});
TXT

  tab '$', '$', <<-'TXT', uuid: 'A3445CDA-CD0A-4F0E-A83F-0C7D4954F812'
\$(${2:'$1'})
TXT

  tab 'ajax', 'Ajax.PeriodicalUpdater', <<-'TXT', uuid: 'C37F2589-080C-4664-AB3F-E9F262431B57', file: 'Ajax_PeriodicalUpdater'
new Ajax. PeriodicalUpdater(${1:'${2:element}'}, ${3:'${4:url}'}${5:, ${6:ajax_options}});
TXT

  tab 'ajax', 'Ajax.Request', <<-'TXT', uuid: 'A5582955-3F83-4A35-86E5-27D4D19D864F', file: 'Ajax_Request'
new Ajax.Updater(${1:'${2:url}'}${3:, ${4:ajax_options}});
TXT

  tab 'ajax', 'Ajax.Updater', <<-'TXT', uuid: '2413A37D-D070-445B-A7DB-BAA1F79E3D14', file: 'Ajax_Updater'
new Ajax.Updater(${1:'${2:element}'}, ${3:'${4:url}'}${5:, ${6:ajax_options}});
TXT

  tab 'ajax_options', 'Ajax Options', <<-'TXT', uuid: 'CE75EFFF-7A49-4119-A581-1B839E5BC02C'
{
	${1:onSuccess: function(${2:response}) {
		$3
	\}}${5:,
	onFailure: function($2) {
		$6
	}}$0
}
TXT

  tab 'all', 'Enum.all', <<-'TXT', uuid: 'E9691BAF-FD09-46DF-9DE1-5E75C48492EA', file: 'Enum_all'
all(function(${1:value}) {
	$0
});
TXT

  tab 'any', 'Enum.any', <<-'TXT', uuid: '626059D0-848E-4E82-B79F-216CDD572976', file: 'Enum_any'
any(function(${1:value}) {
	$0
});
TXT

  tab 'bind', 'Function.bind', <<-'TXT', uuid: 'E6820C1B-1953-459F-B158-D1E29E159865', file: 'Function_bind'
bind(${1:this}${2:, ${3:arguments}})
TXT

  tab 'bind', 'Function.bindAsEventListener', <<-'TXT', uuid: 'D42790EF-DDB1-47BE-9593-BE7E9AC1C053', file: 'Function_bindAsEventListener'
bindAsEventListener(${1:this})
TXT

  tab 'class', 'Class.create', <<-'TXT', uuid: 'D6B9EA9B-DD59-4123-BEDA-27F4B9F60A3B', file: 'Class_create'
var ${1:MyClass} = Class.create(${2:MySuperClass}${2/.+/, /}{
	initialize: function($4) {
		$5
	}
});
TXT

  tab 'class', 'Create Class Alt', <<-'TXT', uuid: '937FC554-B597-4862-9A60-7605B13C81E8'
var ${1:ClassName} = Class.create();
${1:ClassName}.prototype = {
  initialize : function(){
    $0${10:${TM_SELECTED_TEXT:/*initialize*/}}
  }${2:, /*Other methods?*/}
};
${4:${1:ClassName}.${3:instance} = new ${1:ClassName};
}
TXT

  tab 'coll', 'Enum.collect', <<-'TXT', uuid: '32F7B390-E9E7-460F-BE90-FB2226AEECCB', file: 'Enum_collect'
collect(function(${1:value}) {
	$0
});
TXT

  tab 'det', 'Enum.detect', <<-'TXT', uuid: '26042AA3-2131-4CF0-AB3D-6E0CFD64AD48', file: 'Enum_detect'
detect(function(${1:value}) {
	$0
});
TXT

  tab 'each', 'Enum.each', <<-'TXT', uuid: 'F6169CDB-A5B5-449B-97B9-0FB91EB50047', file: 'Enum_each'
each(function(${1:value}) {
	$0
});
TXT

  tab 'eache', 'Enum.each (element)', <<-'TXT', uuid: '9572E8FC-E7CD-43AB-A0A4-C286C7C61B7A', file: 'Enum_each (element)'
each(function(${1:element}) {
	$1 = \$($1);
	$0
});
TXT

  tab 'eachi', 'Enum.each (index)', <<-'TXT', uuid: 'E7123599-A152-4328-87AB-C416F875E6D4', file: 'Enum_each (index)'
each(function(${1:value}, ${2:index}) {
	$0
});
TXT

  tab 'eff', 'Effect.Appear', <<-'TXT', uuid: '5EF19595-AF11-4034-920C-46726A14A3D2', file: 'Effect_Appear'
new Effect.Appear(${1:'${2:element}'}${3:, ${4:effect_options}});
TXT

  tab 'eff', 'Effect.BlindDown', <<-'TXT', uuid: '77E30D5F-FF83-4C7A-8D41-4369DD227FAA', file: 'Effect_BlindDown'
new Effect.BlindDown(${1:'${2:element}'}${3:, ${4:effect_options}});
TXT

  tab 'eff', 'Effect.BlindUp', <<-'TXT', uuid: 'A44A8D5C-A8D1-4D28-9AA3-ECE21FD79F4C', file: 'Effect_BlindUp'
new Effect.BlindUp(${1:'${2:element}'}${3:, ${4:effect_options}});
TXT

  tab 'eff', 'Effect.DropOut', <<-'TXT', uuid: '1A2DE326-C29F-4BC0-BD20-ABB254AE4582', file: 'Effect_DropOut'
new Effect.DropOut(${1:'${2:element}'}${3:, ${4:effect_options}});
TXT

  tab 'eff', 'Effect.Fade', <<-'TXT', uuid: 'E325A572-79A1-4191-BF28-41556DA28BAA', file: 'Effect_Fade'
new Effect.Fade(${1:'${2:element}'}${3:, ${4:effect_options}});
TXT

  tab 'eff', 'Effect.Fold', <<-'TXT', uuid: 'CB408418-8B87-4793-8F68-B5BEE56094D9', file: 'Effect_Fold'
new Effect.Fold(${1:'${2:element}'}${3:, ${4:effect_options}});
TXT

  tab 'eff', 'Effect.Grow', <<-'TXT', uuid: 'F8A61204-9D9F-439B-8252-80B893BC0C84', file: 'Effect_Grow'
new Effect.Grow(${1:'${2:element}'}${3:, ${4:effect_options}});
TXT

  tab 'eff', 'Effect.Highlight', <<-'TXT', uuid: '62EF51B2-85C3-45CC-A029-021FD7DD5A00', file: 'Effect_Highlight'
new Effect.Highlight(${1:'${2:element}'}${3:, ${4:effect_options}});
TXT

  tab 'eff', 'Effect.Puff', <<-'TXT', uuid: 'F4844C93-9665-4D83-AF61-D824AA7470F6', file: 'Effect_Puff'
new Effect.Puff(${1:'${2:element}'}${3:, ${4:effect_options}});
TXT

  tab 'eff', 'Effect.Pulsate', <<-'TXT', uuid: '16D128D4-60DC-4BBA-9DE6-80EBDEF0DE6C', file: 'Effect_Pulsate'
new Effect.Pulsate(${1:'${2:element}'}${3:, ${4:effect_options}});
TXT

  tab 'eff', 'Effect.Shake', <<-'TXT', uuid: '3DAFE08A-6F81-44D6-BDBD-47E5A80969AA', file: 'Effect_Shake'
new Effect.Shake(${1:'${2:element}'}${3:, ${4:effect_options}});
TXT

  tab 'eff', 'Effect.Shrink', <<-'TXT', uuid: '68F5AC0F-A1BB-4600-AB6D-E783404CE0AA', file: 'Effect_Shrink'
new Effect.Shrink(${1:'${2:element}'}${3:, ${4:effect_options}});
TXT

  tab 'eff', 'Effect.SlideDown', <<-'TXT', uuid: '6F592795-D5F5-48BA-B98B-FE586E684F38', file: 'Effect_SlideDown'
new Effect.SlideDown(${1:'${2:element}'}${3:, ${4:effect_options}});
TXT

  tab 'eff', 'Effect.SlideUp', <<-'TXT', uuid: 'C0B14A86-630E-4071-BE01-B6D7DE085C4C', file: 'Effect_SlideUp'
new Effect.SlideUp(${1:'${2:element}'}${3:, ${4:effect_options}});
TXT

  tab 'eff', 'Effect.Squish', <<-'TXT', uuid: '0E4BCAEF-C140-491A-BB8A-FA74DD6480E9', file: 'Effect_Squish'
new Effect.Squish(${1:'${2:element}'}${3:, ${4:effect_options}});
TXT

  tab 'eff', 'Effect.SwitchOff', <<-'TXT', uuid: '2B1CDA6D-BF8F-4B8F-A946-EF2E5E46F6F3', file: 'Effect_SwitchOff'
new Effect.SwitchOff(${1:'${2:element}'}${3:, ${4:effect_options}});
TXT

  tab 'effect_options', 'Effect Options', <<-'TXT', uuid: '43BBB5EB-10C8-4E27-8239-71354EFCD533'
{
	${1:${2:duration}: ${3:1}}${5:,
	afterFinish: function() {
		$6
	\}}$0
}
TXT

  tab 'evo', 'Event.observe', <<-'TXT', uuid: '5AEF9BDE-757E-41DB-B234-AC5D3D5B9802', file: 'Event_observe'
Event.observe(${2:element}, '${3:event name}', ${4:observer}${5:, ${6:useCapture}});
TXT

  tab 'ext', 'Object.extend', <<-'TXT', uuid: 'BA4A9163-94FC-4699-8945-AB37DFB676AE', file: 'Object_extend'
Object.extend(${1:destination}, ${2:source});
TXT

  tab 'field', 'Field.activate', <<-'TXT', uuid: 'B2E49A52-C36C-4764-A654-065D75D9478E', file: 'Field_activate'
Field.activate(${1:element};
TXT

  tab 'field', 'Field.clear', <<-'TXT', uuid: '2AC7C5D1-27CD-487D-A889-E3716C3BD164', file: 'Field_clear'
Field.clear(${1:element(s)});
TXT

  tab 'field', 'Field.focus', <<-'TXT', uuid: '8B13E527-4CCF-4537-9E73-41666C791E55', file: 'Field_focus'
Field.focus(${1:element});
TXT

  tab 'field', 'Field.present', <<-'TXT', uuid: 'ACAFFCE6-F7FA-415A-8B83-84A80B53B1A2', file: 'Field_present'
Field.present(${1:element(s)});
TXT

  tab 'field', 'Field.select', <<-'TXT', uuid: 'ABA029B1-92B7-4647-BAFC-5C3EFBD714BC', file: 'Field_select'
Field.select(${1:element};
TXT

  tab 'form', 'Form.disable', <<-'TXT', uuid: 'E42163B8-77BD-49C8-A13A-AC476F5EF1F3', file: 'Form_disable'
Form.disable(${1:form});
TXT

  tab 'form', 'Form.enable', <<-'TXT', uuid: '1ABC1AA5-B3CD-4DB4-AB8D-FC82316CD2EF', file: 'Form_enable'
Form.enable(${1:form});
TXT

  tab 'form', 'Form.findFirstElement', <<-'TXT', uuid: '31292989-C1D3-464F-B634-E464F4DBBCE4', file: 'Form_findFirstElement'
Form.findFirstElement(${1:form});
TXT

  tab 'form', 'Form.focusFirstElement', <<-'TXT', uuid: '23DE5968-7841-4B6B-B718-DAAD2E8B35A7', file: 'Form_focusFirstElement'
Form.focusFirstElement(${1:form});
TXT

  tab 'form', 'Form.getElements', <<-'TXT', uuid: '3F42969B-4EBE-4B25-B392-1D1B812B2D41', file: 'Form_getElements'
Form.getElements(${1:form});
TXT

  tab 'form', 'Form.getInputs', <<-'TXT', uuid: '598A46C6-B1B0-4D73-BF7F-394B67707427', file: 'Form_getInputs'
Form.getInputs(${1:form}, ${2:typeName}, ${3:name});
TXT

  tab 'form', 'Form.serialize', <<-'TXT', uuid: '436E366E-6C4B-48F3-B598-42F01E43F909', file: 'Form_serialize'
Form.serialize(${1:form});
TXT

  tab 'inj', 'Enum.inject', <<-'TXT', uuid: '7B44C545-36C9-41F5-BD41-F115ED323C73', file: 'Enum_inject'
inject(${1:initial_value}, function(${2:accumulator}, ${3:value}) {
	$0
	return $2;
});
TXT

  tab 'ins', 'Insertion.After', <<-'TXT', uuid: 'CC9BE822-767B-45DA-92D1-D269D38752BA', file: 'Insertion_After'
new Insertion.After(${1:element}, ${3:'${2:content}'});
TXT

  tab 'ins', 'Insertion.Before', <<-'TXT', uuid: '1EEFCA26-1A91-4805-A1C5-29E301889700', file: 'Insertion_Before'
new Insertion.Before(${1:element}, ${3:'${2:content}'});
TXT

  tab 'ins', 'Insertion.Bottom', <<-'TXT', uuid: '5869D442-98CC-4F3E-B006-01A7F8240D4C', file: 'Insertion_Bottom'
new Insertion.Bottom(${1:element}, ${3:'${2:content}'});
TXT

  tab 'ins', 'Insertion.Top', <<-'TXT', uuid: '883C2871-0C46-4C97-8938-C85E67791654', file: 'Insertion_Top'
new Insertion.Top(${1:element}, ${3:'${2:content}'});
TXT

  tab 'inv', 'Enum.invoke', <<-'TXT', uuid: '929346D5-C24C-4F06-963F-1CB9B109E341', file: 'Enum_invoke'
invoke('${1:callback}');
TXT

  tab 'map', 'Enum.map', <<-'TXT', uuid: '09315F6E-39F1-474A-859F-4705565CF9D1', file: 'Enum_map'
map(function(${1:value}) {
	$0
});
TXT

  tab 'options', 'Options', <<-'TXT', uuid: 'E334D752-6D6A-4A59-AE9D-A78E5ED8ECFE'
{
	$1
}
TXT

  tab 'pos', 'Position.absolutize', <<-'TXT', uuid: '6341EB70-31F4-4158-9D2A-9CA423762A4A', file: 'Position_absolutize'
Position.absolutize(${1:'${2:element}'});
TXT

  tab 'pos', 'Position.clone', <<-'TXT', uuid: '70AB53D1-E30B-4A5C-A281-76049EC7E7B8', file: 'Position_clone'
Position.clone(${1:source}, ${2:target});
TXT

  tab 'pos', 'Position.cumulativeOffset', <<-'TXT', uuid: '215229C4-FDBF-4752-994E-1B8503E4213B', file: 'Position_cumulativeOffset'
Position.cumulativeOffset(${1:'${2:element}'});
TXT

  tab 'pos', 'Position.offsetParent', <<-'TXT', uuid: '21099712-0E58-4724-8AFB-F5072477272C', file: 'Position_offsetParent'
Position.offsetParent(${1:'${2:element}'});
TXT

  tab 'pos', 'Position.overlap', <<-'TXT', uuid: '792CF759-28D8-4154-BB58-9D0D2B33B1CC', file: 'Position_overlap'
Position.overlap(${1:mode}, ${2:'${3:element}'});
TXT

  tab 'pos', 'Position.page', <<-'TXT', uuid: '4789DAC2-C6CA-43DB-86F3-506252B18B3C', file: 'Position_page'
Position.page(${1:'${2:forElement}'});
TXT

  tab 'pos', 'Position.positionedOffset', <<-'TXT', uuid: '3369E9E2-A9A7-402C-AA3C-E9345E31ECE1', file: 'Position_positionedOffset'
Position.positionedOffset(${1:'${2:element}'});
TXT

  tab 'pos', 'Position.prepare', <<-'TXT', uuid: '5F7BB9E1-CB9A-4874-BCC9-09FCD400891B', file: 'Position_prepare'
Position.prepare();
TXT

  tab 'pos', 'Position.realOffset', <<-'TXT', uuid: 'C1F16C49-270F-4BF3-AD4D-DD8EFFCF5A11', file: 'Position_realOffset'
Position.realOffset(${1:'${2:element}'});
TXT

  tab 'pos', 'Position.relativize', <<-'TXT', uuid: '0B30621A-1D11-4D13-A114-02616BBE8450', file: 'Position_relativize'
Position.relativize(${1:'${2:element}'});
TXT

  tab 'pos', 'Position.within', <<-'TXT', uuid: 'B4580DEE-300B-4F7D-963A-47D2FB64CD18', file: 'Position_within'
Position.within(${1:'${2:element}'}, ${3:x}, ${4:y});
TXT

  tab 'pos', 'Position.withinIncludingScrolloffsets', <<-'TXT', uuid: 'DD4553A1-633C-4293-8E71-1D7F2E024664', file: 'Position_withinIncludingScrolloffsets'
Position.withinIncludingScrolloffsets(${1:'${2:element}'}, ${3:x}, ${4:y});
TXT

  tab 'reject', 'Enum.reject', <<-'TXT', uuid: 'B0B537B7-C5A0-4127-A090-D29A0DB367BB', file: 'Enum_reject'
reject(function(${1:value}) {
	$0
});
TXT

end