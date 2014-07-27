# encoding: utf-8

language 'Perl' => 'source.perl' do
  #
  # TODO:  Include RegExp syntax
  file_types %w(pl pm pod t PL)
  first_line_match %r/^#!.*\bperl\b/
  folding_start_marker %r'(/\*|(\{|\[|\()\s*$)'
  folding_stop_marker %r'(\*/|^\s*(\}|\]|\)))'
  key_equivalent "^~P"  # TextMate only
  uuid "EDBFE125-6B1C-11D9-9189-000D93589AF6"  # TextMate only

  include "#line_comment"
  rule 'comment.block.documentation.perl' do
    from %r/^=/
    to %r/^=cut/
    both 0 => 'punctuation.definition.comment.perl'
  end
  include "#variable"
  rule do
    # string.regexp.compile.perl
    from %r/\b(?=qr\s*[^\s\w])/
    to %r/((([egimosx]*)))(?=(\s+\S|\s*[;\,\#\{\}\)]|$))/,
      1 => 'string.regexp.compile.perl',
      2 => 'punctuation.definition.string.perl',
      3 => 'keyword.control.regexp-option.perl'
    to_last true
    rule 'string.regexp.compile.nested_braces.perl' do
      from %r/(qr)\s*\{/
      to %r/\}/
      both 0 => 'punctuation.definition.string.perl',
           1 => 'support.function.perl'
      include "#escaped_char"
      include "#variable"
      include "#nested_braces_interpolated"
    end
    rule 'string.regexp.compile.nested_brackets.perl' do
      from %r/(qr)\s*\[/
      to %r/\]/
      both 0 => 'punctuation.definition.string.perl',
           1 => 'support.function.perl'
      include "#escaped_char"
      include "#variable"
      include "#nested_brackets_interpolated"
    end
    rule 'string.regexp.compile.nested_ltgt.perl' do
      from %r/(qr)\s*</
      to %r/>/
      both 0 => 'punctuation.definition.string.perl',
           1 => 'support.function.perl'
      include "#escaped_char"
      include "#variable"
      include "#nested_ltgt_interpolated"
    end
    rule 'string.regexp.compile.nested_parens.perl' do
      from %r/(qr)\s*\(/
      to %r/\)/
      both 0 => 'punctuation.definition.string.perl',
           1 => 'support.function.perl'
      include "#escaped_char"
      include "#variable"
      include "#nested_parens_interpolated"
    end
    rule 'string.regexp.compile.single-quote.perl' do
      from %r/(qr)\s*\'/
      to %r/\'/
      both 0 => 'punctuation.definition.string.perl',
           1 => 'support.function.perl'
      include "#escaped_char"
    end
    rule 'string.regexp.compile.simple-delimiter.perl' do
      from %r/(qr)\s*([^\s\w\'\{\[\(\<])/
      to %r/§2/
      both 0 => 'punctuation.definition.string.perl',
           1 => 'support.function.perl'
      rule 'keyword.control.anchor.perl' do
        # This is to prevent thinks like qr/foo$/ to treat $/ as a variable
        match %r/\$(?=[^\s\w\'\{\[\(\<])/
      end
      include "#escaped_char"
      include "#variable"
      include "#nested_parens_interpolated"
    end
  end
  rule do
    # string.regexp.replace.perl
    from %r/\b(?=(?<!\&)(s)(\s+\S|\s*[;\,\#\{\}\(\)\[<]|$))/
    to %r/((([egimosx]*)))(?=(\s+\S|\s*[;\,\#\{\}\)\]>]|$))/,
      1 => 'string.regexp.replace.perl',
      2 => 'punctuation.definition.string.perl',
      3 => 'keyword.control.regexp-option.perl'
    to_last true
    rule 'string.regexp.nested_braces.perl' do
      from %r/(s)\s*\{/
      to %r/\}/
      both 0 => 'punctuation.definition.string.perl',
           1 => 'support.function.perl'
      include "#escaped_char"
      include "#nested_braces"
    end
    rule 'string.regexp.nested_brackets.perl' do
      from %r/(s)\s*\[/
      to %r/\]/
      both 0 => 'punctuation.definition.string.perl',
           1 => 'support.function.perl'
      include "#escaped_char"
      include "#nested_brackets"
    end
    rule 'string.regexp.nested_ltgt.perl' do
      from %r/(s)\s*</
      to %r/>/
      both 0 => 'punctuation.definition.string.perl',
           1 => 'support.function.perl'
      include "#escaped_char"
      include "#nested_ltgt"
    end
    rule 'string.regexp.nested_parens.perl' do
      from %r/(s)\s*\(/
      to %r/\)/
      both 0 => 'punctuation.definition.string.perl',
           1 => 'support.function.perl'
      include "#escaped_char"
      include "#nested_parens"
    end
    rule 'string.regexp.format.nested_braces.perl' do
      from %r/\{/
      to %r/\}/
      both 0 => 'punctuation.definition.string.perl'
      include "#escaped_char"
      include "#variable"
      include "#nested_braces_interpolated"
    end
    rule 'string.regexp.format.nested_brackets.perl' do
      from %r/\[/
      to %r/\]/
      both 0 => 'punctuation.definition.string.perl'
      include "#escaped_char"
      include "#variable"
      include "#nested_brackets_interpolated"
    end
    rule 'string.regexp.format.nested_ltgt.perl' do
      from %r/</
      to %r/>/
      both 0 => 'punctuation.definition.string.perl'
      include "#escaped_char"
      include "#variable"
      include "#nested_ltgt_interpolated"
    end
    rule 'string.regexp.format.nested_parens.perl' do
      from %r/\(/
      to %r/\)/
      both 0 => 'punctuation.definition.string.perl'
      include "#escaped_char"
      include "#variable"
      include "#nested_parens_interpolated"
    end
    rule 'string.regexp.format.single_quote.perl' do
      from %r/'/
      to %r/'/
      both 0 => 'punctuation.definition.string.perl'
      rule 'constant.character.escape.perl' do
        match %r/\\['\\]/
      end
    end
    rule 'string.regexp.format.simple_delimiter.perl' do
      from %r/([^\s\w\[({<;])/
      to %r/§1/
      both 0 => 'punctuation.definition.string.perl'
      include "#escaped_char"
      include "#variable"
    end
    rule do
      match %r/\s+/
    end
  end
  rule do
    # string.regexp.replaceXXX
    from %r/\b(?=s([^\s\w\[({<]).*\1([egimos]*)([\}\)\;\,]|\s+))/
    to %r/((([egimos]*)))(?=([\}\)\;\,]|\s+|$))/,
      1 => 'string.regexp.replace.perl',
      2 => 'punctuation.definition.string.perl',
      3 => 'keyword.control.regexp-option.perl'
    rule 'string.regexp.replaceXXX.simple_delimiter.perl' do
      from %r/(s\s*)([^\s\w\[({<])/
      to %r/(?=§2)/
      both 0 => 'punctuation.definition.string.perl',
           1 => 'support.function.perl'
      include "#escaped_char"
    end
    rule 'string.regexp.replaceXXX.format.single_quote.perl' do
      from %r/'/
      to %r/'/
      both 0 => 'punctuation.definition.string.perl'
      rule 'constant.character.escape.perl.perl' do
        match %r/\\['\\]/
      end
    end
    rule 'string.regexp.replaceXXX.format.simple_delimiter.perl' do
      from %r/([^\s\w\[({<])/
      to %r/§1/
      both 0 => 'punctuation.definition.string.perl'
      include "#escaped_char"
      include "#variable"
    end
  end
  rule do
    # string.regexp.replace.extended
    from %r/\b(?=(?<!\\)s\s*([^\s\w\[({<]))/
    to %r/\2((([egimos]*x[egimos]*)))\b/,
      1 => 'string.regexp.replace.perl',
      2 => 'punctuation.definition.string.perl',
      3 => 'keyword.control.regexp-option.perl'
    rule 'string.regexp.replace.extended.simple_delimiter.perl' do
      from %r/(s)\s*(.)/
      to %r/(?=§2)/
      both 0 => 'punctuation.definition.string.perl',
           1 => 'support.function.perl'
      include "#escaped_char"
    end
    rule 'string.regexp.replace.extended.simple_delimiter.perl' do
      from %r/'/
      to %r/'(?=[egimos]*x[egimos]*)\b/
      both 0 => 'punctuation.definition.string.perl'
      include "#escaped_char"
    end
    rule 'string.regexp.replace.extended.simple_delimiter.perl' do
      from %r/(.)/
      to %r/§1(?=[egimos]*x[egimos]*)\b/
      both 0 => 'punctuation.definition.string.perl'
      include "#escaped_char"
      include "#variable"
    end
  end
  rule 'constant.other.key.perl' do
    match %r/\b\w+\s*(?==>)/
  end
  rule 'constant.other.bareword.perl' do
    match %r/(?<={)\s*\w+\s*(?=})/
  end
  rule 'string.regexp.find.perl' do
    match %r'(?<!\\)((~\s*)?\/)(\S.*?)(?<!\\)(\\{2})*(\/)',
      1 => 'punctuation.definition.string.perl',
      5 => 'punctuation.definition.string.perl'
  end
  rule 'string.regexp.find.extended.perl' do
    from %r'(?<!\\)(\~\s*\/)'
    to %r'\/([cgimos]*x[cgimos]*)\b',
      1 => 'keyword.control.regexp-option.perl'
    both 0 => 'punctuation.definition.string.perl'
    include "#escaped_char"
    include "#variable"
  end
  rule 'meta.class.perl' do
    match %r/^\s*(package)\s+(\S+)\s*((#).*)?$\n?/,
      1 => 'keyword.control.perl',
      2 => 'entity.name.type.class.perl',
      3 => 'comment.line.number-sign.perl',
      4 => 'punctuation.definition.comment.perl'
  end
  rule 'meta.function.perl' do
    match %r/^\s*(sub)\s+([-a-zA-Z0-9_]+)\s*(\([\$\@\*;]*\))?/,
      1 => 'storage.type.sub.perl',
      2 => 'entity.name.function.perl',
      3 => 'storage.type.method.perl'
  end
  rule 'meta.function.perl' do
    match %r/^\s*(BEGIN|END|DESTROY)\b/,
      1 => 'entity.name.function.perl',
      2 => 'punctuation.definition.parameters.perl',
      3 => 'variable.parameter.function.perl'
  end
  rule 'meta.leading-tabs' do
    from %r/^(?=(\t| {4}))/
    to %r/(?=\S)/
    rule do
      match %r/(\t| {4})(\t| {4})?/,
        1 => 'meta.odd-tab',
        2 => 'meta.even-tab'
    end
  end
  rule 'string.regexp.find-m.perl' do
    match %r/\b(m)\s*(?<!\\)([^\[\{\(A-Za-z0-9\s])(.*?)(?<!\\)(\\{2})*(\2)/,
      1 => 'support.function.perl',
      2 => 'punctuation.definition.string.perl',
      5 => 'punctuation.definition.string.perl'
  end
  rule 'string.regexp.find-m-paren.perl' do
    from %r/\b(m)\s*(?<!\\)\(/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/\)/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#nested_parens_interpolated"
    include "#variable"
  end
  rule 'string.regexp.find-m-brace.perl' do
    from %r/\b(m)\s*(?<!\\)\{/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/\}/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#nested_braces_interpolated"
    include "#variable"
  end
  rule 'string.regexp.find-m-bracket.perl' do
    from %r/\b(m)\s*(?<!\\)\[/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/\]/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#nested_brackets_interpolated"
    include "#variable"
  end
  rule 'string.regexp.find-m-ltgt.perl' do
    from %r/\b(m)\s*(?<!\\)\</,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/\>/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#nested_ltgt_interpolated"
    include "#variable"
  end
  rule 'string.regexp.replace.perl' do
    match %r/\b(s|tr|y)\s*([^A-Za-z0-9\s])(.*?)(?<!\\)(\\{2})*(\2)(.*?)(?<!\\)(\\{2})*(\2)/,
      1 => 'support.function.perl',
      2 => 'punctuation.definition.string.perl',
      5 => 'punctuation.definition.string.perl',
      8 => 'punctuation.definition.string.perl'
  end
  rule 'constant.language.perl' do
    match %r/\b(__FILE__|__LINE__|__PACKAGE__)\b/
  end
  rule 'keyword.control.perl' do
    match %r/(?<!->)\b(continue|die|do|else|elsif|exit|for|foreach|goto|if|last|next|redo|return|select|unless|until|wait|while|switch|case|package|require|use|eval)\b/
  end
  rule 'storage.modifier.perl' do
    match %r/\b(my|our|local)\b/
  end
  rule 'keyword.operator.filetest.perl' do
    match %r/(?<!\w)\-[rwx0RWXOezsfdlpSbctugkTBMAC]\b/
  end
  rule 'keyword.operator.logical.perl' do
    match %r/\b(and|or|xor|as)\b/
  end
  rule 'keyword.operator.comparison.perl' do
    match %r/(<=>| =>|->)/
  end
  rule do
    content_scope "text.html.embedded.perl"
    from %r/((<<) *"HTML").*\n?/
    to %r/(^HTML$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.doublequote.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "#escaped_char"
    include "#variable"
    include "text.html.basic"
  end
  rule do
    content_scope "text.xml.embedded.perl"
    from %r/((<<) *"XML").*\n?/
    to %r/(^XML$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.doublequote.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "#escaped_char"
    include "#variable"
    include "text.xml"
  end
  rule do
    content_scope "text.css.embedded.perl"
    from %r/((<<) *"CSS").*\n?/
    to %r/(^CSS$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.doublequote.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "#escaped_char"
    include "#variable"
    include "source.css"
  end
  rule do
    content_scope "text.js.embedded.perl"
    from %r/((<<) *"JAVASCRIPT").*\n?/
    to %r/(^JAVASCRIPT$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.doublequote.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "#escaped_char"
    include "#variable"
    include "source.js"
  end
  rule do
    content_scope "source.sql.embedded.perl"
    from %r/((<<) *"SQL").*\n?/
    to %r/(^SQL$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.doublequote.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "#escaped_char"
    include "#variable"
    include "source.sql"
  end
  rule do
    content_scope "text.postscript.embedded.perl"
    from %r/((<<) *"POSTSCRIPT").*\n?/
    to %r/(^POSTSCRIPT$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.doublequote.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "#escaped_char"
    include "#variable"
    include "source.postscript"
  end
  rule do
    content_scope "string.unquoted.heredoc.doublequote.perl"
    from %r/((<<) *"([^"]*)").*\n?/
    to %r/(^§3$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.doublequote.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "#escaped_char"
    include "#variable"
  end
  rule do
    content_scope "text.html.embedded.perl"
    from %r/((<<) *'HTML').*\n?/
    to %r/(^HTML$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.quote.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "text.html.basic"
  end
  rule do
    content_scope "text.xml.embedded.perl"
    from %r/((<<) *'XML').*\n?/
    to %r/(^XML$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.quote.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "text.xml"
  end
  rule do
    content_scope "text.css.embedded.perl"
    from %r/((<<) *'CSS').*\n?/
    to %r/(^CSS$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.quote.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "source.css"
  end
  rule do
    content_scope "text.js.embedded.perl"
    from %r/((<<) *'JAVASCRIPT').*\n?/
    to %r/(^JAVASCRIPT$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.quote.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "source.js"
  end
  rule do
    content_scope "source.sql.embedded.perl"
    from %r/((<<) *'SQL').*\n?/
    to %r/(^SQL$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.quote.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "source.sql"
  end
  rule do
    content_scope "source.postscript.embedded.perl"
    from %r/((<<) *'POSTSCRIPT').*\n?/
    to %r/(^POSTSCRIPT)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.quote.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "source.postscript"
  end
  rule do
    content_scope "string.unquoted.heredoc.quote.perl"
    from %r/((<<) *'([^']*)').*\n?/
    to %r/(^§3$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.quote.perl',
         2 => 'punctuation.definition.heredoc.perl'
  end
  rule do
    content_scope "string.unquoted.heredoc.backtick.perl"
    from %r/((<<) *`([^`]*)`).*\n?/
    to %r/(^§3$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.backtick.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "#escaped_char"
    include "#variable"
  end
  rule do
    content_scope "text.html.embedded.perl"
    from %r/((<<) *HTML\b).*\n?/
    to %r/(^HTML$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "#escaped_char"
    include "#variable"
    include "text.html.basic"
  end
  rule do
    content_scope "text.xml.embedded.perl"
    from %r/((<<) *XML\b).*\n?/
    to %r/(^XML$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "#escaped_char"
    include "#variable"
    include "text.xml"
  end
  rule do
    content_scope "source.sql.embedded.perl"
    from %r/((<<) *SQL\b).*\n?/
    to %r/(^SQL$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "#escaped_char"
    include "#variable"
    include "source.sql"
  end
  rule do
    content_scope "source.postscript.embedded.perl"
    from %r/((<<) *POSTSCRIPT\b).*\n?/
    to %r/(^POSTSCRIPT)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "#escaped_char"
    include "#variable"
    include "source.postscript"
  end
  rule do
    content_scope "string.unquoted.heredoc.perl"
    from %r/((<<) *((?![=\d\$ ])[^;,'"`\s)]*)).*\n?/
    to %r/(^§3$)/
    both 0 => 'punctuation.definition.string.perl',
         1 => 'string.unquoted.heredoc.perl',
         2 => 'punctuation.definition.heredoc.perl'
    include "#escaped_char"
    include "#variable"
  end
  rule 'string.quoted.other.qq.perl' do
    from %r/\bqq\s*([^\(\{\[\<\w\s])/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/§1/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#variable"
  end
  rule 'string.interpolated.qx.perl' do
    from %r/\bqx\s*([^'\(\{\[\<\w\s])/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/§1/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#variable"
  end
  rule 'string.interpolated.qx.single-quote.perl' do
    from %r/\bqx\s*'/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/'/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
  end
  rule 'string.quoted.double.perl' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/"/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#variable"
  end
  rule 'string.quoted.other.q.perl' do
    from %r/\bqw?\s*([^\(\{\[\<\w\s])/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/§1/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
  end
  rule 'string.quoted.single.perl' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/'/,
      0 => 'punctuation.definition.string.end.perl'
    rule 'constant.character.escape.perl' do
      match %r/\\['\\]/
    end
  end
  rule 'string.interpolated.perl' do
    from %r/`/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/`/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#variable"
  end
  rule 'string.quoted.other.qq-paren.perl' do
    from %r/\bqq\s*\(/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/\)/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#nested_parens_interpolated"
    include "#variable"
  end
  rule 'string.quoted.other.qq-brace.perl' do
    from %r/\bqq\s*\{/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/\}/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#nested_braces_interpolated"
    include "#variable"
  end
  rule 'string.quoted.other.qq-bracket.perl' do
    from %r/\bqq\s*\[/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/\]/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#nested_brackets_interpolated"
    include "#variable"
  end
  rule 'string.quoted.other.qq-ltgt.perl' do
    from %r/\bqq\s*\</,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/\>/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#nested_ltgt_interpolated"
    include "#variable"
  end
  rule 'string.interpolated.qx-paren.perl' do
    from %r/\bqx\s*\(/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/\)/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#nested_parens_interpolated"
    include "#variable"
  end
  rule 'string.interpolated.qx-brace.perl' do
    from %r/\bqx\s*\{/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/\}/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#nested_braces_interpolated"
    include "#variable"
  end
  rule 'string.interpolated.qx-bracket.perl' do
    from %r/\bqx\s*\[/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/\]/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#nested_brackets_interpolated"
    include "#variable"
  end
  rule 'string.interpolated.qx-ltgt.perl' do
    from %r/\bqx\s*\</,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/\>/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#nested_ltgt_interpolated"
    include "#variable"
  end
  rule 'string.quoted.other.q-paren.perl' do
    from %r/\bqw?\s*\(/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/\)/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#nested_parens"
  end
  rule 'string.quoted.other.q-brace.perl' do
    from %r/\bqw?\s*\{/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/\}/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#nested_braces"
  end
  rule 'string.quoted.other.q-bracket.perl' do
    from %r/\bqw?\s*\[/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/\]/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#nested_brackets"
  end
  rule 'string.quoted.other.q-ltgt.perl' do
    from %r/\bqw?\s*\</,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/\>/,
      0 => 'punctuation.definition.string.end.perl'
    include "#escaped_char"
    include "#nested_ltgt"
  end
  rule 'string.unquoted.program-block.perl' do
    from %r/^__\w+__/,
      0 => 'punctuation.definition.string.begin.perl'
    to %r/$/,
      0 => 'punctuation.definition.string.end.perl'
  end
  rule 'meta.format.perl' do
    from %r/\b(format)\s+([A-Za-z]+)\s*=/,
      1 => 'support.function.perl',
      2 => 'entity.name.function.format.perl'
    to %r/^\.\s*$/
    include "#line_comment"
    include "#variable"
  end
  rule 'support.function.perl' do
    match %r/\b(ARGV|DATA|ENV|SIG|STDERR|STDIN|STDOUT|atan2|bind|binmode|bless|caller|chdir|chmod|chomp|chop|chown|chr|chroot|close|closedir|cmp|connect|cos|crypt|dbmclose|dbmopen|defined|delete|dump|each|endgrent|endhostent|endnetent|endprotoent|endpwent|endservent|eof|eq|eval|exec|exists|exp|fcntl|fileno|flock|fork|format|formline|ge|getc|getgrent|getgrgid|getgrnam|gethostbyaddr|gethostbyname|gethostent|getlogin|getnetbyaddr|getnetbyname|getnetent|getpeername|getpgrp|getppid|getpriority|getprotobyname|getprotobynumber|getprotoent|getpwent|getpwnam|getpwuid|getservbyname|getservbyport|getservent|getsockname|getsockopt|glob|gmtime|grep|gt|hex|import|index|int|ioctl|join|keys|kill|lc|lcfirst|le|length|link|listen|local|localtime|log|lstat|lt|m|map|mkdir|msgctl|msgget|msgrcv|msgsnd|ne|no|oct|open|opendir|ord|pack|pipe|pop|pos|print|printf|push|q|qq|quotemeta|qw|qx|rand|read|readdir|readlink|recv|ref|rename|reset|reverse|rewinddir|rindex|rmdir|s|scalar|seek|seekdir|semctl|semget|semop|send|setgrent|sethostent|setnetent|setpgrp|setpriority|setprotoent|setpwent|setservent|setsockopt|shift|shmctl|shmget|shmread|shmwrite|shutdown|sin|sleep|socket|socketpair|sort|splice|split|sprintf|sqrt|srand|stat|study|substr|symlink|syscall|sysopen|sysread|system|syswrite|tell|telldir|tie|tied|time|times|tr|truncate|uc|ucfirst|umask|undef|unlink|unpack|unshift|untie|utime|values|vec|waitpid|wantarray|warn|write|y|q|qw|qq|qx)\b/
  end

  fragment :escaped_char do
    rule 'constant.character.escape.perl' do
      match %r/\\./
    end
  end

  fragment :line_comment do
    rule 'meta.comment.full-line.perl' do
      match %r/^((#).*$\n?)/,
        1 => 'comment.line.number-sign.perl',
        2 => 'punctuation.definition.comment.perl'
    end
    rule 'comment.line.number-sign.perl' do
      match %r/(#).*$\n?/,
        1 => 'punctuation.definition.comment.perl'
    end
  end

  fragment :nested_braces do
    rule do
      from %r/\{/
      to %r/\}/
      both 1 => 'punctuation.section.scope.perl'
      include "#escaped_char"
      include "#nested_braces"
    end
  end

  fragment :nested_braces_interpolated do
    rule do
      from %r/\{/
      to %r/\}/
      both 1 => 'punctuation.section.scope.perl'
      include "#escaped_char"
      include "#variable"
      include "#nested_braces_interpolated"
    end
  end

  fragment :nested_brackets do
    rule do
      from %r/\[/
      to %r/\]/
      both 1 => 'punctuation.section.scope.perl'
      include "#escaped_char"
      include "#nested_brackets"
    end
  end

  fragment :nested_brackets_interpolated do
    rule do
      from %r/\[/
      to %r/\]/
      both 1 => 'punctuation.section.scope.perl'
      include "#escaped_char"
      include "#variable"
      include "#nested_brackets_interpolated"
    end
  end

  fragment :nested_ltgt do
    rule do
      from %r/</
      to %r/>/
      both 1 => 'punctuation.section.scope.perl'
      include "#nested_ltgt"
    end
  end

  fragment :nested_ltgt_interpolated do
    rule do
      from %r/</
      to %r/>/
      both 1 => 'punctuation.section.scope.perl'
      include "#variable"
      include "#nested_ltgt_interpolated"
    end
  end

  fragment :nested_parens do
    rule do
      from %r/\(/
      to %r/\)/
      both 1 => 'punctuation.section.scope.perl'
      include "#escaped_char"
      include "#nested_parens"
    end
  end

  fragment :nested_parens_interpolated do
    rule do
      from %r/\(/
      to %r/\)/
      both 1 => 'punctuation.section.scope.perl'
      rule 'keyword.control.anchor.perl' do
        # This is to prevent thinks like qr/foo$/ to treat $/ as a variable
        match %r/\$(?=[^\s\w\'\{\[\(\<])/
      end
      include "#escaped_char"
      include "#variable"
      include "#nested_parens_interpolated"
    end
  end

  fragment :variable do
    rule 'variable.other.regexp.match.perl' do
      match %r/(\$)&(?![A-Za-z0-9_])/,
        1 => 'punctuation.definition.variable.perl'
    end
    rule 'variable.other.regexp.pre-match.perl' do
      match %r/(\$)`(?![A-Za-z0-9_])/,
        1 => 'punctuation.definition.variable.perl'
    end
    rule 'variable.other.regexp.post-match.perl' do
      match %r/(\$)'(?![A-Za-z0-9_])/,
        1 => 'punctuation.definition.variable.perl'
    end
    rule 'variable.other.regexp.last-paren-match.perl' do
      match %r/(\$)\+(?![A-Za-z0-9_])/,
        1 => 'punctuation.definition.variable.perl'
    end
    rule 'variable.other.readwrite.list-separator.perl' do
      match %r/(\$)"(?![A-Za-z0-9_])/,
        1 => 'punctuation.definition.variable.perl'
    end
    rule 'variable.other.predefined.program-name.perl' do
      match %r/(\$)0(?![A-Za-z0-9_])/,
        1 => 'punctuation.definition.variable.perl'
    end
    rule 'variable.other.predefined.perl' do
      match %r'(\$)[_ab\*\.\/\|,\\;#%=\-~^:?!\$<>\(\)\[\]@](?![A-Za-z0-9_])',
        1 => 'punctuation.definition.variable.perl'
    end
    rule 'variable.other.subpattern.perl' do
      match %r/(\$)[0-9]+(?![A-Za-z0-9_])/,
        1 => 'punctuation.definition.variable.perl'
    end
    rule 'variable.other.readwrite.global.perl' do
      match %r/([\$\@\%](#)?)([[:alpha:]\$]|::)([[:alnum:]\$]|::)*\b/,
        1 => 'punctuation.definition.variable.perl'
    end
    rule 'variable.other.readwrite.global.perl' do
      match %r/(\$\{)(?:[[:alpha:]\$]|::)(?:[[:alnum:]\$]|::)*(\})/,
        1 => 'punctuation.definition.variable.perl',
        2 => 'punctuation.definition.variable.perl'
    end
    rule 'variable.other.readwrite.global.special.perl' do
      match %r/([\$\@\%](#)?)[0-9_]\b/,
        1 => 'punctuation.definition.variable.perl'
    end
  end
end
