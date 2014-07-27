# encoding: utf-8

language 'Shell Script (Bash)' => 'source.shell' do
  file_types %w(
    sh bash zsh .bashrc .bash_profile .bash_login .profile .bash_logout
    .textmate_init
  )
  first_line_match %r/^#!.*\b(bash|zsh|sh|tcsh)|^#\s*-\*-[^*]*mode:\s*shell-script[^*]*-\*-/
  folding_start_marker %r/\b(if|case)\b|(\{|\b(do)\b)$/
  folding_stop_marker %r/^\s*(\}|(done|fi|esac)\b)/
  key_equivalent "^~S"  # TextMate only
  uuid "DDEEA3ED-6B1C-11D9-8B10-000D93589AF6"  # TextMate only

  include "#comment"
  include "#pipeline"
  include "#list"
  include "#compound-command"
  include "#loop"
  include "#function-definition"
  include "#string"
  include "#variable"
  include "#interpolation"
  include "#heredoc"
  include "#herestring"
  include "#redirection"
  include "#pathname"
  include "#keyword"
  include "#support"

  fragment :"case-clause" do
    rule 'meta.scope.case-clause.shell' do
      from %r/(?=\S)/
      to %r/;;/,
        0 => 'punctuation.terminator.case-clause.shell'
      rule 'meta.scope.case-pattern.shell' do
        from %r/(\(|(?=\S))/
        to %r/\)/
        both 0 => 'punctuation.definition.case-pattern.shell'
        rule 'punctuation.separator.pipe-sign.shell' do
          match %r/\|/
        end
        include "#string"
        include "#variable"
        include "#interpolation"
        include "#pathname"
      end
      rule 'meta.scope.case-clause-body.shell' do
        from %r/(?<=\))/
        to %r/(?=;;)/
        include "$self"
      end
    end
  end

  fragment :comment do
    rule 'comment.line.number-sign.shell' do
      match %r/(?<!\S)(#)(?!\{).*$\n?/,
        1 => 'punctuation.definition.comment.shell'
    end
  end

  fragment :"compound-command" do
    rule 'meta.scope.logical-expression.shell' do
      from %r/(\[{2})/
      to %r/(\]{2})/
      both 1 => 'punctuation.definition.logical-expression.shell'
      include "#logical-expression"
      include "$self"
    end
    rule 'string.other.math.shell' do
      from %r/(\({2})/,
        0 => 'punctuation.definition.string.begin.shell'
      to %r/(\){2})/,
        0 => 'punctuation.definition.string.end.shell'
      include "#math"
    end
    rule 'meta.scope.subshell.shell' do
      from %r/(\()/
      to %r/(\))/
      both 1 => 'punctuation.definition.subshell.shell'
      include "$self"
    end
    rule 'meta.scope.group.shell' do
      from %r/(?<=\s|^)(\{)(?=\s|$)/
      to %r/(?<=^|;)\s*(\})/
      both 1 => 'punctuation.definition.group.shell'
      include "$self"
    end
  end

  fragment :"function-definition" do
    rule 'meta.function.shell' do
      from %r/\b(function)\s+([^\s\\]+)(?:\s*(\(\)))?/,
        1 => 'storage.type.function.shell',
        2 => 'entity.name.function.shell',
        3 => 'punctuation.definition.arguments.shell'
      to %r/;|&|$/,
        0 => 'punctuation.definition.function.shell'
      include "$self"
    end
    rule 'meta.function.shell' do
      from %r/\b([^\s\\=]+)\s*(\(\))/,
        1 => 'entity.name.function.shell',
        2 => 'punctuation.definition.arguments.shell'
      to %r/;|&|$/,
        0 => 'punctuation.definition.function.shell'
      include "$self"
    end
  end

  fragment :heredoc do
    rule 'string.unquoted.heredoc.no-indent.ruby.shell' do
      content_scope "source.ruby.embedded.shell"
      from %r/(<<)-("|'|)(RUBY)\2/,
        1 => 'keyword.operator.heredoc.shell',
        3 => 'keyword.control.heredoc-token.shell'
      to %r/^\t*(RUBY)\b/,
        1 => 'keyword.control.heredoc-token.shell'
      both 0 => 'punctuation.definition.string.shell'
      include "source.ruby"
    end
    rule 'string.unquoted.heredoc.ruby.shell' do
      content_scope "source.ruby.embedded.shell"
      from %r/(<<)("|'|)(RUBY)\2/,
        1 => 'keyword.operator.heredoc.shell',
        3 => 'keyword.control.heredoc-token.shell'
      to %r/^(RUBY)\b/,
        1 => 'keyword.control.heredoc-token.shell'
      both 0 => 'punctuation.definition.string.shell'
      include "source.ruby"
    end
    rule 'string.unquoted.heredoc.no-indent.python.shell' do
      content_scope "source.python.embedded.shell"
      from %r/(<<)-("|'|)(PYTHON)\2/,
        1 => 'keyword.operator.heredoc.shell',
        3 => 'keyword.control.heredoc-token.shell'
      to %r/^\t*(PYTHON)\b/,
        1 => 'keyword.control.heredoc-token.shell'
      both 0 => 'punctuation.definition.string.shell'
      include "source.python"
    end
    rule 'string.unquoted.heredoc.python.shell' do
      content_scope "source.python.embedded.shell"
      from %r/(<<)("|'|)(PYTHON)\2/,
        1 => 'keyword.operator.heredoc.shell',
        3 => 'keyword.control.heredoc-token.shell'
      to %r/^(PYTHON)\b/,
        1 => 'keyword.control.heredoc-token.shell'
      both 0 => 'punctuation.definition.string.shell'
      include "source.python"
    end
    rule 'string.unquoted.heredoc.no-indent.applescript.shell' do
      content_scope "source.applescript.embedded.shell"
      from %r/(<<)-("|'|)(APPLESCRIPT)\2/,
        1 => 'keyword.operator.heredoc.shell',
        3 => 'keyword.control.heredoc-token.shell'
      to %r/^\t*(APPLESCRIPT)\b/,
        1 => 'keyword.control.heredoc-token.shell'
      both 0 => 'punctuation.definition.string.shell'
      include "source.applescript"
    end
    rule 'string.unquoted.heredoc.applescript.shell' do
      content_scope "source.applescript.embedded.shell"
      from %r/(<<)("|'|)(APPLESCRIPT)\2/,
        1 => 'keyword.operator.heredoc.shell',
        3 => 'keyword.control.heredoc-token.shell'
      to %r/^(APPLESCRIPT)\b/,
        1 => 'keyword.control.heredoc-token.shell'
      both 0 => 'punctuation.definition.string.shell'
      include "source.applescript"
    end
    rule 'string.unquoted.heredoc.no-indent.html.shell' do
      content_scope "text.html.embedded.shell"
      from %r/(<<)-("|'|)(HTML)\2/,
        1 => 'keyword.operator.heredoc.shell',
        3 => 'keyword.control.heredoc-token.shell'
      to %r/^\t*(HTML)\b/,
        1 => 'keyword.control.heredoc-token.shell'
      both 0 => 'punctuation.definition.string.shell'
      include "text.html.basic"
    end
    rule 'string.unquoted.heredoc.html.shell' do
      content_scope "text.html.embedded.shell"
      from %r/(<<)("|'|)(HTML)\2/,
        1 => 'keyword.operator.heredoc.shell',
        3 => 'keyword.control.heredoc-token.shell'
      to %r/^(HTML)\b/,
        1 => 'keyword.control.heredoc-token.shell'
      both 0 => 'punctuation.definition.string.shell'
      include "text.html.basic"
    end
    rule 'string.unquoted.heredoc.no-indent.markdown.shell' do
      content_scope "text.html.markdown.embedded.shell"
      from %r/(<<)-("|'|)(MARKDOWN)\2/,
        1 => 'keyword.operator.heredoc.shell',
        3 => 'keyword.control.heredoc-token.shell'
      to %r/^\t*(MARKDOWN)\b/,
        1 => 'keyword.control.heredoc-token.shell'
      both 0 => 'punctuation.definition.string.shell'
      include "text.html.markdown"
    end
    rule 'string.unquoted.heredoc.markdown.shell' do
      content_scope "text.html.markdown.embedded.shell"
      from %r/(<<)("|'|)(MARKDOWN)\2/,
        1 => 'keyword.operator.heredoc.shell',
        3 => 'keyword.control.heredoc-token.shell'
      to %r/^(MARKDOWN)\b/,
        1 => 'keyword.control.heredoc-token.shell'
      both 0 => 'punctuation.definition.string.shell'
      include "text.html.markdown"
    end
    rule 'string.unquoted.heredoc.no-indent.textile.shell' do
      content_scope "text.html.textile.embedded.shell"
      from %r/(<<)-("|'|)(TEXTILE)\2/,
        1 => 'keyword.operator.heredoc.shell',
        3 => 'keyword.control.heredoc-token.shell'
      to %r/^\t*(TEXTILE)\b/,
        1 => 'keyword.control.heredoc-token.shell'
      both 0 => 'punctuation.definition.string.shell'
      include "text.html.textile"
    end
    rule 'string.unquoted.heredoc.textile.shell' do
      content_scope "text.html.textile.embedded.shell"
      from %r/(<<)("|'|)(TEXTILE)\2/,
        1 => 'keyword.operator.heredoc.shell',
        3 => 'keyword.control.heredoc-token.shell'
      to %r/^(TEXTILE)\b/,
        1 => 'keyword.control.heredoc-token.shell'
      both 0 => 'punctuation.definition.string.shell'
      include "text.html.textile"
    end
    rule 'string.unquoted.heredoc.no-indent.shell' do
      from %r/(<<)-("|'|)\\?(\w+)\2/,
        1 => 'keyword.operator.heredoc.shell',
        3 => 'keyword.control.heredoc-token.shell'
      to %r/^\t*(§3)\b/,
        1 => 'keyword.control.heredoc-token.shell'
      both 0 => 'punctuation.definition.string.shell'
    end
    rule 'string.unquoted.heredoc.shell' do
      from %r/(<<)("|'|)\\?(\w+)\2/,
        1 => 'keyword.operator.heredoc.shell',
        3 => 'keyword.control.heredoc-token.shell'
      to %r/^(§3)\b/,
        1 => 'keyword.control.heredoc-token.shell'
      both 0 => 'punctuation.definition.string.shell'
    end
  end

  fragment :herestring do
    rule 'meta.herestring.shell' do
      match %r/(<<<)((')[^']*('))/,
        1 => 'keyword.operator.herestring.shell',
        2 => 'string.quoted.single.herestring.shell',
        3 => 'punctuation.definition.string.begin.shell',
        4 => 'punctuation.definition.string.end.shell'
    end
    rule 'meta.herestring.shell' do
      match %r/(<<<)((")(\\("|\\)|[^"])*("))/,
        1 => 'keyword.operator.herestring.shell',
        2 => 'string.quoted.double.herestring.shell',
        3 => 'punctuation.definition.string.begin.shell',
        6 => 'punctuation.definition.string.end.shell'
    end
    rule 'meta.herestring.shell' do
      match %r/(<<<)(([^\s\\]|\\.)+)/,
        1 => 'keyword.operator.herestring.shell',
        2 => 'string.unquoted.herestring.shell'
    end
  end

  fragment :interpolation do
    rule 'string.other.math.shell' do
      from %r/\$\({2}/,
        0 => 'punctuation.definition.string.begin.shell'
      to %r/\){2}/,
        0 => 'punctuation.definition.string.end.shell'
      include "#math"
    end
    rule 'string.interpolated.backtick.shell' do
      from %r/`/,
        0 => 'punctuation.definition.string.begin.shell'
      to %r/`/,
        0 => 'punctuation.definition.string.end.shell'
      rule 'constant.character.escape.shell' do
        match %r/\\[`\\$]/
      end
      include "$self"
    end
    rule 'string.interpolated.dollar.shell' do
      from %r/\$\(/,
        0 => 'punctuation.definition.string.begin.shell'
      to %r/\)/,
        0 => 'punctuation.definition.string.end.shell'
      include "$self"
    end
  end

  fragment :keyword do
    rule 'keyword.control.shell' do
      match %r/\b(?:if|then|else|elif|fi|for|in|do|done|select|case|continue|esac|while|until|return)\b/
    end
    rule 'storage.modifier.shell' do
      match %r'(?<![-/])\b(?:export|declare|typeset|local|readonly)\b'
    end
  end

  fragment :list do
    rule 'keyword.operator.list.shell' do
      match %r/;|&&|&|\|\|/
    end
  end

  fragment :"logical-expression" do
    rule 'keyword.operator.logical.shell' do
      # do we want a special rule for ( expr )?
      match %r/=[=~]?|!=?|<|>|&&|\|\|/
    end
    rule 'keyword.operator.logical.shell' do
      match %r/(?<!\S)-(nt|ot|ef|eq|ne|l[te]|g[te]|[a-hknoprstuwxzOGLSN])/
    end
  end

  fragment :loop do
    rule 'meta.scope.for-loop.shell' do
      from %r/\b(for)\s+(?=\({2})/
      to %r/\b(done)\b/
      both 1 => 'keyword.control.shell'
      include "$self"
    end
    rule 'meta.scope.for-in-loop.shell' do
      from %r/\b(for)\s+((?:[^\s\\]|\\.)+)\b/,
        1 => 'keyword.control.shell',
        2 => 'variable.other.loop.shell'
      to %r/\b(done)\b/,
        1 => 'keyword.control.shell'
      include "$self"
    end
    rule 'meta.scope.while-loop.shell' do
      from %r/\b(while|until)\b/
      to %r/\b(done)\b/
      both 1 => 'keyword.control.shell'
      include "$self"
    end
    rule 'meta.scope.select-block.shell' do
      from %r/\b(select)\s+((?:[^\s\\]|\\.)+)\b/,
        1 => 'keyword.control.shell',
        2 => 'variable.other.loop.shell'
      to %r/\b(done)\b/,
        1 => 'keyword.control.shell'
      include "$self"
    end
    rule 'meta.scope.case-block.shell' do
      from %r/\b(case)\b/
      to %r/\b(esac)\b/
      both 1 => 'keyword.control.shell'
      rule 'meta.scope.case-body.shell' do
        from %r/\b(?:in)\b/,
          1 => 'keyword.control.shell'
        to %r/(?=\b(?:esac)\b)/
        include "#comment"
        include "#case-clause"
        include "$self"
      end
      include "$self"
    end
    rule 'meta.scope.if-block.shell' do
      from %r/\b(if)\b/
      to %r/\b(fi)\b/
      both 1 => 'keyword.control.shell'
      include "$self"
    end
  end

  fragment :math do
    include "#variable"
    rule 'keyword.operator.arithmetic.shell' do
      match %r'\+{1,2}|-{1,2}|!|~|\*{1,2}|/|%|<[<=]?|>[>=]?|==|!=|^|\|{1,2}|&{1,2}|\?|\:|,|=|[*/%+\-&^|]=|<<=|>>='
    end
    rule 'constant.numeric.hex.shell' do
      match %r/0[xX]\h+/
    end
    rule 'constant.numeric.octal.shell' do
      match %r/0\d+/
    end
    rule 'constant.numeric.other.shell' do
      match %r/\d{1,2}#[0-9a-zA-Z@_]+/
    end
    rule 'constant.numeric.integer.shell' do
      match %r/\d+/
    end
  end

  fragment :pathname do
    rule 'keyword.operator.tilde.shell' do
      match %r/(?<=\s|:|=|^)~/
    end
    rule 'keyword.operator.glob.shell' do
      match %r/\*|\?/
    end
    rule 'meta.structure.extglob.shell' do
      from %r/([?*+@!])(\()/,
        1 => 'keyword.operator.extglob.shell',
        2 => 'punctuation.definition.extglob.shell'
      to %r/(\))/,
        1 => 'punctuation.definition.extglob.shell'
      include "$self"
    end
  end

  fragment :pipeline do
    rule 'keyword.other.shell' do
      match %r/\b(time)\b/
    end
    rule 'keyword.operator.pipe.shell' do
      match %r/[|!]/
    end
  end

  fragment :redirection do
    rule 'string.interpolated.process-substitution.shell' do
      from %r/[><]\(/,
        0 => 'punctuation.definition.string.begin.shell'
      to %r/\)/,
        0 => 'punctuation.definition.string.end.shell'
      include "$self"
    end
    rule 'keyword.operator.redirect.shell' do
      # valid: &>word >&word >word [n]>&[n] [n]<word [n]>word [n]>>word [n]<&word (last one is duplicate)
      match %r/&>|\d*>&\d*|\d*(>>|>|<)|\d*<&|\d*<>/
    end
  end

  fragment :string do
    rule 'constant.character.escape.shell' do
      match %r/\\./
    end
    rule 'string.quoted.single.shell' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.shell'
      to %r/'/,
        0 => 'punctuation.definition.string.end.shell'
    end
    rule 'string.quoted.double.shell' do
      from %r/\$?"/,
        0 => 'punctuation.definition.string.begin.shell'
      to %r/"/,
        0 => 'punctuation.definition.string.end.shell'
      rule 'constant.character.escape.shell' do
        match %r/\\[\$`"\\\n]/
      end
      include "#variable"
      include "#interpolation"
    end
    rule 'string.quoted.single.dollar.shell' do
      from %r/\$'/,
        0 => 'punctuation.definition.string.begin.shell'
      to %r/'/,
        0 => 'punctuation.definition.string.end.shell'
      rule 'constant.character.escape.ansi-c.shell' do
        match %r/\\(a|b|e|f|n|r|t|v|\\|')/
      end
      rule 'constant.character.escape.octal.shell' do
        match %r/\\[0-9]{3}/
      end
      rule 'constant.character.escape.hex.shell' do
        match %r/\\x[0-9a-fA-F]{2}/
      end
      rule 'constant.character.escape.control-char.shell' do
        match %r/\\c./
      end
    end
  end

  fragment :support do
    rule 'support.function.builtin.shell' do
      match %r/(?<=^|\s)(?::|\.)(?=\s|;|&|$)/
    end
    rule 'support.function.builtin.shell' do
      match %r'(?<![-/])\b(?:alias|bg|bind|break|builtin|caller|cd|command|compgen|complete|dirs|disown|echo|enable|eval|exec|exit|false|fc|fg|getopts|hash|help|history|jobs|kill|let|logout|popd|printf|pushd|pwd|read|readonly|set|shift|shopt|source|suspend|test|times|trap|true|type|ulimit|umask|unalias|unset|wait)\b'
    end
  end

  fragment :variable do
    rule 'variable.other.special.shell' do
      match %r/(\$)[-*@#?$!0_]/,
        1 => 'punctuation.definition.variable.shell'
    end
    rule 'variable.other.positional.shell' do
      match %r/(\$)[1-9]/,
        1 => 'punctuation.definition.variable.shell'
    end
    rule 'variable.other.normal.shell' do
      match %r/(\$)[a-zA-Z_][a-zA-Z0-9_]*/,
        1 => 'punctuation.definition.variable.shell'
    end
    rule 'variable.other.bracket.shell' do
      from %r/\$\{/
      to %r/\}/
      both 0 => 'punctuation.definition.variable.shell'
      rule 'keyword.operator.expansion.shell' do
        match %r'!|:[-=?]?|\*|@|\#{1,2}|%{1,2}|/'
      end
      rule do
        match %r/(\[)([^\]]+)(\])/,
          1 => 'punctuation.section.array.shell',
          3 => 'punctuation.section.array.shell'
      end
    end
  end
end
