# encoding: utf-8

snippets do

  default_scope 'source.ruby.rails'

  tab '$L', '$LABEL', <<-'TXT', scope: 'source.yaml'
\$LABEL
TXT

  tab 'aftc', 'after_create', "after_create "

  tab 'aftd', 'after_destroy', "after_destroy "

  tab 'afts', 'after_save', "after_save "

  tab 'aftu', 'after_update', "after_update "

  tab 'aftv', 'after_validation', "after_validation "

  tab 'aftvoc', 'after_validation_on_create', "after_validation_on_create "

  tab 'aftvou', 'after_validation_on_update', "after_validation_on_update "

  tab 'art', 'assert_redirected_to', <<-'TXT', file: 'Test-Assert-Redirected-To-(art)'
assert_redirected_to ${2::action => "${1:index}"}
TXT

  tab 'artnp', 'assert_redirected_to (nested path)', <<-'TXT', file: 'assert_redirected_to-(nested-path)'
assert_redirected_to ${2:${12:parent}_${13:child}_path(${14:@}${15:${12}}, ${16:@}${17:${13}})}
TXT

  tab 'artnpp', 'assert_redirected_to (nested path plural)', <<-'TXT', file: 'assert_redirected_to-(nested-path-plural)'
assert_redirected_to ${10:${2:parent}_${3:child}_path(${4:@}${5:${2}})}
TXT

  tab 'artp', 'assert_redirected_to (path)', <<-'TXT', file: 'assert_redirected_to-(path)'
assert_redirected_to ${2:${12:model}_path(${13:@}${14:${12}})}
TXT

  tab 'artpp', 'assert_redirected_to (path plural)', <<-'TXT', file: 'assert_redirected_to-(path-plural)'
assert_redirected_to ${10:${2:model}s_path}
TXT

  tab 'asd', 'assert_difference', <<-'TXT', scope: 'source.ruby'
assert_difference "${1:Model}.${2:count}", ${3:1} do
  $0
end
TXT

  tab 'asg', 'assert(var = assigns(:var))', <<-'TXT', scope: 'source.ruby', file: 'assert(var-=-assigns(%3Avar))'
assert(${1:var} = assigns(:${1}), "Cannot find @${1}")
$0
TXT

  tab 'asnd', 'assert_no_difference', <<-'TXT', scope: 'source.ruby'
assert_no_difference "${1:Model}.${2:count}" do
  $0
end
TXT

  tab 'asre', 'assert_response', <<-'TXT', file: 'Test-Assert-Response-(are)'
assert_response :${1:success}, @response.body$0
TXT

  tab 'asrj', 'assert_rjs', <<-'TXT'
assert_rjs :${1:replace}, ${2:"${3:dom id}"}
TXT

  tab 'ass', 'assert_select', <<-'TXT'
assert_select '${1:path}'${2:, :${3:text} => ${4:'${5:inner_html}'}}${6: do
	$0
end}
TXT

  tab 'befc', 'before_create', "before_create "

  tab 'befd', 'before_destroy', "before_destroy "

  tab 'befs', 'before_save', "before_save "

  tab 'befu', 'before_update', "before_update "

  tab 'befv', 'before_validation', "before_validation "

  tab 'befvoc', 'before_validation_on_create', "before_validation_on_create "

  tab 'befvou', 'before_validation_on_update', <<-'TXT'
before_validation_on_update
TXT

  tab 'bt', 'belongs_to', <<-'TXT', file: 'belongs_to-(bt)'
belongs_to :${1:object}${2:, :class_name => "${3:${1/[[:alpha:]]+|(_)/(?1::\u$0)/g}}", :foreign_key => "${4:${1}_id}"}
TXT

  tab 'cla', 'Create controller class', <<-'TXT', scope: 'source.ruby', file: 'Create-controller-class'
class ${1:Model}Controller < ApplicationController
	before_filter :find_${2:model}

	$0

	private
	def find_${2}
		@$2 = ${3:$1}.find(params[:id]) if params[:id]
	end
end
TXT

  tab 'cla', 'Create functional test class', <<-'TXT', scope: 'source.ruby', file: 'Create-functional-test-class'
require File.dirname(__FILE__) + '/../test_helper'

class ${1:Model}ControllerTest < ActionController::TestCase
	deft$0
end

TXT

  tab 'crw', 'cattr_accessor', <<-'TXT'
cattr_accessor :${0:attr_names}
TXT

  tab 'defcreate', 'def create - resource', <<-'TXT', scope: 'meta.rails.controller', file: 'def-create-resource'
def create
	@${1:model} = ${2:${1/[[:alpha:]]+|(_)/(?1::\u$0)/g}}.new(params[:$1])
	$0
	respond_to do |wants|
		if @$1.save
			flash[:notice] = '$2 was successfully created.'
			wants.html { redirect_to(@$1) }
			wants.xml { render :xml => @$1, :status => :created, :location => @$1 }
		else
			wants.html { render :action => "new" }
			wants.xml { render :xml => @$1.errors, :status => :unprocessable_entity }
		end
	end
end

TXT

  tab 'deftg', 'def test_should_get_action', <<-'TXT', scope: 'meta.rails.functional_test', file: 'def-get-request'
def test_should_get_${1:action}
	${2:@${3:model} = ${4:$3s}(:${5:fixture_name})
	}get :${1}${6:, :id => @$3.to_param}
	assert_response :success
	$0
end
TXT

  tab 'deftp', 'def test_should_post_action', <<-'TXT', scope: 'meta.rails.functional_test', file: 'def-post-request'
def test_should_post_${1:action}
	${3:@$2 = ${4:$2s}(:${5:fixture_name})
	}post :${1}${6:, :id => @$2.to_param}, :${2:model} => { $0 }
	assert_response :redirect

end
TXT

  tab 'end', 'end (ERB)', <<-'TXT', scope: 'text.html.ruby', file: 'end'
<% end -%>
TXT

  tab 'f.', 'f.check_box (ffcb)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-checkbox'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.check_box :${1:attribute}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'f.', 'f.file_field (ffff)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-file_field'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.file_field :${1:attribute}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'f.', 'f.hidden_field (ffhf)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-hidden_field'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.hidden_field :${1:attribute}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'f.', 'f.label (ffl)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-label'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.label :${1:attribute}${2:, "${3:${1/[[:alpha:]]+|(_)/(?1: :\u$0)/g}}"}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'f.', 'f.password_field (ffpf)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-password_field'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.password_field :${1:attribute}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'f.', 'f.radio_box (ffrb)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-radio_box'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.radio_box :${1:attribute}, :${2:tag_value}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'f.', 'f.submit (ffs)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-submit'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.submit "${1:Submit}"${2:, :disable_with => '${3:$1ing...}'}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'f.', 'f.text_area (ffta)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-text_area'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.text_area :${1:attribute}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'f.', 'f.text_field (fftf)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-text_field'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.text_field :${1:attribute}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'ff', 'form_for', <<-'TXT', scope: 'text.html.ruby, text.haml'
${TM_RAILS_TEMPLATE_START_RUBY_INLINE}form_for @${1:model} do |f|${TM_RAILS_TEMPLATE_END_RUBY_INLINE}
  $0
${TM_RAILS_TEMPLATE_END_RUBY_BLOCK}
TXT

  tab 'ffcb', 'form_for check_box', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-check_box'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.check_box :${1:attribute}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'ffe', 'form_for with errors', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-with-errors'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}error_messages_for :${1:model}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}

${TM_RAILS_TEMPLATE_START_RUBY_INLINE}form_for @${2:$1} do |f|${TM_RAILS_TEMPLATE_END_RUBY_INLINE}
  $0
${TM_RAILS_TEMPLATE_END_RUBY_BLOCK}
TXT

  tab 'ffff', 'form_for file_field', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-file_field-2'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.file_field :${1:attribute}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'ffhf', 'form_for hidden_field', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-hidden_field-2'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.hidden_field :${1:attribute}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'ffl', 'form_for label', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-label-2'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.label :${1:attribute}${2:, "${3:${1/[[:alpha:]]+|(_)/(?1: :\u$0)/g}}"}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'ffpf', 'form_for password_field', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-password_field-2'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.password_field :${1:attribute}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'ffrb', 'form_for radio_box', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-radio_box-2'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.radio_box :${1:attribute}, :${2:tag_value}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'ffs', 'form_for submit', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-submit-2'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.submit "${1:Submit}"${2:, :disable_with => '${3:$1ing...}'}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'ffta', 'form_for text_area', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-text_area-2'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.text_area :${1:attribute}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'fftf', 'form_for text_field', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'form_for-text_field-2'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}f.text_field :${1:attribute}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'fi', '<%= Fixtures.identify(:symbol) %>', <<-'TXT', scope: 'source.yaml', file: '%3C%=-Fixtures_identify(%3Asymbol)-%%3E'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}Fixtures.identify(:${1:name})${TM_RAILS_TEMPLATE_END_RUBY_EXPR}$0
TXT

  tab 'fina', 'find(:all)', <<-'TXT', file: 'find(%3Aall)'
find(:all${1:, :conditions => ['${2:${3:field} = ?}', ${5:true}]})
TXT

  tab 'finf', 'find(:first)', <<-'TXT', file: 'find(%3Afirst)'
find(:first${1:, :conditions => ['${2:${3:field} = ?}', ${5:true}]})
TXT

  tab 'fini', 'find(id)', <<-'TXT'
find(${1:id})
TXT

  tab 'flash', 'flash[…]', <<-'TXT', file: 'rails-flash'
flash[:${1:notice}] = "${2:Successfully created...}"$0
TXT

  tab 'for', 'for loop in rhtml', <<-'TXT', scope: 'text.html.ruby', file: 'for-loop-erb'
<% if !${1:list}.blank? %>
  <% for ${2:item} in ${1} %>
    $3
  <% end %>
<% else %>
  $4
<% end %>

TXT

  tab 'ft', 'form_tag', <<-'TXT', scope: 'text.html.ruby, text.haml', file: '180-rails-form_tag'
${TM_RAILS_TEMPLATE_START_RUBY_INLINE}form_tag(${1::action => "${5:update}"}${6:, {:${8:class} => "${9:form}"\}}) do${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
  $0
${TM_RAILS_TEMPLATE_END_RUBY_BLOCK}
TXT

  tab 'habtm', 'has_and_belongs_to_many', <<-'TXT', file: 'has_and_belongs_to_many-(habtm)'
has_and_belongs_to_many :${1:object}${2:, :join_table => "${3:table_name}", :foreign_key => "${4:${1}_id}"}
TXT

  tab 'hide', 'page.hide (*ids)', <<-'TXT', scope: 'source.ruby.rails.rjs', file: 'page_hide-(%2Aids)'
page.hide ${1:"${2:id(s)}"}
TXT

  tab 'hm', 'has_many', <<-'TXT', file: 'has_many-(hm)'
has_many :${1:object}s${2:, :class_name => "${1}", :foreign_key => "${4:reference}_id"}
TXT

  tab 'hmd', 'has_many :dependent => :destroy', <<-'TXT', file: 'has_many-dependent-=-destroy'
has_many :${1:object}s${2:, :class_name => "${1}", :foreign_key => "${4:reference}_id"}, :dependent => :destroy$0
TXT

  tab 'hmt', 'has_many (through)', <<-'TXT', file: 'has_many-(through)'
has_many :${1:objects}, :through => :${2:join_association}${3:, :source => :${4:${2}_table_foreign_key_to_${1}_table}}
TXT

  tab 'ho', 'has_one', <<-'TXT', file: 'has_one-(ho)'
has_one :${1:object}${2:, :class_name => "${3:${1/[[:alpha:]]+|(_)/(?1::\u$0)/g}}", :foreign_key => "${4:${1}_id}"}
TXT

  tab 'ins', 'page.insert_html (position, id, partial)', <<-'TXT', scope: 'source.ruby.rails.rjs', file: 'page_insert_html-(position-id-partial)'
page.insert_html :${1:top}, ${2:"${3:id}"}, :${4:partial => "${5:template}"}
TXT

  tab 'ist', 'image_submit_tag', <<-'TXT', scope: 'text.html.ruby, text.haml'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}image_submit_tag("${1:agree.png}"${2:${3:, :id => "${4:${1/^(\w+)(\.\w*)?$/$1/}}"}${5:, :name => "${6:${1/^(\w+)(\.\w*)?$/$1/}}"}${7:, :class => "${8:${1/^(\w+)(\.\w*)?$/$1/}-button}"}${9:, :disabled => ${10:false}}})${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'jit', 'javascript_include_tag', <<-'TXT', scope: 'text.html.ruby'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}javascript_include_tag ${1::all}${2:, :cache => ${3:true}}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'lia', 'link_to (action)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'lia'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}link_to "${1:link text...}", :action => "${2:index}"${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'liai', 'link_to (action, id)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'liai'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}link_to "${1:link text...}", :action => "${2:edit}", :id => ${3:@item}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'lic', 'link_to (controller)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'lic'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}link_to "${1:link text...}", :controller => "${2:items}"${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'lica', 'link_to (controller, action)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'lica'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}link_to "${1:link text...}", :controller => "${2:items}", :action => "${3:index}"${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'licai', 'link_to (controller, action, id)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'licai'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}link_to "${1:link text...}", :controller => "${2:items}", :action => "${3:edit}", :id => ${4:@item}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'lim', 'link_to model', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'link_to-model'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}link_to ${1:model}.${2:name}, ${3:${4:$1}_path(${14:$1})}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'linp', 'link_to (nested path)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'link_to-(nested-path)'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}link_to ${1:"${2:link text...}"}, ${3:${12:parent}_${13:child}_path(${14:@}${15:${12}}, ${16:@}${17:${13}})}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'linpp', 'link_to (nested path plural)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'link_to-(nested-path-plural)'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}link_to ${1:"${2:link text...}"}, ${3:${10:parent}_${11:child}_path(${12:@}${13:${10}})}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'lip', 'link_to (path)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'link_to-(path)'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}link_to ${1:"${2:link text...}"}, ${3:${12:model}_path(${13:@}${14:${12}})}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'lipp', 'link_to (path plural)', <<-'TXT', scope: 'text.html.ruby, text.haml', file: 'link_to-(path-plural)'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}link_to ${1:"${2:link text...}"}, ${3:${4:model}s_path}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'logd', 'logger.debug', <<-'TXT', file: 'logger_debug'
logger.debug { "${1:message}" }$0
TXT

  tab 'loge', 'logger.error', <<-'TXT', file: 'logger_error'
logger.error { "${1:message}" }$0
TXT

  tab 'logf', 'logger.fatal', <<-'TXT', file: 'logger_fatal'
logger.fatal { "${1:message}" }$0
TXT

  tab 'logi', 'logger.info', <<-'TXT', file: 'logger_info'
logger.info { "${1:message}" }$0
TXT

  tab 'logw', 'logger.warn', <<-'TXT', file: 'logger_warn'
logger.warn { "${1:message}" }$0
TXT

  tab 'map', 'map.named_route', <<-'TXT', scope: 'meta.rails.routes', file: 'map_named_route'
${1:map}.${2:connect} '${3::controller/:action/:id}'
TXT

  tab 'mapca', 'map.catch_all', <<-'TXT', scope: 'meta.rails.routes', file: 'map_catch_all'
${1:map}.catch_all "*${2:anything}", :controller => "${3:default}", :action => "${4:error}"

TXT

  tab 'mapr', 'map.resource', <<-'TXT', scope: 'meta.rails.routes', file: 'map_resource'
${1:map}.resource :${2:resource}${10: do |${11:$2}|
  $0
end}
TXT

  tab 'maprs', 'map.resources', <<-'TXT', scope: 'meta.rails.routes', file: 'map_resources'
${1:map}.resources :${2:resource}${10: do |${11:$2}|
  $0
end}
TXT

  tab 'mapwo', 'map.with_options', <<-'TXT', scope: 'meta.rails.routes', file: 'map_with_options'
${1:map}.with_options :${2:controller} => '${3:thing}' do |${4:$3}|
	$0
end

TXT

  tab 'mccc', 'Create Several Columns in Table', <<-'TXT', scope: 'meta.rails.migration.create_table', file: 'Migration-Create-Column-Continue-(mccc)'
t.column ${1:title}, :${2:string}
mccc$0
TXT

  tab 'mcol', 'Create Column in Table', <<-'TXT', scope: 'meta.rails.migration.create_table', file: 'Migration-Create-Column-(mcc)'
t.column ${1:title}, :${2:string}
$0
TXT

  tab 'mcol', 'Remove / Add Column', <<-'TXT', scope: 'meta.rails.migration - meta.rails.migration.create_table - meta.rails.migration.change_table', file: 'Migration-Remove-and-Add-Column-(mrac)'
remove_column :${1:table}, :${2:column}${3: [press tab twice to generate add_column]}
TXT

  tab 'mp', 'map(&:sym_proc)', <<-'TXT', file: 'map(-%3Asym_proc)'
map(&:${1:id})
TXT

  tab 'mrw', 'mattr_accessor', <<-'TXT'
mattr_accessor :${0:attr_names}
TXT

  tab 'mtab', 'Drop / Create Table', <<-'TXT', scope: 'meta.rails.migration - meta.rails.migration.create_table - meta.rails.migration.change_table', file: 'Migration-Drop-Create-Table-(mdct)'
drop_table :${1:table}${2: [press tab twice to generate create_table]}
TXT

  tab 'nc', 'named_scope', <<-'TXT'
named_scope :name${1:, :joins => :${2:table}}, :conditions => ${3:['${4:${5:field} = ?}', ${6:true}]}

TXT

  tab 'ncl', 'named_scope lambda', <<-'TXT', file: 'named_scope-lambda'
named_scope :name, lambda { |${1:param}| { :conditions => ${3:['${4:${5:field} = ?}', ${6:$1}]} } }

TXT

  tab 'ra', 'render (action)', <<-'TXT', file: 'render-(action)...-(ra)'
render :action => "${1:action}"
TXT

  tab 'ral', 'render (action, layout)', <<-'TXT', file: 'render-(action-layout)-(ral)'
render :action => "${1:action}", :layout => "${2:layoutname}"
TXT

  tab 'rdb', 'RAILS_DEFAULT_LOGGER.debug', <<-'TXT', file: 'RAILS_DEFAULT_LOGGER.debug-(rdb)'
RAILS_DEFAULT_LOGGER.debug "${1:message}"$0
TXT

  tab 'rea', 'redirect_to (action)', <<-'TXT', file: 'rea'
redirect_to :action => "${1:index}"
TXT

  tab 'reai', 'redirect_to (action, id)', <<-'TXT', file: 'reai'
redirect_to :action => "${1:show}", :id => ${0:@item}
TXT

  tab 'rec', 'redirect_to (controller)', <<-'TXT', file: 'rec'
redirect_to :controller => "${1:items}"
TXT

  tab 'reca', 'redirect_to (controller, action)', <<-'TXT', file: 'reca'
redirect_to :controller => "${1:items}", :action => "${2:list}"
TXT

  tab 'recai', 'redirect_to (controller, action, id)', <<-'TXT', file: 'recai'
redirect_to :controller => "${1:items}", :action => "${2:show}", :id => ${0:@item}
TXT

  tab 'renp', 'redirect_to (nested path)', <<-'TXT', file: 'redirect_to-(nested-path)'
redirect_to(${2:${12:parent}_${13:child}_path(${14:@}${15:${12}}, ${16:@}${17:${13}})})
TXT

  tab 'renpp', 'redirect_to (nested path plural)', <<-'TXT', file: 'redirect_to-(nested-path-plural)'
redirect_to(${2:${10:parent}_${11:child}_path(${12:@}${13:${10}})})
TXT

  tab 'rep', 'page.replace (id, partial)', <<-'TXT', scope: 'source.ruby.rails.rjs', file: 'page_replace-(id-partial)'
page.replace ${1:"${2:id}"}, :${3:partial => "${4:template}"}
TXT

  tab 'rep', 'redirect_to (path)', <<-'TXT', file: 'redirect_to-(path)'
redirect_to(${2:${12:model}_path(${13:@}${14:${12}})})
TXT

  tab 'reph', 'page.replace_html (id, partial)', <<-'TXT', scope: 'source.ruby.rails.rjs', file: 'page_replace_html-(id-partial)'
page.replace_html ${1:"${2:id}"}, :${3:partial => "${4:template}"}
TXT

  tab 'repp', 'redirect_to (path plural)', <<-'TXT', file: 'redirect_to-(path-plural)'
redirect_to(${2:${10:model}s_path})
TXT

  tab 'rest', 'respond_to', <<-'TXT', scope: 'meta.rails.controller'
respond_to do |wants|
	wants.${1:html}${2: { $0 \}}
end
TXT

  tab 'returning', 'returning do |variable| … end', <<-'TXT', file: 'returning-do-%7Cvariable%7C-%E2%80%A6-end'
returning ${1:variable} do${2/(^(?<var>\s*[a-z_][a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1: |)/}${2:v}${2/(^(?<var>\s*[a-z_][a-zA-Z0-9_]*\s*)(,\g<var>)*,?\s*$)|.*/(?1:|)/}
	$0
end
TXT

  tab 'rf', 'render (file)', <<-'TXT', file: 'render-(file)-(rf)'
render :file => "${1:filepath}"
TXT

  tab 'rfu', 'render (file, use_full_path)', <<-'TXT', file: 'render-(file-use_full_path)-(rfu)'
render :file => "${1:filepath}", :use_full_path => ${2:false}
TXT

  tab 'ri', 'render (inline)', <<-'TXT', file: 'render-(inline)-(ri)'
render :inline => "${1:<%= 'hello' %>}"
TXT

  tab 'ril', 'render (inline, locals)', <<-'TXT', file: 'render-(inline-locals)-(ril)'
render :inline => "${1:<%= 'hello' %>}", :locals => { ${2::name} => "${3:value}"$4 }
TXT

  tab 'rit', 'render (inline, type)', <<-'TXT', file: 'render-(inline-type)-(rit)'
render :inline => "${1:<%= 'hello' %>}", :type => ${2::rxml}
TXT

  tab 'rl', 'render (layout)', <<-'TXT', file: 'render-(layout)-(rl)'
render :layout => "${1:layoutname}"
TXT

  tab 'rn', 'render (nothing)', <<-'TXT', file: 'render-(nothing)-(rn)'
render :nothing => ${1:true}
TXT

  tab 'rns', 'render (nothing, status)', <<-'TXT', file: 'render-(nothing-status)-(rns)'
render :nothing => ${1:true}, :status => ${2:401}
TXT

  tab 'rp', 'render (partial)', <<-'TXT', file: 'render-(partial)-(rp)'
render :partial => "${1:item}"
TXT

  tab 'rpc', 'render (partial, collection)', <<-'TXT', file: 'render-(partial-collection)-(rpc)'
render :partial => "${1:item}", :collection => ${2:@$1s}
TXT

  tab 'rpl', 'render (partial, locals)', <<-'TXT', file: 'render-(partial-locals)-(rpl)'
render :partial => "${1:item}", :locals => { :${2:$1} => ${3:@$1}$0 }
TXT

  tab 'rpo', 'render (partial, object)', <<-'TXT', file: 'render-(partial-object)-(rpo)'
render :partial => "${1:item}", :object => ${2:@$1}
TXT

  tab 'rps', 'render (partial, status)', <<-'TXT', file: 'render-(partial-status)-(rps)'
render :partial => "${1:item}", :status => ${2:500}
TXT

  tab 'rt', 'render (text)', <<-'TXT', file: 'render-(text)-(rt)'
render :text => "${1:text to render...}"
TXT

  tab 'rtl', 'render (text, layout)', <<-'TXT', file: 'render-(text-layout)-(rtl)'
render :text => "${1:text to render...}", :layout => "${2:layoutname}"
TXT

  tab 'rtlt', 'render (text, layout => true)', <<-'TXT', file: 'render-(text-layout=%3Etrue)-(rtlt)'
render :text => "${1:text to render...}", :layout => ${2:true}
TXT

  tab 'rts', 'render (text, status)', <<-'TXT', file: 'render-(text-status)-(rts)'
render :text => "${1:text to render...}", :status => ${2:401}
TXT

  tab 'ru', 'render (update)', <<-'TXT', file: 'render-(update)'
render :update do |${2:page}|
	$2.$0
end
TXT

  tab 'show', 'page.show (*ids)', <<-'TXT', scope: 'source.ruby.rails.rjs', file: 'page_show-(%2Aids)'
page.show ${1:"${2:id(s)}"}
TXT

  tab 'slt', 'stylesheet_link_tag', <<-'TXT', scope: 'text.html.ruby'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}stylesheet_link_tag {1::all}${2:, :cache => ${3:true}}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 'st', 'submit_tag', <<-'TXT', scope: 'text.html.ruby, text.haml'
${TM_RAILS_TEMPLATE_START_RUBY_EXPR}submit_tag "${1:Save changes}"${2:, :id => "${3:submit}"}${4:, :name => "${5:$3}"}${6:, :class => "${7:form_$3}"}${8:, :disabled => ${9:false}}${10:, :disable_with => "${11:Please wait...}"}${TM_RAILS_TEMPLATE_END_RUBY_EXPR}
TXT

  tab 't.', 't.binary (tcbi)', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 't_binary-(tcbi)'
t.binary :${1:title}${2:, :limit => ${3:2}.megabytes}
t.$0
TXT

  tab 't.', 't.boolean (tcb)', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 't_boolean-(tcb)'
t.boolean :${1:title}
t.$0
TXT

  tab 't.', 't.date (tcda)', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 't_date-(tcda)'
t.date :${1:title}
t.$0
TXT

  tab 't.', 't.datetime (tcdt)', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 't_datetime-(tcdt)'
t.datetime :${1:title}
t.$0
TXT

  tab 't.', 't.decimal (tcd)', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 't_decimal-(tcd)'
t.decimal :${1:title}${2:${3:, :precision => ${4:10}}${5:, :scale => ${6:2}}}
t.$0
TXT

  tab 't.', 't.float (tcf)', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 't_float-(tcf)'
t.float :${1:title}
t.$0
TXT

  tab 't.', 't.integer (tci)', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 't_integer-(tci)'
t.integer :${1:title}
t.$0
TXT

  tab 't.', 't.lock_version (tcl)', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 't_lock_version-(tcl)'
t.integer :lock_version, :null => false, :default => 0
t.$0
TXT

  tab 't.', 't.references (tcr)', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 't_references-(tcr)'
t.references :${1:taggable}${2:, :polymorphic => ${3:{ :default => '${4:Photo}' \}}}
t.$0
TXT

  tab 't.', 't.rename (tre)', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 't_rename-(tre)'
t.rename(:${1:old_column_name}, :${2:new_column_name})
t.$0
TXT

  tab 't.', 't.string (tcs)', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 't_string-(tcs)'
t.string :${1:title}
t.$0
TXT

  tab 't.', 't.text (tct)', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 't_text-(tct)'
t.text :${1:title}
t.$0
TXT

  tab 't.', 't.time (tcti)', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 't_time-(tcti)'
t.time :${1:title}
t.$0
TXT

  tab 't.', 't.timestamp (tcts)', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 't_timestamp-(tcts)'
t.timestamp :${1:title}
t.$0
TXT

  tab 't.', 't.timestamps (tctss)', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 't_timestamps-(tctss)'
t.timestamps
t.$0
TXT

  tab 'tcb', 'Table column boolean', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 'Create-boolean-column'
t.boolean :${1:title}
$0
TXT

  tab 'tcbi', 'Table column binary', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 'Create-binary-column'
t.binary :${1:title}${2:, :limit => ${3:2}.megabytes}
$0
TXT

  tab 'tcd', 'Table column decimal', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 'Create-decimal-column'
t.decimal :${1:title}${2:${3:, :precision => ${4:10}}${5:, :scale => ${6:2}}}
$0
TXT

  tab 'tcda', 'Table column date', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 'Create-date-column'
t.date :${1:title}
$0
TXT

  tab 'tcdt', 'Table column datetime', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 'Create-datetime-column'
t.datetime :${1:title}
$0
TXT

  tab 'tcf', 'Table column float', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 'Create-float-column'
t.float :${1:title}
$0
TXT

  tab 'tci', 'Table column integer', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 'Create-integer-column'
t.integer :${1:title}
$0
TXT

  tab 'tcl', 'Table column lock_version', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 'Create-lock_version-column'
t.integer :lock_version, :null => false, :default => 0
$0
TXT

  tab 'tcr', 'Table column(s) references', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 'Create-references-column'
t.references :${1:taggable}${2:, :polymorphic => ${3:{ :default => '${4:Photo}' \}}}
$0
TXT

  tab 'tcs', 'Table column string', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 'Create-string-column'
t.string :${1:title}
$0
TXT

  tab 'tct', 'Table column text', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 'Create-text-column'
t.text :${1:title}
$0
TXT

  tab 'tcti', 'Table column time', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 'Create-time-column'
t.time :${1:title}
$0
TXT

  tab 'tcts', 'Table column timestamp', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 'Create-timestamp-column'
t.timestamp :${1:title}
$0
TXT

  tab 'tctss', 'Table column timestamps', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 'Create-timestamps-columns'
t.timestamps
$0
TXT

  tab 'tog', 'page.toggle (*ids)', <<-'TXT', scope: 'source.ruby.rails.rjs', file: 'page_toggle-(%2Aids)'
page.toggle ${1:"${2:id(s)}"}
TXT

  tab 'tre', 'Table column(s) rename', <<-'TXT', scope: 'meta.rails.migration.create_table, meta.rails.migration.change_table', file: 'Table-column(s)-rename'
t.rename(:${1:old_column_name}, :${2:new_column_name})
$0
TXT

  tab 'va', 'validates_associated', <<-'TXT', file: 'validates_associated-(va)'
validates_associated :${1:attribute}${2:, :on => :${3:create}}
TXT

  tab 'vaif', 'validates_associated if', <<-'TXT', file: 'validates_associated-if-(vaif)'
validates_associated :${1:attribute}${2:, :on => :${3:create}, :if => proc { |obj| ${5:obj.condition?} }}
TXT

  tab 'vao', 'validates_acceptance_of', <<-'TXT'
validates_acceptance_of :${1:terms}${2:${3:, :accept => "${4:1}"}${5:, :message => "${6:You must accept the terms of service}"}}
TXT

  tab 'vaoif', 'validates_acceptance_of if', <<-'TXT', file: 'validates_acceptance_of-if'
validates_acceptance_of :${1:terms}${2:${3:, :accept => "${4:1}"}${5:, :message => "${6:You must accept the terms of service}"}}, :if => proc { |obj| ${7:obj.condition?} }}
TXT

  tab 'vc', 'validates_confirmation_of', <<-'TXT', file: 'validates_confirmation_of-(vc)'
validates_confirmation_of :${1:attribute}${2:, :on => :${3:create}, :message => "${4:should match confirmation}"}
TXT

  tab 'vcif', 'validates_confirmation_of if', <<-'TXT', file: 'validates_confirmation_of-if-(vcif)'
validates_confirmation_of :${1:attribute}${2:, :on => :${3:create}, :message => "${4:should match confirmation}", :if => proc { |obj| ${5:obj.condition?} }}
TXT

  tab 've', 'validates_exclusion_of', <<-'TXT', file: 'validates_exclusion_of-(ve)'
validates_exclusion_of :${1:attribute}${2:, :in => ${3:%w( ${4:mov avi} )}, :on => :${5:create}, :message => "${6:extension %s is not allowed}"}
TXT

  tab 'veif', 'validates_exclusion_of if', <<-'TXT', file: 'validates_exclusion_of-if-(veif)'
validates_exclusion_of :${1:attribute}${2:, :in => ${3:%w( ${4:mov avi} )}, :on => :${5:create}, :message => "${6:extension %s is not allowed}"}, :if => proc { |obj| ${7:obj.condition?} }}
TXT

  tab 'verify', 'verify — redirect', <<-'TXT', file: 'verify-redirect-(verify)'
verify :only => [:$1], :session => :user, :params => :id, :redirect_to => {:action => '${2:index}'}

TXT

  tab 'verify', 'verify — render', <<-'TXT', file: 'verify-(verify)'
verify :only => [:$1], :method => :post, :render => {:status => 500, :text => "use HTTP-POST"}

TXT

  tab 'vf', 'validates_format_of', <<-'TXT'
validates_format_of :${1:attribute}, :with => /${2:^[${3:\w\d}]+\$}/${4:, :on => :${5:create}, :message => "${6:is invalid}"}
TXT

  tab 'vfif', 'validates_format_of if', <<-'TXT', file: 'validates_format_of-if'
validates_format_of :${1:attribute}, :with => /${2:^[${3:\w\d}]+\$}/${4:, :on => :${5:create}, :message => "${6:is invalid}"}, :if => proc { |obj| ${7:obj.condition?} }}
TXT

  tab 'vi', 'validates_inclusion_of', <<-'TXT'
validates_inclusion_of :${1:attribute}${2:, :in => ${3:%w( ${4:mov avi} )}, :on => :${5:create}, :message => "${6:extension %s is not included in the list}"}
TXT

  tab 'viif', 'validates_inclusion_of if', <<-'TXT', file: 'validates_inclusion_of-if'
validates_inclusion_of :${1:attribute}${2:, :in => ${3:%w( ${4:mov avi} )}, :on => :${5:create}, :message => "${6:extension %s is not included in the list}"}, :if => proc { |obj| ${7:obj.condition?} }}
TXT

  tab 'vis', 'page.visual_effect (effect, id)', <<-'TXT', scope: 'source.ruby.rails.rjs', file: 'page_visual_effect-(effect-id)'
page.visual_effect :${1:toggle_slide}, ${2:"${3:DOM ID}"}
TXT

  tab 'vl', 'validates_length_of', <<-'TXT', file: 'validates_length_of-(vl)'
validates_length_of :${1:attribute}, :within => ${2:3..20}${3:, :on => :${4:create}, :message => "${5:must be present}"}
TXT

  tab 'vlif', 'validates_length_of if', <<-'TXT', file: 'validates_length_of-if'
validates_length_of :${1:attribute}, :within => ${2:3..20}${3:, :on => :${4:create}, :message => "${5:must be present}"}, :if => proc { |obj| ${6:obj.condition?} }}
TXT

  tab 'vn', 'validates_numericality_of', <<-'TXT'
validates_numericality_of :${1:attribute}${2:, :on => :${3:create}, :message => "${4:is not a number}"}
TXT

  tab 'vnif', 'validates_numericality_of if', <<-'TXT', file: 'validates_numericality_of-if'
validates_numericality_of :${1:attribute}${2:, :on => :${3:create}, :message => "${4:is not a number}"}, :if => proc { |obj| ${5:obj.condition?} }}
TXT

  tab 'vp', 'validates_presence_of', <<-'TXT', file: 'validates_presence_of-(vp)'
validates_presence_of :${1:attribute}${2:, :on => :${3:create}, :message => "${4:can't be blank}"}
TXT

  tab 'vpif', 'validates_presence_of if', <<-'TXT', file: 'validates_presence_of-if-(vpif)-2'
validates_presence_of :${1:attribute}${2:, :on => :${3:create}, :message => "${4:can't be blank}"}, :if => proc { |obj| ${5:obj.condition?} }}
TXT

  tab 'vu', 'validates_uniqueness_of', <<-'TXT', file: 'validates_uniqueness_of-(vu)'
validates_uniqueness_of :${1:attribute}${2:, :on => :${3:create}, :message => "${4:must be unique}"}
TXT

  tab 'vuif', 'validates_uniqueness_of if', <<-'TXT', file: 'validates_uniqueness_of-if-(vuif)'
validates_uniqueness_of :${1:attribute}${2:, :on => :${3:create}, :message => "${4:must be unique}", :if => proc { |obj| ${6:obj.condition?} }}
TXT

  tab 'wants', 'wants.format', <<-'TXT', scope: 'meta.rails.controller', file: 'wants_format'
wants.${1:js|xml|html}${2: { $0 \}}
TXT

  tab 'xdelete', 'xhr delete', <<-'TXT', file: 'xhr-delete'
xhr :delete, :${1:destroy}, :id => ${2:1}$0
TXT

  tab 'xget', 'xhr get', <<-'TXT', file: 'xhr-get'
xhr :get, :${1:show}${2:, :id => ${3:1}}$0
TXT

  tab 'xpost', 'xhr post', <<-'TXT', file: 'xhr-post'
xhr :post, :${1:create}, :${2:object} => { $3 }
TXT

  tab 'xput', 'xhr put', <<-'TXT', file: 'xhr-put'
xhr :put, :${1:update}, :id => ${2:1}, :${3:object} => { $4 }$0
TXT

end