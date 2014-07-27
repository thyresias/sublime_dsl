# encoding: utf-8

snippets do

  default_scope 'text.html.grails'
  file_format :textmate

  tab 'bt', 'belongsTo', <<-'TXT', scope: 'source.groovy', uuid: '0D2FE949-F722-4802-8E99-44BF2516F4A8'
static belongsTo = [${1:ClassName}]
TXT

  tab 'constraints', 'constraints', <<-'TXT', scope: 'source.groovy', uuid: 'FC4117F8-C3AB-4430-8E46-C81F1F00177F'
static constraints = {
	$0
}
TXT

  tab 'cont', 'New Controller', <<-'TXT', scope: 'source.groovy', uuid: '602B1BBF-315A-4F64-B0D9-B9B211058A27'
class ${1:Name}Controller {
	def index = {
		 $0
	}
}
TXT

  tab 'createlink', '<g:createLink>', <<-'TXT', uuid: '0B125EC5-B157-428B-87B8-93DD46FB417C'
<g:createLink ${1:action="$2" }${3:controller="$4" }${5:id="$6" }${7:params="$8" }${9:url="$10" }${11:absolute="$12" }${13:base="$14" }>$15</g:createLink>
TXT

  tab 'createlinkto', '<g:createLinkTo>', <<-'TXT', uuid: '3F5C0C2A-395A-4D96-9128-8A9B96DAAA64'
<g:createLinkTo ${1:dir="$2" }${3:file="$4" }${5:absolute="$6" }${7:base="$8" } />
TXT

  tab 'ea', '<g:each in="..">', <<-'TXT', uuid: 'DFCB9C12-7638-4AD7-8634-45095CE41F5D', file: '˂g˸each in=ʺ__ʺ˃'
<g:each in="\${${1:item}}">
	${0:$TM_SELECTED_TEXT}
</g:each>
TXT

  tab 'each', '<g:each>', <<-'TXT', uuid: 'D72519A0-AC1C-40B5-AEEC-146727D173F3'
<g:each ${1:var="${2}" }in="\${$3}">
	${0:$TM_SELECTED_TEXT}
</g:each>
TXT

  tab 'eav', '<g:each in=".." var="i">', <<-'TXT', uuid: '182781ED-932C-49BC-A455-F0FE029CDE13', file: '˂g˸each in=ʺ__ʺ var=ʺiʺ˃'
<g:each in="\${${1:item}}" var="${2:i}">
	${0:$TM_SELECTED_TEXT}
</g:each>
TXT

  tab 'eavs', '<g:each in=".." var="e" status="i">', <<-'TXT', uuid: '2DA4083A-D3A9-45BD-8B65-EDEF8F508672', file: '˂g˸each in=ʺ__ʺ var=ʺeʺ status=ʺiʺ˃'
<g:each in="\${${1:item}}" var="${2:e}" status="${3:i}">
	${0:$TM_SELECTED_TEXT}
</g:each>
TXT

  tab 'else', '<g:else>', <<-'TXT', uuid: '17F32C97-B861-41BB-95D3-556C1426994A'
<g:else>
	${0:$TM_SELECTED_TEXT}
</g:else>
TXT

  tab 'elseif', '<g:elseif>', <<-'TXT', uuid: '34AA063A-B57C-4C2B-84B1-DAB133476173'
<g:elseif test="\${$1}">
	${0:$TM_SELECTED_TEXT}
</g:elseif>
TXT

  tab 'form', '<g:form action="..">', <<-'TXT', uuid: '69E74F74-6AEC-43A3-9F82-580CD17DE40B', file: '˂g˸form action=ʺ__ʺ˃'
<g:form name="${1:name}" action="${2:action}">
	${0:$TM_SELECTED_TEXT}
</g:form>
TXT

  tab 'form', '<g:form controller=".." action=".."> ', <<-'TXT', uuid: 'E65AF691-8006-4EAF-8BA4-D379F97C6CA7', file: '˂g˸form controller=ʺ__ʺ action=ʺ__ʺ˃ '
<g:form name="${1:name}" controller="${2:controller}" action="${3:action}">
	${0:$TM_SELECTED_TEXT}
</g:form>
TXT

  tab 'g:', 'New tag.. <g: ></g:>', <<-'TXT', uuid: '463F165A-4D1B-42BE-85AF-36EF1EC7937B', file: 'New tag__ ˂g˸', key_equivalent: "^>"
<g:${1:name} ${2:attr}="${3:value}">${0:$TM_SELECTED_TEXT}</g:$1>
TXT

  tab 'g:>', 'New short tag.. <g: />', <<-'TXT', uuid: '5694EFD5-1C2E-40FE-A282-695B43FD170A', file: 'New short tag__ ˂g˸ ˸˃', key_equivalent: "^>"
<g:${1:name} ${2:attr}="${3:value}" />
TXT

  tab 'haserrors', '<g:hasErrors>', <<-'TXT', uuid: '1422E213-5533-4F2E-90B8-A5D2F69E2CCC'
<g:hasErrors ${1:bean="$2" }${3:model="$4" }${5:field="$6" }>
	$0
</g:hasErrors>

TXT

  tab 'hm', 'hasMany', <<-'TXT', scope: 'source.groovy', uuid: '2B2758A5-B0FD-4203-A8C8-38058E16CC68'
static hasMany = [${1:items}:${2:ClassName}]
TXT

  tab 'ho', 'hasOne', <<-'TXT', scope: 'source.groovy', uuid: '74DE99D0-4BFA-4C83-8A1C-53237A83FE44'
static hasOne = [${1:item}:${2:ClassName}]
TXT

  tab 'if', '<g:if>', <<-'TXT', uuid: '0CC426AF-7257-44DC-8511-785C784C5B64', file: '˂g˸if ˸˃'
<g:if test="\${$1}">
	${0:$TM_SELECTED_TEXT}
</g:if>

TXT

  tab 'input', '<g:checkBox>', <<-'TXT', uuid: '763D4A25-C07F-4FDD-BE49-20C1853E7049'
<g:checkBox name="${1:name}" value="${2:true}" />
TXT

  tab 'input', '<g:field type="..">', <<-'TXT', uuid: 'CE3269DC-38A7-4B1E-AADC-B4B3B00D5178', file: '˂g˸field type=ʺ__ʺ˃'
<g:field type="${1:type}" name="${2:name}" value="${3:someValue}" />
TXT

  tab 'input', '<g:hiddenField>', <<-'TXT', uuid: 'FBE8D5E8-6FCC-4936-8B4C-60509B77B42D'
<g:hiddenField name="${1:name}" value="${2:someValue}" />
TXT

  tab 'input', '<g:radio> ', <<-'TXT', uuid: '86EB0B0F-E050-44AA-89A9-841C36FF5991'
<g:radio name="${1:name}" value="${2:true}" checked="${3:true}" />
TXT

  tab 'input', '<g:submitButton>', <<-'TXT', uuid: 'F97F4845-11BC-463E-9A6F-D5DB4B6DFDC4'
<g:submitButton name="${1:name}" value="${2:someValue}" />
TXT

  tab 'input', '<g:textField>', <<-'TXT', uuid: '4F46D369-43F4-4A6F-A11D-8906FCE8992D'
<g:textField name="${1:name}" value="${2:someValue}" />
TXT

  tab 'js', '<g:javascript>', <<-'TXT', uuid: 'AC7E256F-1B73-4975-A5D1-FDC84E667481'
<g:javascript>
	${0:$TM_SELECTED_TEXT}
</g:javascript>
TXT

  tab 'jsl', '<g:javascript library="..">', <<-'TXT', uuid: '110D7DDB-59CE-4DD5-A66C-2C9ADFF5F1C7', file: '˂g˸javascript library=ʺ__ʺ˃'
<g:javascript library="${1:prototype}" />
TXT

  tab 'link', '<g:link>', <<-'TXT', uuid: '407CC9F3-55BF-484B-B48D-989BA5916E58'
<g:link ${1:action="$2" }${3:controller="$4" }${5:id="$6" }${7:params="$8" }${9:url="$10" }${11:absolute="$12" }${13:base="$14" }>$15</g:link>
TXT

  tab 'mc', 'mockConstraints', <<-'TXT', scope: 'source.groovy', uuid: 'EAED6F03-BBDF-43CE-9536-C965EA21840B'
mockForConstraintsTests(${1:DomainClass})
def test${1} = new ${1}()
assertFalse test${1}.validate()
assertEquals "${2:nullable}", test${1}.errors["${3:someproperty}"]
TXT

  tab 'md', 'mockDomain', <<-'TXT', scope: 'source.groovy', uuid: '927DB595-92AE-4E2B-9CAA-7F270CD21032'
mockDomain(${1:DomainClass}, [
	new ${1}($0)
])
TXT

  tab 'mf', 'mockFor', <<-'TXT', scope: 'source.groovy', uuid: '75FFE634-ECF7-4FFB-9A22-2D88C8166722'
def ${1:mockControl} = mockFor(${2:ClassName})
${1}.demand.${3:yourMethod}(${4:1}..${5:1}) = {-&gt;
	$0
}
def test${2} = ${1}.createMock()
TXT

  tab 'ml', 'mockLogging', <<-'TXT', scope: 'source.groovy', uuid: '96BADBF6-D3F2-494E-B65F-3B4078DDF8C7'
mockLogging(${1:ClassName})
TXT

  tab 'ms', 'mockSession', <<-'TXT', scope: 'source.groovy', uuid: '60D7E667-547A-4057-8960-10EF89CBFB85'
mockSession.${1:property} = ${2:value}
TXT

  tab 'msg', '<g:message>', <<-'TXT', uuid: '6369A08A-2B14-4993-9CCF-0876FA142706'
<g:message code="${1}"${2: args="${3}"}${4: default="${5}"}/>$0
TXT

  tab 'msg', 'g.message()', <<-'TXT', scope: 'source.groovy.embedded.html.grails', uuid: 'B2B2C397-3DBB-4C1F-9C01-19B63740456D', file: 'g_message()'
g.message(code:"${1}"${2:, args:${3}}${4:, default:"${5}"})$0
TXT

  tab 'nq', 'namedQueries', <<-'TXT', scope: 'source.groovy', uuid: '72D7EC1C-E105-41F3-9D8D-9D48FB3B94DE'
static namedQueries = {
    ${1:queryName} {
        $0
    }
}
TXT

  tab 'out', 'out << ""', <<-'TXT', uuid: '0412E351-735A-4D11-8089-66D70843CA3F'
out << "${1:output}"
TXT

  tab 'rea', 'redirect(action:..)', <<-'TXT', scope: 'source.groovy', uuid: '86B0FEAB-6E08-47BF-8433-842B45453A93', file: 'redirect(action˸__)'
redirect(action:"${1:name}")
TXT

  tab 'reai', 'redirect(action:.., id:...)', <<-'TXT', scope: 'source.groovy', uuid: '4D085BE8-073E-4DF2-82B2-CD22E55571F5', file: 'redirect(action˸__, id˸___)'
redirect(action:"${1:name}",id:${2:1})
TXT

  tab 'rec', 'redirect(controller:..)', <<-'TXT', scope: 'source.groovy', uuid: 'F1948640-F514-478C-A765-B17EA54F78E1', file: 'redirect(controller˸__)'
redirect(controller:"${1:name}")
TXT

  tab 'reca', 'redirect(controller:.., action:..)', <<-'TXT', scope: 'source.groovy', uuid: '1887D21A-3F26-438D-A12F-4C1E4AB78149', file: 'redirect(controller˸__, action˸__)'
redirect(controller:"${1:c}",action:"${2:a}")
TXT

  tab 'recai', 'redirect(controller:.., action:.. , id:..)', <<-'TXT', scope: 'source.groovy', uuid: '4E8393F8-7E76-4370-9576-81E0A9C1C9CD', file: 'redirect(controller˸__, action˸__ , id˸__)'
redirect(controller:"${1:c}",action:"${2:a}",id:${3:1})
TXT

  tab 'render', '<g:render>', <<-'TXT', uuid: 'D0969043-B070-4CD5-9A23-3FFD9D45ADC6'
<g:render ${1:template="$2" }${3:bean="$4" }${5:model="$6" }${7:collection="$8" }${9:var="$10" }${11:plugin="$12" }/>
TXT

  tab 'rjson', 'render(contentType:"text/json") { ... } ', <<-'TXT', scope: 'source.groovy', uuid: 'E4A625FD-7B23-41C5-9CB1-1C6AB007B0D9', file: 'render(contentType˸ʺtext˸jsonʺ) { ___ } '
render(contentType:"text/json", builder:"json") {
	$0
}
TXT

  tab 'rt', 'render(text:"..")', <<-'TXT', scope: 'source.groovy', uuid: 'BFFEE9A8-577E-4DDA-8F58-FCE2504FC102', file: 'render(text˸ʺ__ʺ)'
render(text:"${1:value}")
TXT

  tab 'rtc', 'render(text:"..", contentType:"..")', <<-'TXT', scope: 'source.groovy', uuid: 'D8EABAB3-BA50-4C0E-AE3B-99AC754C269C', file: 'render(text˸ʺ__ʺ, contentType˸ʺ__ʺ)'
render(text:"${1:value}", contentType:"${2:text/xml}")
TXT

  tab 'rte', 'render(template:"..")', <<-'TXT', scope: 'source.groovy', uuid: '289C69E5-D989-4E03-A1F2-DB181F88DD5A', file: 'render(template˸ʺ__ʺ)'
render(template:"${1:name}")
TXT

  tab 'rteb', 'render(template:"..",bean:b)', <<-'TXT', scope: 'source.groovy', uuid: 'A1FE9F42-2A7A-4CE6-91FC-16AA6609B303', file: 'render(template˸ʺ__ʺ,bean˸b)'
render(template:"${1:name}",bean:${2:b})
TXT

  tab 'rtebv', 'render(template:"..",bean:b,var:"x")', <<-'TXT', scope: 'source.groovy', uuid: '4B447F0E-FE01-4E9D-A15C-A7660EF267BE', file: 'render(template˸ʺ__ʺ,bean˸b,var˸ʺxʺ)'
render(template:"${1:name}",bean:${2:b}, var:"${3:x}")
TXT

  tab 'rtec', 'render(template:"..",collection:c)', <<-'TXT', scope: 'source.groovy', uuid: '8656F441-5683-4C5A-BB94-AE7C37223440', file: 'render(template˸ʺ__ʺ,collection˸c)'
render(template:"${1:name}",collection:${1:col})
TXT

  tab 'rtecb', 'render(template:"..",collection:c, var:"x")', <<-'TXT', scope: 'source.groovy', uuid: '645A8378-2ECF-454E-AE30-B6D097FECBD4', file: 'render(template˸ʺ__ʺ,collection˸c, var˸ʺxʺ)'
render(template:"${1:name}",collection:${2:col}, var:"${3:x}")
TXT

  tab 'rtem', 'render(template:"..",model:m) ', <<-'TXT', scope: 'source.groovy', uuid: '606D2C16-3C65-4541-8D04-FE37264A2BF9', file: 'render(template˸ʺ__ʺ,model˸m) '
render(template:"${1:name}",model:[${2:name}:${3:obj}])
TXT

  tab 'rv', 'render(view:"..")', <<-'TXT', scope: 'source.groovy', uuid: '4E6DAF52-FD4B-470B-B230-224B525C2EFD', file: 'render(view˸ʺ__ʺ)'
render(view:"${1:name}")
TXT

  tab 'rvm', 'render(view:"..", model:m)', <<-'TXT', scope: 'source.groovy', uuid: '740B0115-F2DC-48DA-B295-42E877176D07', file: 'render(view˸ʺ__ʺ, model˸m)'
render(view:"${1:name}", model:[${2:name}:${3:obj}])
TXT

  tab 'rxml', 'render(contentType:"text/xml") { ... }', <<-'TXT', scope: 'source.groovy', uuid: '4A6625A0-FB94-46A4-BF8D-8EBBC77A4778', file: 'render(contentType˸ʺtext˸xmlʺ) { ___ }'
render(contentType:"text/xml") {
	$0
}
TXT

  tab 'select', '<g:currencySelect ..>', <<-'TXT', uuid: '2527E20F-D60E-486F-BD10-38C2751C22AF', file: '˂g˸currencySelect __˃'
<g:currencySelect name="${1:currencyName}" value="\${${2:currency}}" />
TXT

  tab 'select', '<g:localeSelect ..>', <<-'TXT', uuid: '7CA17672-29EA-4978-A34A-0520AB700E36', file: '˂g˸localeSelect __˃'
<g:localeSelect name="${1:localeName}" value="\${${2:request.locale}}" />
TXT

  tab 'select', '<g:select from=".." >', <<-'TXT', uuid: '230911E9-EE4E-4309-9C19-BD3BA5763AB7', file: '˂g˸select from=ʺ__ʺ ˃'
<g:select name="${1:name}" value="\${${2:value}}" from="\${${3:[1,2,3]}}" />
TXT

  tab 'select', '<g:timeZoneSelect ..>', <<-'TXT', uuid: '698250E4-E144-4F89-B7F7-C9B8FA8113AB', file: '˂g˸timeZoneSelect __˃'
<g:timeZoneSelect name="${1:selectName}" value="\${${2:tz}}" />
TXT

  tab 'set', '<g:set>', <<-'TXT', uuid: 'D874BAA6-C6C8-4259-87EB-8764F187AA6F'
<g:set ${1:var="$2" }${3:value="$4" }${5:scope="${6:request/page/flash/session}" }/>
TXT

  tab 'tag', 'New Tag', <<-'TXT', scope: 'source.groovy', uuid: '4C3F139B-D57D-4595-B6FA-8D5F7919148A', file: 'New Tag 2'
def ${1:closureName} =  { attrs, body ->
	$0
}
TXT

  tab 'taglib', 'New Tag Library', <<-'TXT', scope: 'source.groovy', uuid: 'C82DAAA6-61CF-4A30-977F-5A1986F8EF04'
class ${1:Name}TagLib {
	$0
}
TXT

  tab 'unit', 'New Unit Test', <<-'TXT', scope: 'source.groovy', uuid: '5E358AE7-2B58-4B13-B5DE-13834E7951B3'
package ${1}

import grails.test.*

class ${2:Name}Tests extends GrailsUnitTestCase {

	protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

	void test${3:Something}() {
		 $0
	}

}
TXT

  tab 'while', '<g:while>', <<-'TXT', uuid: '0C1988E9-A250-46E2-9608-3FD217BD8C61', file: '˂g˸while ˸˃'
<g:while test="\${$1}">
	${0:$TM_SELECTED_TEXT}
</g:while>

TXT

end