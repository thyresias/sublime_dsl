# encoding: utf-8

language 'TeX' => 'text.tex' do
  file_types %w(sty cls bbx cbx)
  uuid "6BC8DE6F-9360-4C7E-AC3C-971385945346"  # TextMate only

  rule 'keyword.control.tex' do
    match %r/(\\)(backmatter|else|fi|frontmatter|ftrue|mainmatter|if(case|cat|dim|eof|false|hbox|hmode|inner|mmode|num|odd|undefined|vbox|vmode|void|x)?)\b/,
      1 => 'punctuation.definition.keyword.tex'
  end
  rule 'meta.catcode.tex' do
    match %r/((\\)catcode)`(?:\\)?.(=)(\d+)/,
      1 => 'keyword.control.catcode.tex',
      2 => 'punctuation.definition.keyword.tex',
      3 => 'punctuation.separator.key-value.tex',
      4 => 'constant.numeric.category.tex'
  end
  rule do
    from %r/(^[ \t]+)?(?=%)/,
      1 => 'punctuation.whitespace.comment.leading.tex'
    to %r/(?!\G)/
    rule 'comment.line.percentage.semicolon.texshop.tex' do
      from %r/%:/,
        0 => 'punctuation.definition.comment.tex'
      to %r/$\n?/
    end
    rule 'comment.line.percentage.directive.texshop.tex' do
      from %r/^(%!TEX) (\S*) =/,
        1 => 'punctuation.definition.comment.tex'
      to %r/$\n?/
    end
    rule 'comment.line.percentage.tex' do
      from %r/%/,
        0 => 'punctuation.definition.comment.tex'
      to %r/$\n?/
    end
  end
  rule 'meta.group.braces.tex' do
    from %r/\{/,
      0 => 'punctuation.section.group.begin.tex'
    to %r/\}/,
      0 => 'punctuation.section.group.end.tex'
    include "$base"
  end
  rule 'punctuation.definition.brackets.tex' do
    match %r/[\[\]]/
  end
  rule 'string.other.math.block.tex' do
    from %r/\$\$/,
      0 => 'punctuation.definition.string.begin.tex'
    to %r/\$\$/,
      0 => 'punctuation.definition.string.end.tex'
    include "#math"
    include "$self"
  end
  rule 'constant.character.newline.tex' do
    match %r/\\\\/
  end
  rule 'string.other.math.tex' do
    from %r/\$/,
      0 => 'punctuation.definition.string.begin.tex'
    to %r/\$/,
      0 => 'punctuation.definition.string.end.tex'
    rule 'constant.character.escape.tex' do
      match %r/\\\$/
    end
    include "#math"
    include "$self"
  end
  rule 'support.function.general.tex' do
    match %r/(\\)[A-Za-z@]+/,
      1 => 'punctuation.definition.function.tex'
  end
  rule 'constant.character.escape.tex' do
    match %r/(\\)[^a-zA-Z@]/,
      1 => 'punctuation.definition.keyword.tex'
  end
  rule 'meta.placeholder.greek.tex' do
    match %r/«press a-z and space for greek letter»[a-zA-Z]*/
  end

  fragment :math do
    rule 'constant.character.math.tex' do
      match %r/(\\)(s(s(earrow|warrow|lash)|h(ort(downarrow|uparrow|parallel|leftarrow|rightarrow|mid)|arp)|tar|i(gma|m(eq)?)|u(cc(sim|n(sim|approx)|curlyeq|eq|approx)?|pset(neq(q)?|plus(eq)?|eq(q)?)?|rd|m|bset(neq(q)?|plus(eq)?|eq(q)?)?)|p(hericalangle|adesuit)|e(tminus|arrow)|q(su(pset(eq)?|bset(eq)?)|c(up|ap)|uare)|warrow|m(ile|all(s(etminus|mile)|frown)))|h(slash|ook(leftarrow|rightarrow)|eartsuit|bar)|R(sh|ightarrow|e|bag)|Gam(e|ma)|n(s(hort(parallel|mid)|im|u(cc(eq)?|pseteq(q)?|bseteq))|Rightarrow|n(earrow|warrow)|cong|triangle(left(eq(slant)?)?|right(eq(slant)?)?)|i(plus)?|u|p(lus|arallel|rec(eq)?)|e(q|arrow|g|xists)|v(dash|Dash)|warrow|le(ss|q(slant|q)?|ft(arrow|rightarrow))|a(tural|bla)|VDash|rightarrow|g(tr|eq(slant|q)?)|mid|Left(arrow|rightarrow))|c(hi|irc(eq|le(d(circ|S|dash|ast)|arrow(left|right)))?|o(ng|prod|lon|mplement)|dot(s|p)?|u(p|r(vearrow(left|right)|ly(eq(succ|prec)|vee(downarrow|uparrow)?|wedge(downarrow|uparrow)?)))|enterdot|lubsuit|ap)|Xi|Maps(to(char)?|from(char)?)|B(ox|umpeq|bbk)|t(h(ick(sim|approx)|e(ta|refore))|imes|op|wohead(leftarrow|rightarrow)|a(u|lloblong)|riangle(down|q|left(eq(slant)?)?|right(eq(slant)?)?)?)|i(n(t(er(cal|leave))?|plus|fty)?|ota|math)|S(igma|u(pset|bset))|zeta|o(slash|times|int|dot|plus|vee|wedge|lessthan|greaterthan|m(inus|ega)|b(slash|long|ar))|d(i(v(ideontimes)?|a(g(down|up)|mond(suit)?)|gamma)|o(t(plus|eq(dot)?)|ublebarwedge|wn(harpoon(left|right)|downarrows|arrow))|d(ots|agger)|elta|a(sh(v|leftarrow|rightarrow)|leth|gger))|Y(down|up|left|right)|C(up|ap)|u(n(lhd|rhd)|p(silon|harpoon(left|right)|downarrow|uparrows|lus|arrow)|lcorner|rcorner)|jmath|Theta|Im|p(si|hi|i(tchfork)?|erp|ar(tial|allel)|r(ime|o(d|pto)|ec(sim|n(sim|approx)|curlyeq|eq|approx)?)|m)|e(t(h|a)|psilon|q(slant(less|gtr)|circ|uiv)|ll|xists|mptyset)|Omega|D(iamond|ownarrow|elta)|v(d(ots|ash)|ee(bar)?|Dash|ar(s(igma|u(psetneq(q)?|bsetneq(q)?))|nothing|curly(vee|wedge)|t(heta|imes|riangle(left|right)?)|o(slash|circle|times|dot|plus|vee|wedge|lessthan|ast|greaterthan|minus|b(slash|ar))|p(hi|i|ropto)|epsilon|kappa|rho|bigcirc))|kappa|Up(silon|downarrow|arrow)|Join|f(orall|lat|a(t(s(emi|lash)|bslash)|llingdotseq)|rown)|P(si|hi|i)|w(p|edge|r)|l(hd|n(sim|eq(q)?|approx)|ceil|times|ightning|o(ng(left(arrow|rightarrow)|rightarrow|maps(to|from))|zenge|oparrow(left|right))|dot(s|p)|e(ss(sim|dot|eq(qgtr|gtr)|approx|gtr)|q(slant|q)?|ft(slice|harpoon(down|up)|threetimes|leftarrows|arrow(t(ail|riangle))?|right(squigarrow|harpoons|arrow(s|triangle|eq)?))|adsto)|vertneqq|floor|l(c(orner|eil)|floor|l|bracket)?|a(ngle|mbda)|rcorner|bag)|a(s(ymp|t)|ngle|pprox(eq)?|l(pha|eph)|rrownot|malg)|V(dash|vdash)|r(h(o|d)|ceil|times|i(singdotseq|ght(s(quigarrow|lice)|harpoon(down|up)|threetimes|left(harpoons|arrows)|arrow(t(ail|riangle))?|rightarrows))|floor|angle|r(ceil|parenthesis|floor|bracket)|bag)|g(n(sim|eq(q)?|approx)|tr(sim|dot|eq(qless|less)|less|approx)|imel|eq(slant|q)?|vertneqq|amma|g(g)?)|Finv|xi|m(ho|i(nuso|d)|o(o|dels)|u(ltimap)?|p|e(asuredangle|rge)|aps(to|from(char)?))|b(i(n(dnasrepma|ampersand)|g(s(tar|qc(up|ap))|nplus|c(irc|u(p|rly(vee|wedge))|ap)|triangle(down|up)|interleave|o(times|dot|plus)|uplus|parallel|vee|wedge|box))|o(t|wtie|x(slash|circle|times|dot|plus|empty|ast|minus|b(slash|ox|ar)))|u(llet|mpeq)|e(cause|t(h|ween|a))|lack(square|triangle(down|left|right)?|lozenge)|a(ck(s(im(eq)?|lash)|prime|epsilon)|r(o|wedge))|bslash)|L(sh|ong(left(arrow|rightarrow)|rightarrow|maps(to|from))|eft(arrow|rightarrow)|leftarrow|ambda|bag)|Arrownot)\b/,
        1 => 'punctuation.definition.constant.math.tex'
    end
    rule 'constant.character.math.tex' do
      match %r/(\\)(sum|prod|coprod|int|oint|bigcap|bigcup|bigsqcup|bigvee|bigwedge|bigodot|bigotimes|bogoplus|biguplus)\b/,
        1 => 'punctuation.definition.constant.math.tex'
    end
    rule 'constant.other.math.tex' do
      match %r/(\\)(arccos|arcsin|arctan|arg|cos|cosh|cot|coth|csc|deg|det|dim|exp|gcd|hom|inf|ker|lg|lim|liminf|limsup|ln|log|max|min|pr|sec|sin|sinh|sup|tan|tanh)\b/,
        1 => 'punctuation.definition.constant.math.tex'
    end
    rule 'meta.embedded.line.r' do
      content_scope "support.function.sexpr.math.tex"
      from %r/((\\)Sexpr(\{))/,
        1 => 'support.function.sexpr.math.tex',
        2 => 'punctuation.definition.function.math.tex',
        3 => 'punctuation.section.embedded.begin.math.tex'
      to %r/(((\})))/,
        1 => 'support.function.sexpr.math.tex',
        2 => 'punctuation.section.embedded.end.math.tex',
        3 => 'source.r'
      rule 'source.r' do
        from %r/\G(?!\})/
        to %r/(?=\})/
        include "source.r"
      end
    end
    rule 'constant.other.general.math.tex' do
      match %r/(\\)([^a-zA-Z]|[A-Za-z]+)(?=\b|\}|\]|\^|\_)/,
        1 => 'punctuation.definition.constant.math.tex'
    end
    rule 'constant.numeric.math.tex' do
      match %r/(([0-9]*[\.][0-9]+)|[0-9]+)/
    end
    rule 'meta.placeholder.greek.math.tex' do
      match %r/«press a-z and space for greek letter»[a-zA-Z]*/
    end
  end
end
