# encoding: utf-8

snippets do

  default_scope 'source.js.jquery'
  file_format :textmate

  tab '$', '$ (Select DOM Element)', <<-'TXT', uuid: '04234F37-7812-499B-BB9C-2FD1B92DB1B5'
\$(${1/(.+)/(?1:':)/}${1:string/element/array/function/jQuery object/string, context}${1/(.+)/(?1:':)/})$0
TXT

  tab '$.ajax', '$.ajax', <<-'TXT', uuid: '97595DE0-09AE-4D6F-9D63-5139861BEA85', file: '$_ajax(hash)'
\$.ajax({
  url: "${1:mydomain.com/url}",
  type: "${2:POST}",
${3/(.+)/(?1:  dataType\: ":)/}${3:xml/html/script/json}${3/(.+)/(?1:",
:)/}${4/(.+)/(?1:  data\: $.param\( $\(":)/}${4:Element or Expression}${4/(.+)/(?1:"\) \),
:)/}${5/(.+)/(?1:  complete\: function\(\) {:)/}${5:
    //called when complete}${5/(.+)/(?1:  },
:)/}${6/(.+)/(?1:  success\: function\(\) {:)/}${6:
    //called when successful}${6/(.+)/(?1: },
:)/}${7/(.+)/(?1:  error\: function\(\) {:)/}${7:
    //called when there is an error}${7/(.+)/(?1:  },
:)/}});
$0
TXT

  tab '$.ajaxError', '$.ajaxError', <<-'TXT', uuid: '4400D01A-8061-4624-B6E2-999285BA25DD', file: '$_ajaxError'
.ajaxError(function(${1:request, settings}) {
  ${2://stuff to do when an AJAX call returns an error};
});
$0
TXT

  tab '$.ajaxSend', '$.ajaxSend', <<-'TXT', uuid: 'E4DFA4E2-0A94-4696-9A0D-6A7CE102E3B1', file: '$_ajaxSend'
.ajaxSend(function(${1:request, settings}) {
  ${2://stuff to do before an AJAX request is sent};
});
$0
TXT

  tab '$.ajaxSetup', '$.ajaxSetup', <<-'TXT', uuid: '75F00CB6-8619-40F2-B482-5B258557D22C', file: '$_ajaxSetup'
\$.ajaxSetup({
  url: "${1:mydomain.com/url}",
  type: "${2:POST}",
${3/(.+)/(?1:  dataType\: ":)/}${3:xml/html/script/json}${3/(.+)/(?1:",
:)/}${4/(.+)/(?1:  data\: $.param\( $\(":)/}${4:Element or Expression}${4/(.+)/(?1:"\) \),
:)/}${5/(.+)/(?1:  complete\: function\(\) {:)/}${5:
    //called when complete}${5/(.+)/(?1:  },
:)/}${6/(.+)/(?1:  success\: function\(\) {:)/}${6:
    //called when successful}${6/(.+)/(?1: },
:)/}${7/(.+)/(?1:  error\: function\(\) {:)/}${7:
    //called when there is an error}${7/(.+)/(?1:  },
:)/}});
$0
TXT

  tab '$.ajaxStart', '$.ajaxStart', <<-'TXT', uuid: '8BCA3039-B2E0-493F-9E2F-4156D4703214', file: 'ajaxStart'
\$.ajaxStart(function() {
  ${1://stuff to do when an AJAX call is started and no other AJAX calls are in progress};
});
$0
TXT

  tab '$.ajaxStop', '$.ajaxStop', <<-'TXT', uuid: 'ED38CEB0-2038-4E45-9CDF-56824AF86968', file: 'ajaxStop'
\$.ajaxStop(function() {
  ${1://stuff to do when all AJAX calls have completed};
});
$0
TXT

  tab '$.ajaxSuccess', '$.ajaxSuccess', <<-'TXT', uuid: '154BF189-2645-45FD-8728-15C5A79E3FAF', file: '$_ajaxSuccess'
.ajaxSuccess(function() {
	${1:// executes whenever an AJAX request completes successfully}
});$0
TXT

  tab '$.get', '$.get', <<-'TXT', uuid: 'E05CC813-D20E-4F7B-AA32-AC555F47BA1F', file: '$_get'
\$.get('${1:/test/ajax-test.xml}'${2/(.+)/(?1:, function\(xml\){
 :)/}${2:alert( $("title",xml).text() )//optional stuff to do after get}${2/(.+)/(?1:;
}:)/});
$0
TXT

  tab '$.getIfModified', '$.getIfModified', <<-'TXT', uuid: '8B1184F0-1BC6-4DD9-B60A-1D3212A9B642', file: '$_getIfModified'
\$.getIfModified('${1:/test/test.cgi}'${3/(.+)/(?1:, function\(data\){
 :)/}${3:alert( $"Data loaded: " + data )//optional stuff to do after get}${3/(.+)/(?1:;
}:)/});
$0
TXT

  tab '$.getJSON', '$.getJSON', <<-'TXT', uuid: '36370731-4423-4F4D-8EF1-0360DC8D7F7B', file: '$_getJSON'
\$.getJSON('${1:/path/to/file.cgi}'${2/(.+)/(?1:,{
 :)/}${2:param1: "value1", param2: "value2"}${2/(.+)/(?1:}:)/}${3/(.+)/(?1:,
 function\(json\){
    :)/}${3://stuff to do after event occurs};${3/(.+)/(?1:
}:)/});
$0
TXT

  tab '$.getScript', '$.getScript', <<-'TXT', uuid: '1E41CC95-3D42-4CC9-BD69-BA86FB8FE34A', file: '$_getScript'
\$.getScript('${1:somescript.js}'${3/(.+)/(?1:, function\(\){
 :)/}${3://optional stuff to do after getScript}${3/(.+)/(?1:;
}:)/});
$0
TXT

  tab '$.post', '$.post', <<-'TXT', uuid: '5553C450-7055-45E6-9758-E8BE0C47CA2D', file: '$_post'
\$.post('${1:/path/to/file.cgi}'${2/(.+)/(?1:,{
 :)/}${2:param1: "value1", param2: "value2"}${2/(.+)/(?1:}:)/}${3/(.+)/(?1:,
 function\(\){
    :)/}${3://stuff to do *after* page is loaded};${3/(.+)/(?1:
}:)/});
$0


TXT

  tab '$.trim', '$.trim', <<-'TXT', uuid: 'F62B7A76-1BF3-4FD0-8679-3FC77F7E1F3A', file: '$_trim'
\$.trim('${1:string}')$0
TXT

  tab '.add', 'add', <<-'TXT', uuid: 'AEC78541-58C8-4075-8E93-4754927725C1'
.add('${1:selector expression}')$0
TXT

  tab '.addClass', 'addClass', <<-'TXT', uuid: 'CDCE5068-5596-43B6-B710-9A36E4163007'
.addClass('${1:class name}')$0
TXT

  tab '.after', 'after', <<-'TXT', uuid: 'F8ED5AE3-4F82-4B7B-AFC4-AA00AD8A6D74'
.after('${1:Some text <b>and bold!</b>}')$0
TXT

  tab '.animate', 'animate', <<-'TXT', uuid: 'DDE3146C-FE63-465B-A9C6-4837DDF96475'
.animate({${1:param1: value1, param2: value2}}, ${2:speed})$0
TXT

  tab '.append', 'append', <<-'TXT', uuid: '58EC1091-5FA5-49ED-A541-F0DC390C2D8D'
.append('${1:Some text <b>and bold!</b>}')$0
TXT

  tab '.appendTo', 'appendTo', <<-'TXT', uuid: '51F36444-37E7-4C4D-AFFD-7D58FD51CF83'
.appendTo('${1:selector expression}')$0
TXT

  tab '.attr', 'attr', <<-'TXT', uuid: '97E5547D-95E2-4185-86CE-500FA11B21B6'
.attr('${1:attribute}'${2/(.+)/(?1:, :)/}${2/(^[0-9]+$)|.+/(?1::')/}${2:value}${2/(^[0-9]+$)|.+/(?1::')/})$0
TXT

  tab '.attr', 'attr (map)', <<-'TXT', uuid: 'DEF5F0F2-4A20-492B-920C-8DB154EBB343', file: 'attr(hash)'
.attr({'${1:attribute1}'${2/(.+)/(?1:\: :)/}${2/(^[0-9]+$)|.+/(?1::')/}${2:value1}${2/(^[0-9]+$)|.+/(?1::')/}, '${3:attribute2}'${4/(.+)/(?1:\: :)/}${4/(^[0-9]+$)|.+/(?1::')/}${4:value2}${4/(^[0-9]+$)|.+/(?1::')/}})$0
TXT

  tab '.before', 'before', <<-'TXT', uuid: '92449CFD-A6C2-4528-9977-AC235A3C18AF'
.before('${1:Some text <b>and bold!</b>}')$0
TXT

  tab '.bind', 'bind', <<-'TXT', uuid: '3EA8B62B-6824-4DC6-A6EE-50574652692E'
.bind('${1:event name}', function(${2:event}) {
	${0:// Act on the event}
});
TXT

  tab '.blur', 'blur', <<-'TXT', uuid: '2BC7C5CC-C2FB-4268-B883-7C25725B011B'
.blur(${1:function() {
	${0:// Act on the event}
\}});
TXT

  tab '.change', 'change', <<-'TXT', uuid: 'ADDCA404-8C86-4F10-9A40-866A15F53F9B'
.change(${1:function() {
	${0:// Act on the event}
\}});
TXT

  tab '.children', 'children', <<-'TXT', uuid: 'E8B0EE4E-1A1D-4E70-8F41-1EF3BE549974'
.children(${1/(.+)/(?1:':)/}${1:selector expression}${1/(.+)/(?1:':)/})$0
TXT

  tab '.click', 'click', <<-'TXT', uuid: 'CCE08A0D-D536-4CAF-8BD5-E568342198F4'
.click(${1:function() {
	${0:// Act on the event}
\}});
TXT

  tab '.contains', 'contains', <<-'TXT', uuid: '544979B1-A28A-45F4-A29E-75121373095B'
.contains('${1:text to find}')$0
TXT

  tab '.css', 'css', <<-'TXT', uuid: '55BFEE67-1062-48BD-86BB-9AAB92DECD75'
.css('${1:attribute}', '${2:value}')$0
TXT

  tab '.css', 'css (map)', <<-'TXT', uuid: '02B7D7B0-F9B5-4CE0-8259-BB192E966237', file: 'css(hash)'
.css({${1:attribute1}: '${2:value1}', ${3:attribute2}: '${4:value2}'})$0
TXT

  tab '.dblclick', 'dblclick', <<-'TXT', uuid: '6DDA60D4-9051-49A4-90CC-F6F4E6E05E31'
.dblclick(${1:function() {
	${0:// Act on the event}
\}});
TXT

  tab '.each', 'each', <<-'TXT', uuid: 'E11A7E2B-FC5B-43BB-9F1F-C6E309A62520'
.each(function(index) {
	${0:this.innerHTML = this + " is the element, " + index + " is the position";}
});
TXT

  tab '.end', 'end', <<-'TXT', uuid: 'F05AB37C-5774-4957-BF9F-1C01FD6F03D5'
.end()$0
TXT

  tab '.error', 'error', <<-'TXT', uuid: '07B15183-8554-4164-9C41-0D5968BBA746'
.error(${1:function() {
	${0:// Act on the event}
\}});
TXT

  tab '.fadeIn', 'fadeIn', <<-'TXT', uuid: '35C0448C-A6C1-4740-AEA8-A05EA45CACFD'
.fadeIn(${1/(^[0-9]+$)|.+/(?1::')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::')/})$0
TXT

  tab '.fadeIn', 'fadeIn (with callback)', <<-'TXT', uuid: '541384FE-405C-41B4-BECF-655478ADE086', file: 'fadeIn - with callback'
.fadeIn(${1/(^[0-9]+$)|.+/(?1::')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::')/}, function() {
	${0://Stuff to do *after* the animation takes place};
});

TXT

  tab '.fadeOut', 'fadeOut', <<-'TXT', uuid: '334E57BB-0425-4CFC-97D4-C828417E3F6D'
.fadeOut(${1/(^[0-9]+$)|.+/(?1::')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::')/})$0
TXT

  tab '.fadeOut', 'fadeOut (with callback)', <<-'TXT', uuid: '9D75244D-9AD6-41EA-81D5-BE0AC1854D8A', file: 'fadeOut - with callback'
.fadeOut(${1/(^[0-9]+$)|.+/(?1::')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::')/}, function() {
	${0://Stuff to do *after* the animation takes place};
});

TXT

  tab '.fadeTo', 'fadeTo', <<-'TXT', uuid: 'A8A7286A-6D26-4C74-BB48-5D6E37427607'
.fadeTo(${1/(^[0-9]+$)|.+/(?1::')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::')/}, ${2:0.5})$0
TXT

  tab '.fadeTo', 'fadeTo (with callback)', <<-'TXT', uuid: 'ABF4209E-5639-4B38-9C21-11988EAD08F9', file: 'fadeTo - with callback'
.fadeTo(${1/(^[0-9]+$)|.+/(?1::')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::')/}, ${2:0.5}, function() {
	${0://Stuff to do *after* the animation takes place};
});

TXT

  tab '.filter', 'filter', <<-'TXT', uuid: 'C7F436EB-AE91-4344-B46F-827348FFF400'
.filter('${1:selector expression}')$0
TXT

  tab '.find', 'find', <<-'TXT', uuid: '1DDD5103-FBE1-4105-B5A6-1D6B4BD1C30E'
.find('${1:selector expression}')$0
TXT

  tab '.focus', 'focus', <<-'TXT', uuid: 'EECF47F6-EA86-4954-AC05-8875798A6B64'
.focus(${1:function() {
	${0:// Act on the event}
\}});
TXT

  tab '.get', 'get', <<-'TXT', uuid: 'C02ABCE8-114C-40A5-8BAE-317BA3D61804'
.get(${1:element index})$0
TXT

  tab '.height', 'height', <<-'TXT', uuid: '82A39DC8-B62A-45C0-BBB3-11125F0BA50E'
.height(${1:integer})$0
TXT

  tab '.hide', 'hide', <<-'TXT', uuid: '0B6FAEDC-ACA0-4683-B1C9-4BD427F005B4'
.hide(${1/(^[0-9]+$)|.+/(?1::')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::')/})$0
TXT

  tab '.hide', 'hide (with callback)', <<-'TXT', uuid: '521AF47B-4959-4D20-895D-008EB098A3D9', file: 'hide - with callback'
.hide(${1/(^[0-9]+$)|.+/(?1::')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::')/}, function() {
	${0://Stuff to do *after* the animation takes place};
});

TXT

  tab '.hover', 'hover', <<-'TXT', uuid: 'F74520FC-AFC5-468D-BBC5-318526497E0B'
.hover(function() {
	${1:// Stuff to do when the mouse enters the element;}
}, function() {
	${2:// Stuff to do when the mouse leaves the element;}
});$0
TXT

  tab '.html', 'html', <<-'TXT', uuid: '3A459E99-A508-4561-93C4-8C801987BF65'
.html(${1/(.+)/(?1:':)/}${1:Some text <b>and bold!</b>}${1/(.+)/(?1:':)/})$0
TXT

  tab '.insertAfter', 'insertAfter', <<-'TXT', uuid: '03A18CFB-640C-4D87-A41B-15F01A2D1768'
.insertAfter('${1:selector expression}')$0
TXT

  tab '.insertBefore', 'insertBefore', <<-'TXT', uuid: 'DBA6F6FC-24CA-4B01-9083-4BED8B88D9F8'
.insertBefore('${1:selector expression}')$0
TXT

  tab '.is', 'is', <<-'TXT', uuid: 'C05B289F-F527-4440-8851-A81ED1B39532'
.is('${1:selector expression}')$0
TXT

  tab '.load', 'load', <<-'TXT', uuid: '9599E726-CD10-4B52-8DAD-5F02343E6541'
.load(${1:function() {
	${0:// Act on the event}
\}});
TXT

  tab '.load', 'load (AHAH)', <<-'TXT', uuid: 'CF16D248-060F-4ECD-9EF3-8DC9FF6AE97C'
.load('${1:/path/to/file.htm}'${2/(.+)/(?1:,{
 :)/}${2:param1: "value1", param2: "value2"}${2/(.+)/(?1:}:)/}${3/(.+)/(?1:,
 function\(\){
    :)/}${3:// Stuff to do after the page is loaded}${3/(.+)/(?1:
}:)/});
$0
TXT

  tab '.loadIfModified', 'loadIfModified', <<-'TXT', uuid: '8DF64D47-0D42-4A34-AF40-AEF559E64336'
.loadIfModified('${1:/path/to/file.html}'${2/(.+)/(?1:,{
 :)/}${2:param1: "value1", param2: "value2"}${2/(.+)/(?1:}:)/}${3/(.+)/(?1:,
 function\(\){
    :)/}${3:// Stuff to do after the page is loaded}${3/(.+)/(?1:
}:)/});
$0
TXT

  tab '.mousedown', 'mousedown', <<-'TXT', uuid: '0FD09463-BE66-4316-BF87-9FBA2D9902CB'
.mousedown(${1:function() {
	${0:// Act on the event}
\}});
TXT

  tab '.mousemove', 'mousemove', <<-'TXT', uuid: '0C0F0895-54E0-4CA5-AC82-B3D3E872675C'
.mousemove(${1:function() {
	${0:// Act on the event}
\}});
TXT

  tab '.mouseout', 'mouseout', <<-'TXT', uuid: '39D8784D-FEC7-4DE3-9B34-DEEF98E1D865'
.mouseout(${1:function() {
	${0:// Act on the event}
\}});
TXT

  tab '.mouseover', 'mouseover', <<-'TXT', uuid: 'BF533BA4-A99C-4F3A-A26C-CB196B3DC2BA'
.mouseover(${1:function() {
	${0:// Act on the event}
\}});
TXT

  tab '.mouseup', 'mouseup', <<-'TXT', uuid: 'A07D7480-0C24-4FD9-A816-9BD5F16059CE'
.mouseup(${1:function() {
	${0:// Act on the event}
\}});
TXT

  tab '.next', 'next', <<-'TXT', uuid: '4FABFAB0-E15C-41D3-BC40-0C685F168D50'
.next(${1/(.+)/(?1:':)/}${1:selector expression}${1/(.+)/(?1:':)/})$0
TXT

  tab '.not', 'not', <<-'TXT', uuid: '5826C882-45C3-45DD-A9F2-0EF523890CAE'
.not('${1:selector expression}')$0
TXT

  tab '.one', 'one', <<-'TXT', uuid: '4686D84C-E4BE-4460-A4BF-C494D9660802'
.one('${1:event name}', function(${2:event}) {
	${0:// Act on the event once}
});
TXT

  tab '.parent', 'parent', <<-'TXT', uuid: '61AD7DF9-B0CB-4985-A9E8-E868E47E0922'
.parent(${1/(.+)/(?1:':)/}${1:selector expression}${1/(.+)/(?1:':)/})$0
TXT

  tab '.parents', 'parents', <<-'TXT', uuid: '249A21FB-D259-4BA6-B7A6-97A128A928E6'
.parents(${1/(.+)/(?1:':)/}${1:selector expression}${1/(.+)/(?1:':)/})$0
TXT

  tab '.prepend', 'prepend', <<-'TXT', uuid: '299BBE36-6F8F-4BE8-8196-35BF2F990ADE'
.prepend('${1:Some text <b>and bold!</b>}')$0
TXT

  tab '.prependTo', 'prependTo', <<-'TXT', uuid: 'D0822715-180B-4D26-81A3-DF2AA34BB733'
.prependTo('${1:selector expression}')$0
TXT

  tab '.prev', 'prev', <<-'TXT', uuid: '289FBC67-F567-41D5-9615-2AB7CD159D1E'
.prev(${1/(.+)/(?1:':)/}${1:selector expression}${1/(.+)/(?1:':)/})$0
TXT

  tab '.remove', 'remove', <<-'TXT', uuid: '86EDAA64-AC75-4611-896D-391A8657C876'
.remove()$0
TXT

  tab '.removeAttr', 'removeAttr', <<-'TXT', uuid: '5432CA1D-9EFF-4F2C-AE3D-8361B3BC8605'
.removeAttr('${1:attribute name}')$0
TXT

  tab '.removeClass', 'removeClass', <<-'TXT', uuid: 'A9FA49D2-8F1F-4F01-9F91-F78F6B833B50'
.removeClass('${1:class name}')$0
TXT

  tab '.reset', 'reset', <<-'TXT', uuid: 'CC06109D-EA88-4F6A-8986-918DCA5EE8F6'
.reset(${1:function() {
	${0:// Act on the event}
\}});
TXT

  tab '.resize', 'resize', <<-'TXT', uuid: '7245093B-3968-4982-A8B3-E6381D1D98BC'
.resize(${1:function() {
	${0:// Act on the event}
\}});
TXT

  tab '.scroll', 'scroll', <<-'TXT', uuid: 'E4115CEE-3F18-4F49-A435-5F63C93A50F3'
.scroll(${1:function() {
	${0:// Act on the event}
\}});
TXT

  tab '.select', 'select', <<-'TXT', uuid: '330C5149-0338-40A3-94AF-337463115D7F'
.select(function() {
	${0:// Act on the event}
});
TXT

  tab '.show', 'show', <<-'TXT', uuid: '787FF0D2-F216-4D15-BEDF-98769D7C7D10'
.show(${1/(^[0-9]+$)|.+/(?1::')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::')/})$0
TXT

  tab '.show', 'show (with callback)', <<-'TXT', uuid: '48ED79F8-E373-4A10-8652-88704526AD5A', file: 'show - with callback'
.show(${1/(^[0-9]+$)|.+/(?1::')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::')/}, function() {
	${0://Stuff to do *after* the animation takes place};
});

TXT

  tab '.siblings', 'siblings', <<-'TXT', uuid: 'DA0A31DD-4C8B-4B96-A4D4-EA734BFCA9D4'
.siblings(${1/(.+)/(?1:':)/}${1:selector expression}${1/(.+)/(?1:':)/})$0
TXT

  tab '.size', 'size', <<-'TXT', uuid: 'E0ED9E7C-9EF4-4588-9D3C-03A2896F496D'
.size()$0
TXT

  tab '.slideDown', 'slideDown', <<-'TXT', uuid: 'BF3A7B2E-75B9-4F59-8A5F-C94E275D7105'
.slideDown(${1/(^[0-9]+$)|.+/(?1::')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::')/})$0
TXT

  tab '.slideDown', 'slideDown (with callback)', <<-'TXT', uuid: '3E97CCBD-C903-4263-9FBB-A9F63B1F9F34', file: 'slideDown - with callback'
.slideDown(${1/(^[0-9]+$)|.+/(?1::')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::')/}, function() {
	${0://Stuff to do *after* the animation takes place};
});

TXT

  tab '.slideToggle', 'slideToggle', <<-'TXT', uuid: '1D13196C-466E-4207-BBD9-45B79BF8E6FB'
.slideToggle(${1/(^[0-9]+$)|.+/(?1::')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::')/})$0
TXT

  tab '.slideUp', 'slideUp', <<-'TXT', uuid: '8A70859E-0F5F-46F4-B098-59815DD3FB7C'
.slideUp(${1/(^[0-9]+$)|.+/(?1::')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::')/})$0
TXT

  tab '.slideUp', 'slideUp (with callback)', <<-'TXT', uuid: '27D949E7-4F5E-422B-8C36-372300292761', file: 'slideUp - with callback'
.slideUp(${1/(^[0-9]+$)|.+/(?1::')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::')/}, function() {
	${0://Stuff to do *after* the animation takes place};
});

TXT

  tab '.submit', 'submit', <<-'TXT', uuid: '882D10A6-D7B7-4FB4-A176-9FC4C600329A'
.submit(${1:function() {
	${0:// Act on the event}
\}});
TXT

  tab '.text', 'text', <<-'TXT', uuid: '0C5B7FA2-2DF8-4F01-A96C-19815E6B9C41'
.text(${1:'some text'})$0
TXT

  tab '.toggle', 'toggle (event)', <<-'TXT', uuid: '507957DA-32C6-4C15-996F-4C2215B1B7DD', file: 'toggle'
.toggle(function() {
	${1:// Stuff to do every *odd* time the element is clicked;}
}, function() {
	${2:// Stuff to do every *even* time the element is clicked;}
});
$0
TXT

  tab '.toggle', 'toggle (show/hide)', <<-'TXT', uuid: 'DD6B9B40-5ABE-44EC-89FA-6251FB3AE8E9', file: 'toggle (show˸hide)'
.toggle(${1/(^[0-9]+$)|.+/(?1::')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::')/})$0
TXT

  tab '.toggleClass', 'toggleClass', <<-'TXT', uuid: 'B280DBDC-04A0-40DF-98EB-A40B20E51B7D'
.toggleClass('${1:class name}')$0
TXT

  tab '.trigger', 'trigger', <<-'TXT', uuid: 'FDBE1108-E40D-487F-8025-C0D7EE88BB6D'
.trigger('${1:event name}')$0
TXT

  tab '.unbind', 'unbind', <<-'TXT', uuid: '10B60336-F026-4BE3-8EF5-684848FF57F0'
.unbind('${1:event name}')$0
TXT

  tab '.val', 'val', <<-'TXT', uuid: 'A2A4C2A1-C6A8-4D0E-9549-DAD067016573'
.val(${1/(.+)/(?1:':)/}${1:text}${1/(.+)/(?1:':)/})$0
TXT

  tab '.width', 'width', <<-'TXT', uuid: 'D863CD87-093B-43A2-ADB5-476AFA617DFA'
.width(${1:integer})$0
TXT

  tab '.wrap', 'wrap', <<-'TXT', uuid: 'DC55B23C-6CAF-4770-8CAF-3D9A63D4FB5B'
.wrap('${1:&lt;div class="extra-wrapper"&gt;&lt;/div&gt;}')$0
TXT

  tab ':', ':checked', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '4E59B953-8663-41A5-BACE-34094480ED3B', key_equivalent: "^:"
:checked
TXT

  tab ':', ":contains('test')", <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: 'D8442C25-F005-4995-8918-D51658FD75FA', key_equivalent: "^~:"
:contains('${1:test}')$0
TXT

  tab ':', ':disabled', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: 'A6D9E0E1-5232-4B30-9D96-A085F4B8C721', key_equivalent: "^:"
:disabled
TXT

  tab ':', ':empty', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '54F78638-036C-4B57-8B6D-78C64BEC84E0', key_equivalent: "^:"
:empty
TXT

  tab ':', ':enabled', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '326083F8-59EA-4872-8EDB-32DFACF6C6A7', key_equivalent: "^:"
:enabled
TXT

  tab ':', ':eq(n)', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: 'D01A7D64-EBFB-40BF-8BEB-D53D6854AF3F', key_equivalent: "^~:"
:eq(${1:n})$0
TXT

  tab ':', ':even', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '3D9DFC6C-3EC9-419C-9545-4067501F55AA', key_equivalent: "^~:"
:even
TXT

  tab ':', ':first', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '1F1C3DA9-9CD9-44A4-BA0F-102959108394', key_equivalent: "^~:"
:first
TXT

  tab ':', ':first-child', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '2CD51B4A-9744-464D-BD42-587918A3E7F8', key_equivalent: "^:"
:first-child
TXT

  tab ':', ':first-of-type', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: 'FF6E4F76-165C-4673-98C6-AA62304321A3', key_equivalent: "^:"
:first-of-type
TXT

  tab ':', ':gt(n)', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '9E93C422-17DF-4E4C-94A6-E1EAB208EE17', key_equivalent: "^~:"
:gt(${1:n})$0
TXT

  tab ':', ':hidden', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '89678DD7-52FB-44AF-B047-4FA67FFAD6C0', key_equivalent: "^~:"
:hidden

TXT

  tab ':', ':last', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: 'E92F75EC-8F73-4A9F-8B0F-D78B8CDB1F2F', key_equivalent: "^~:"
:last
TXT

  tab ':', ':last-child', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: 'A151477E-0403-4A7B-9EF4-32154D482A34', key_equivalent: "^:"
:last-child
TXT

  tab ':', ':last-of-type', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '6D4E72DF-9184-429A-BDCF-79E7D311E7A2', key_equivalent: "^:"
:last-of-type
TXT

  tab ':', ':lt(n)', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '3BE44D61-FEC7-42E9-BE5F-2BA37CABE013', key_equivalent: "^~:"
:lt(${1:n})$0
TXT

  tab ':', ':not(s)', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '21E9EBE5-19BA-4F90-A3BE-5608DB9793EF', key_equivalent: "^:"
:not(${1:s})$0
TXT

  tab ':', ':nth-child(n)', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '44D8A9F3-9942-472D-82B0-F5E015D8BABA', key_equivalent: "^:"
:nth-child(${1:n})$0
TXT

  tab ':', ':nth-last-child(n)', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '65A0B862-1F5E-47D4-9D11-28AE2AD7FB16', key_equivalent: "^:"
:nth-last-child(${1:n})$0
TXT

  tab ':', ':nth-of-type(n)', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '2FBEE286-9869-4984-B439-4332E4A9A5A8', key_equivalent: "^:"
:nth-of-type(${1:n})$0
TXT

  tab ':', ':odd', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '715AA817-1F63-407A-B281-7CC606E0878A', key_equivalent: "^~:"
:odd
TXT

  tab ':', ':only-child', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '13B7CD6B-13B4-4102-9A23-F821108267FD', key_equivalent: "^:"
:only-child
TXT

  tab ':', ':only-of-type', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '04E58859-1465-4FA4-94FA-7AD641DD3484', key_equivalent: "^:"
:only-of-type
TXT

  tab ':', ':parent', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '2AB83C8D-6707-474C-844E-27DFF2743C1B', key_equivalent: "^~:"
:parent

TXT

  tab ':', ':root', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: '5F1FD7E2-BD1F-4AAD-925A-B7CD2896B376', key_equivalent: "^:"
:root
TXT

  tab ':', ':visible', <<-'TXT', scope: 'source.js.jquery meta.selector.jquery', uuid: 'E2DB157D-D4F0-4459-9BED-7E8BBC4EC8CA', key_equivalent: "^~:"
:visible

TXT

  tab 'clone', 'clone', <<-'TXT', uuid: 'EBABC1B0-8C15-40BF-9A63-3C133170C8F6'
.clone()$0
TXT

  tab 'ready', 'document ready', <<-'TXT', uuid: '58A59313-2F70-4024-985C-C46A454B88AF', file: 'ready'
\$(document).ready(function() {
	${0:// Stuff to do as soon as the DOM is ready;}
});

TXT

  tab 'this', '$(this)', <<-'TXT', uuid: '438A0DF2-C714-4D2A-A27A-EF0F62F5BC0F'
\$(this)$0
TXT

end