# encoding: utf-8

language 'HTML (Django)' => 'text.html.django' do
  # FIXME: no file types
  key_equivalent "^~D"  # TextMate only
  uuid "F4B0A70C-ECF6-4660-BC26-785216E3CF02"  # TextMate only

  # Since html is valid in Django templates include the html patterns
  include "text.html.basic"
  rule 'comment.block.django.template' do
    from %r/{% comment %}/
    to %r/{% endcomment %}/
  end
  rule 'comment.line.django.template' do
    from %r/{#/
    to %r/#}/
  end
  rule 'variable.other.django.template' do
    from %r/{{/
    to %r/}}/
  end
  rule 'meta.scope.django.template.tag' do
    from %r/({%)/
    to %r/(%})/
    both 1 => 'entity.other.django.tagbraces'
    rule 'keyword.control.django.template' do
      match %r/\b(autoescape|endautoescape|block|endblock|trans|blocktrans|endblocktrans|plural|debug|extends|filter|firstof|for|endfor|if|include|else|endif|ifchanged|endifchanged|ifequal|endifequal|ifnotequal|endifnotequal|load|now|regroup|ssi|spaceless|templatetag|widthratio)\b/
    end
    rule 'keyword.operator.django.template' do
      match %r/\b(and|or|not|in|by|as)\b/
    end
    rule 'support.function.filter.django' do
      match %r/\|(add|addslashes|capfirst|center|cut|date|default|default_if_none|dictsort|dictsortreversed|divisibleby|escape|filesizeformat|first|fix_ampersands|floatformat|get_digit|join|length|length_is|linebreaks|linebreaksbr|linenumbers|ljust|lower|make_list|phone2numeric|pluralize|pprint|random|removetags|rjust|safe|slice|slugify|stringformat|striptags|time|timesince|title|truncatewords|unordered_list|upper|urlencode|urlize|urlizetrunc|wordcount|wordwrap|yesno)\b/
    end
    rule 'string.other.django.template.tag' do
      from %r/('|")/
      to %r/§1/
    end
    rule 'string.unquoted.django.template.tag' do
      match %r/[a-zA-Z_]+/
    end
  end
end
