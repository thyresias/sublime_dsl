# encoding: utf-8

preferences 'Comments' => 'text.html.cfm', file: 'comment' do
  shell_variable 'TM_COMMENT_START', '<!--- '
  shell_variable 'TM_COMMENT_END', ' --->'
  uuid "904C79F1-5730-4D8D-986A-0D71587B2C1F"
end

preferences 'Folding' => 'text.html.cfm' do
  folding_start_marker %r/(?x)
    (<(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl|cfloop|cfif|cfswitch|cfcomponent|cffunction|cfcase|cfdefaultcase|cfsavecontent)\b.*?>
    |<!---(?!.*---\s*>)
    )/
  folding_stop_marker %r'(?x)
    (</(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl|cfloop|cfif|cfswitch|cfcomponent|cffunction|cfcase|cfdefaultcase|cfsavecontent)>
    |^(?!.*?<!---).*?---\s*>
    )'
  uuid "3BDC5085-3BD4-4003-8FEC-C52C5C76E48C"
end

preferences 'Smart Typing Pairs' => 'meta.scope.tag.embedded.cfoutput.cfm - meta.tag.template.cfoutput.cfm, string.quoted.double.cfm' do
  smart_typing_pairs "##"
  uuid "862EDD04-D606-4EDB-8D01-425D8024CF1B"
end
