# encoding: utf-8

language 'LaTeX' => 'text.tex.latex' do
  file_types %w(tex)
  first_line_match %r/^\\documentclass(?!.*\{beamer\})/
  key_equivalent "^~L"  # TextMate only
  uuid "3BEEA00C-6B1D-11D9-B8AD-000D93589AF6"  # TextMate only

  rule 'meta.space-after-command.latex' do
    match %r/(?=\s)(?<=\\[\w@]|\\[\w@]{2}|\\[\w@]{3}|\\[\w@]{4}|\\[\w@]{5}|\\[\w@]{6})\s/
  end
  rule 'meta.preamble.latex' do
    content_scope "support.class.latex"
    from %r/((\\)(?:usepackage|documentclass))(?:(\[)([^\]]*)(\]))?(\{)/,
      1 => 'keyword.control.preamble.latex',
      2 => 'punctuation.definition.function.latex',
      3 => 'punctuation.definition.arguments.begin.latex',
      4 => 'variable.parameter.latex',
      5 => 'punctuation.definition.arguments.end.latex',
      6 => 'punctuation.definition.arguments.begin.latex'
    to %r/\}/,
      0 => 'punctuation.definition.arguments.end.latex'
    include "$self"
  end
  rule 'meta.include.latex' do
    content_scope "support.class.latex"
    from %r/((\\)(?:include|input))(\{)/,
      1 => 'keyword.control.include.latex',
      2 => 'punctuation.definition.function.latex',
      3 => 'punctuation.definition.arguments.begin.latex'
    to %r/\}/,
      0 => 'punctuation.definition.arguments.end.latex'
    include "$self"
  end
  rule 'meta.function.section.$3.latex' do
    # this works OK with all kinds of crazy stuff as long as section is one line
    content_scope "entity.name.section.latex"
    from %r/(?x)
        (                          # Capture 1
          (\\)                      # Marker
          (
            (?:sub){0,2}section              # Functions
            | (?:sub)?paragraph
            | chapter|part|addpart
            | addchap|addsec|minisec
          )
          (?:\*)?                      # Optional Unnumbered
        )
        (?:
          (\[)([^\[]*?)(\])                # Optional Title
        )??
        (\{)                        # Opening Bracket
        /,
      1 => 'support.function.section.latex',
      2 => 'punctuation.definition.function.latex',
      4 => 'punctuation.definition.arguments.optional.begin.latex',
      5 => 'entity.name.section.latex',
      6 => 'punctuation.definition.arguments.optional.end.latex',
      7 => 'punctuation.definition.arguments.begin.latex'
    to %r/\}/,
      0 => 'punctuation.definition.arguments.end.latex'
    include "$self"
  end
  rule do
    from %r/(^\s*)?(?=\\begin\{lstlisting\})/,
      0 => 'punctuation.whitespace.embedded.leading.latex'
    to %r/(?!\G)(\s*$\n?)?/,
      0 => 'punctuation.whitespace.embedded.trailing.latex'
    rule 'meta.embedded.block.java' do
      content_scope "meta.function.embedded.latex"
      from %r/(((\\)begin)(\{)(lstlisting)(\})(?:(\[).*(\]))?(\s*%\s*(?i:Java)\n?))/
      to %r/(((\\)end)(\{)(lstlisting)(\}))/
      both 1 => 'meta.function.embedded.latex',
           2 => 'support.function.be.latex',
           3 => 'punctuation.definition.function.latex',
           4 => 'punctuation.definition.arguments.begin.latex',
           5 => 'variable.parameter.function.latex',
           6 => 'punctuation.definition.arguments.end.latex',
           7 => 'punctuation.definition.arguments.optional.begin.latex',
           8 => 'punctuation.definition.arguments.optional.end.latex',
           9 => 'comment.line.percentage.latex'
      rule 'source.java' do
        from %r/^(?!\\end\{lstlisting\})/
        to %r/(?=\\end\{lstlisting\})/
        include "source.java"
      end
    end
    rule 'meta.embedded.block.python' do
      content_scope "meta.function.embedded.latex"
      from %r/(((\\)begin)(\{)(lstlisting)(\})(?:(\[).*(\]))?(\s*%\s*(?i:Python)\n?))/
      to %r/(((\\)end)(\{)(lstlisting)(\}))/
      both 1 => 'meta.function.embedded.latex',
           2 => 'support.function.be.latex',
           3 => 'punctuation.definition.function.latex',
           4 => 'punctuation.definition.arguments.begin.latex',
           5 => 'variable.parameter.function.latex',
           6 => 'punctuation.definition.arguments.end.latex',
           7 => 'punctuation.definition.arguments.optional.begin.latex',
           8 => 'punctuation.definition.arguments.optional.end.latex',
           9 => 'comment.line.percentage.latex'
      rule 'source.python' do
        from %r/^(?!\\end\{lstlisting\})/
        to %r/(?=\\end\{lstlisting\})/
        include "source.python"
      end
    end
    rule 'meta.embedded.block.generic' do
      content_scope "meta.function.embedded.latex"
      from %r/((\\)begin)(\{)(lstlisting)(\})(?:(\[).*(\]))?(\s*%.*\n?)?/
      to %r/(((\\)end)(\{)(lstlisting)(\}))/
      both 1 => 'meta.function.embedded.latex',
           2 => 'support.function.be.latex',
           3 => 'punctuation.definition.function.latex',
           4 => 'punctuation.definition.arguments.begin.latex',
           5 => 'variable.parameter.function.latex',
           6 => 'punctuation.definition.arguments.end.latex',
           7 => 'punctuation.definition.arguments.optional.begin.latex',
           8 => 'punctuation.definition.arguments.optional.end.latex',
           9 => 'comment.line.percentage.latex'
    end
  end
  rule 'meta.function.verbatim.latex' do
    content_scope "markup.raw.verbatim.latex"
    from %r/(?:\s*)((\\)begin)(\{)((?:V|v)erbatim|alltt)(\})/
    to %r/((\\)end)(\{)(\4)(\})/
    both 1 => 'support.function.be.latex',
         2 => 'punctuation.definition.function.latex',
         3 => 'punctuation.definition.arguments.begin.latex',
         4 => 'variable.parameter.function.latex',
         5 => 'punctuation.definition.arguments.end.latex'
  end
  rule 'meta.function.link.url.latex' do
    match %r/(?:\s*)((\\)(?:url|href))(\{)([^}]*)(\})/,
      1 => 'support.function.url.latex',
      2 => 'punctuation.definition.function.latex',
      3 => 'punctuation.definition.arguments.begin.latex',
      4 => 'markup.underline.link.latex',
      5 => 'punctuation.definition.arguments.end.latex'
  end
  rule 'meta.function.begin-document.latex' do
    # These two patterns match the \begin{document} and \end{document} commands, so that the environment matching pattern following them will ignore those commands.
    match %r/(?:\s*)((\\)begin)(\{)(document)(\})/,
      1 => 'support.function.be.latex',
      2 => 'punctuation.definition.function.latex',
      3 => 'punctuation.definition.arguments.begin.latex',
      4 => 'variable.parameter.function.latex',
      5 => 'punctuation.definition.arguments.end.latex'
  end
  rule 'meta.function.end-document.latex' do
    match %r/(?:\s*)((\\)end)(\{)(document)(\})/,
      1 => 'support.function.be.latex',
      2 => 'punctuation.definition.function.latex',
      3 => 'punctuation.definition.arguments.begin.latex',
      4 => 'variable.parameter.function.latex',
      5 => 'punctuation.definition.arguments.end.latex'
  end
  rule 'meta.function.environment.math.latex' do
    content_scope "string.other.math.block.environment.latex"
    from %r/(?x)
          (?:\s*)                    # Optional whitespace
          ((\\)begin)                  # Marker - Function
          (\{)                    # Open Bracket
            (
              (?:
                align|equation|eqnarray      # Argument
                | multline|aligned|alignat
                | split|gather|gathered
              )
              (?:\*)?                # Optional Unnumbered
            )
          (\})                    # Close Bracket
          (\s*\n)?        # Match to end of line absent of content
        /
    to %r/(?x)
          (?:\s*)                    # Optional whitespace
          ((\\)end)                  # Marker - Function
          (\{)                    # Open Bracket
            (\4)        # Previous capture from begin
          (\})                    # Close Bracket
          (?:\s*\n)?        # Match to end of line absent of content
        /
    both 1 => 'support.function.be.latex',
         2 => 'punctuation.definition.function.latex',
         3 => 'punctuation.definition.arguments.begin.latex',
         4 => 'variable.parameter.function.latex',
         5 => 'punctuation.definition.arguments.end.latex'
    include "$base"
  end
  rule 'meta.function.environment.tabular.latex' do
    content_scope "meta.data.environment.tabular.latex"
    from %r/(?x)
          (?:\s*)                    # Optional whitespace
          ((\\)begin)                  # Marker - Function
          (\{)                    # Open Bracket
            (array|tabular[xy*]?)
          (\})                    # Close Bracket
          (\s*\n)?        # Match to end of line absent of content
        /
    to %r/(?x)
          (?:\s*)                    # Optional whitespace
          ((\\)end)                  # Marker - Function
          (\{)                    # Open Bracket
            (\4)        # Previous capture from begin
          (\})                    # Close Bracket
          (?:\s*\n)?        # Match to end of line absent of content
        /
    both 1 => 'support.function.be.latex',
         2 => 'punctuation.definition.function.latex',
         3 => 'punctuation.definition.arguments.begin.latex',
         4 => 'variable.parameter.function.latex',
         5 => 'punctuation.definition.arguments.end.latex'
    rule 'punctuation.definition.table.row.latex' do
      match %r/\\\\/
    end
    rule 'meta.row.environment.tabular.latex' do
      from %r/(?:^|(?<=\\\\))(?!\\\\|\s*\\end\{(?:tabular|array))/
      to %r/(?=\\\\|\s*\\end\{(?:tabular|array))/
      rule 'punctuation.definition.table.cell.latex' do
        match %r/&/
      end
      rule 'meta.cell.environment.tabular.latex' do
        from %r/(?:^|(?<=&))((?!&|\\\\|$))/
        to %r/(?=&|\\\\|\s*\\end\{(?:tabular|array))/
        include "$base"
      end
      include "$base"
    end
    include "$base"
  end
  rule 'meta.function.environment.list.latex' do
    from %r/(?:\s*)((\\)begin)(\{)(itemize|enumerate|description|list)(\})/
    to %r/((\\)end)(\{)(\4)(\})(?:\s*\n)?/
    both 1 => 'support.function.be.latex',
         2 => 'punctuation.definition.function.latex',
         3 => 'punctuation.definition.arguments.latex',
         4 => 'variable.parameter.function.latex',
         5 => 'punctuation.definition.arguments.latex'
    include "$base"
  end
  rule 'meta.function.environment.latex.tikz' do
    from %r/(?:\s*)((\\)begin)(\{)(tikzpicture)(\})/
    to %r/((\\)end)(\{)(tikzpicture)(\})(?:\s*\n)?/
    both 1 => 'support.function.be.latex',
         2 => 'punctuation.definition.function.latex',
         3 => 'punctuation.definition.arguments.latex',
         4 => 'variable.parameter.function.latex',
         5 => 'punctuation.definition.arguments.latex'
    include "text.tex.latex.tikz"
    include "text.tex.latex"
  end
  rule 'meta.function.environment.general.latex' do
    from %r/(?:\s*)((\\)begin)(\{)(\w+[*]?)(\})/
    to %r/((\\)end)(\{)(\4)(\})(?:\s*\n)?/
    both 1 => 'support.function.be.latex',
         2 => 'punctuation.definition.function.latex',
         3 => 'punctuation.definition.arguments.latex',
         4 => 'variable.parameter.function.latex',
         5 => 'punctuation.definition.arguments.latex'
    include "$base"
  end
  rule 'storage.type.function.latex' do
    match %r/(\\)(newcommand|renewcommand)\b/,
      1 => 'punctuation.definition.function.latex'
  end
  rule do
    content_scope "meta.paragraph.margin.latex"
    from %r/((\\)marginpar)(\{)/,
      1 => 'support.function.marginpar.latex',
      2 => 'punctuation.definition.function.latex',
      3 => 'punctuation.definition.marginpar.begin.latex'
    to %r/\}/,
      0 => 'punctuation.definition.marginpar.end.latex'
    include "$base"
  end
  rule do
    content_scope "meta.footnote.latex"
    from %r/((\\)footnote)((?:\[[^\[]*?\])*)(\{)/,
      1 => 'support.function.footnote.latex',
      2 => 'punctuation.definition.function.latex',
      4 => 'punctuation.definition.footnote.begin.latex'
    to %r/\}/,
      0 => 'punctuation.definition.footnote.end.latex'
    include "$base"
  end
  rule 'meta.function.emph.latex' do
    content_scope "markup.italic.emph.latex"
    from %r/((\\)emph)(\{)/,
      1 => 'support.function.emph.latex',
      2 => 'punctuation.definition.function.latex',
      3 => 'punctuation.definition.emph.begin.latex'
    to %r/\}/,
      0 => 'punctuation.definition.emph.end.latex'
    include "$base"
  end
  rule 'meta.function.textit.latex' do
    # We put the keyword in a capture and name this capture, so that disabling spell checking for “keyword” won't be inherited by the argument to \textit{...}.
    #
    # Put specific matches for particular LaTeX keyword.functions before the last two more general functions
    content_scope "markup.italic.textit.latex"
    from %r/((\\)textit)(\{)/
    to %r/\}/,
      0 => 'punctuation.definition.textit.end.latex'
    both 1 => 'support.function.textit.latex',
         2 => 'punctuation.definition.function.latex',
         3 => 'punctuation.definition.textit.begin.latex'
    include "$base"
  end
  rule 'meta.function.textbf.latex' do
    content_scope "markup.bold.textbf.latex"
    from %r/((\\)textbf)(\{)/
    to %r/\}/,
      0 => 'punctuation.definition.textbf.end.latex'
    both 1 => 'support.function.textbf.latex',
         2 => 'punctuation.definition.function.latex',
         3 => 'punctuation.definition.textbf.begin.latex'
    include "$base"
  end
  rule 'meta.function.texttt.latex' do
    content_scope "markup.raw.texttt.latex"
    from %r/((\\)texttt)(\{)/
    to %r/\}/,
      0 => 'punctuation.definition.texttt.end.latex'
    both 1 => 'support.function.texttt.latex',
         2 => 'punctuation.definition.function.latex',
         3 => 'punctuation.definition.texttt.begin.latex'
    include "$base"
  end
  rule 'meta.scope.item.latex' do
    match %r/(\\)item\b/,
      0 => 'keyword.other.item.latex',
      1 => 'punctuation.definition.keyword.latex'
  end
  rule 'meta.citation.latex' do
    from %r/(?x)
          (
            (\\)                    # Marker
            (?:auto)?(?:foot)?(?:full)?(?:no)?(?:short)?    # Function Name
            [cC]ite
            (?:al)?(?:t|p|author|year(?:par)?|title)?[ANP]*
            \*?                      # Optional Unabreviated
          )
          (?:(\[)[^\]]*(\]))?                # Optional
          (?:(\[)[^\]]*(\]))?                #   Arguments
          (\{)                      # Opening Bracket
        /
    to %r/\}/,
      0 => 'punctuation.definition.arguments.latex'
    both 1 => 'keyword.control.cite.latex',
         2 => 'punctuation.definition.keyword.latex',
         3 => 'punctuation.definition.arguments.optional.begin.latex',
         4 => 'punctuation.definition.arguments.optional.end.latex',
         5 => 'punctuation.definition.arguments.optional.begin.latex',
         6 => 'punctuation.definition.arguments.optional.end.latex',
         7 => 'punctuation.definition.arguments.latex'
    rule 'constant.other.reference.citation.latex' do
      match %r/[\w:.]+/
    end
  end
  rule 'meta.reference.label.latex' do
    from %r/((\\)(?:\w*[r|R]ef\*?))(\{)/,
      1 => 'keyword.control.ref.latex',
      2 => 'punctuation.definition.keyword.latex',
      3 => 'punctuation.definition.arguments.begin.latex'
    to %r/\}/,
      0 => 'punctuation.definition.arguments.begin.latex'
    rule 'constant.other.reference.label.latex' do
      match %r'[a-zA-Z0-9\.,:/*!^_-]'
    end
  end
  rule 'meta.definition.label.latex' do
    from %r/((\\)label)(\{)/,
      1 => 'keyword.control.label.latex',
      2 => 'punctuation.definition.keyword.latex',
      3 => 'punctuation.definition.arguments.begin.latex'
    to %r/\}/,
      0 => 'punctuation.definition.arguments.end.latex'
    rule 'variable.parameter.definition.label.latex' do
      match %r'[a-zA-Z0-9\.,:/*!^_-]'
    end
  end
  rule 'meta.function.verb.latex' do
    content_scope "markup.raw.verb.latex"
    from %r/((\\)verb[\*]?)\s*((\\)scantokens)(\{)/,
      1 => 'support.function.verb.latex',
      2 => 'punctuation.definition.function.latex',
      3 => 'support.function.verb.latex',
      4 => 'punctuation.definition.verb.latex',
      5 => 'punctuation.definition.begin.latex'
    to %r/(\})/,
      1 => 'punctuation.definition.end.latex'
    include "$self"
  end
  rule 'meta.function.verb.latex' do
    match %r/((\\)verb[\*]?)\s*((?<=\s)\S|[^a-zA-Z])(.*?)(\3|$)/,
      1 => 'support.function.verb.latex',
      2 => 'punctuation.definition.function.latex',
      3 => 'punctuation.definition.verb.latex',
      4 => 'markup.raw.verb.latex',
      5 => 'punctuation.definition.verb.latex'
  end
  rule 'string.quoted.double.european.latex' do
    from %r/"`/,
      0 => 'punctuation.definition.string.begin.latex'
    to %r/"'/,
      0 => 'punctuation.definition.string.end.latex'
    include "$base"
  end
  rule 'string.quoted.double.latex' do
    from %r/``/,
      0 => 'punctuation.definition.string.begin.latex'
    to %r/''|"/,
      0 => 'punctuation.definition.string.end.latex'
    include "$base"
  end
  rule 'string.quoted.double.guillemot.latex' do
    from %r/">/,
      0 => 'punctuation.definition.string.begin.latex'
    to %r/"</,
      0 => 'punctuation.definition.string.end.latex'
    include "$base"
  end
  rule 'string.quoted.double.guillemot.latex' do
    from %r/"</,
      0 => 'punctuation.definition.string.begin.latex'
    to %r/">/,
      0 => 'punctuation.definition.string.end.latex'
    include "$base"
  end
  rule 'string.other.math.latex' do
    from %r/\\\(/,
      0 => 'punctuation.definition.string.begin.latex'
    to %r/\\\)/,
      0 => 'punctuation.definition.string.end.latex'
    include "$base"
  end
  rule 'string.other.math.latex' do
    from %r/\\\[/,
      0 => 'punctuation.definition.string.begin.latex'
    to %r/\\\]/,
      0 => 'punctuation.definition.string.end.latex'
    include "$base"
  end
  rule 'invalid.illegal.string.quoted.single.latex' do
    match %r/(?<!\S)'.*?'/
  end
  rule 'invalid.illegal.string.quoted.double.latex' do
    match %r/(?<!\S)".*?"/
  end
  rule 'constant.character.latex' do
    match %r/(\\)(text(s(terling|ixoldstyle|urd|e(ction|venoldstyle|rvicemark))|yen|n(ineoldstyle|umero|aira)|c(ircledP|o(py(left|right)|lonmonetary)|urrency|e(nt(oldstyle)?|lsius))|t(hree(superior|oldstyle|quarters(emdash)?)|i(ldelow|mes)|w(o(superior|oldstyle)|elveudash)|rademark)|interrobang(down)?|zerooldstyle|o(hm|ne(superior|half|oldstyle|quarter)|penbullet|rd(feminine|masculine))|d(i(scount|ed|v(orced)?)|o(ng|wnarrow|llar(oldstyle)?)|egree|agger(dbl)?|blhyphen(char)?)|uparrow|p(ilcrow|e(so|r(t(housand|enthousand)|iodcentered))|aragraph|m)|e(stimated|ightoldstyle|uro)|quotes(traight(dblbase|base)|ingle)|f(iveoldstyle|ouroldstyle|lorin|ractionsolidus)|won|l(not|ira|e(ftarrow|af)|quill|angle|brackdbl)|a(s(cii(caron|dieresis|acute|grave|macron|breve)|teriskcentered)|cutedbl)|r(ightarrow|e(cipe|ferencemark|gistered)|quill|angle|brackdbl)|g(uarani|ravedbl)|m(ho|inus|u(sicalnote)?|arried)|b(igcircle|orn|ullet|lank|a(ht|rdbl)|rokenbar)))\b/,
      1 => 'punctuation.definition.constant.latex'
  end
  rule 'meta.column-specials.latex' do
    match %r/(?:<|>)(\{)\$(\})/,
      1 => 'punctuation.definition.column-specials.begin.latex',
      2 => 'punctuation.definition.column-specials.end.latex'
  end
  include "text.tex"
end
