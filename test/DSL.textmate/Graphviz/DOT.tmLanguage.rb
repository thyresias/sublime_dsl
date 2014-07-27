# encoding: utf-8

language 'Graphviz (DOT)' => 'source.dot', file: 'DOT' do
  file_types %w(dot DOT)
  first_line_match %r/digraph.*/
  key_equivalent "^~G"  # TextMate only
  uuid "1A53D54E-6B1D-11D9-A006-000D93589AF6"  # TextMate only

  rule do
    # named digraph declaration: "digraph NAME {"
    match %r/ ?(digraph)[ \t]+([A-Za-z0-9]+) ?(\{)/,
      1 => 'storage.type.dot',
      2 => 'variable.other.dot',
      4 => 'punctuation.section.dot'
  end
  rule 'keyword.operator.dot' do
    # edge definition: <- -> --
    match %r/(<|-)(>|-)/
  end
  rule 'storage.type.dot' do
    match %r/\b(node|edge|graph|digraph|subgraph|strict)\b/
  end
  rule 'support.constant.attribute.node.dot' do
    match %r/\b(bottomlabel|color|comment|distortion|fillcolor|fixedsize|fontcolor|fontname|fontsize|group|height|label|layer|orientation|peripheries|regular|shape|shapefile|sides|skew|style|toplabel|URL|width|z)\b/
  end
  rule 'support.constant.attribute.edge.dot' do
    match %r/\b(arrowhead|arrowsize|arrowtail|color|comment|constraint|decorate|dir|fontcolor|fontname|fontsize|headlabel|headport|headURL|label|labelangle|labeldistance|labelfloat|labelcolor|labelfontname|labelfontsize|layer|lhead|ltail|minlen|samehead|sametail|splines|style|taillabel|tailport|tailURL|weight)\b/
  end
  rule 'support.constant.attribute.graph.dot' do
    match %r/\b(bgcolor|center|clusterrank|color|comment|compound|concentrate|fillcolor|fontname|fontpath|fontsize|label|labeljust|labelloc|layers|margin|mclimit|nodesep|nslimit|nslimit1|ordering|orientation|page|pagedir|quantum|rank|rankdir|ranksep|ratio|remincross|rotate|samplepoints|searchsize|size|style|URL)\b/
  end
  rule 'variable.other.dot' do
    match %r/\b(box|polygon|ellipse|circle|point|egg|triangle|plaintext|diamond|trapezium|parallelogram|house|pentagon|hexagon|septagon|octagon|doublecircle|doubleoctagon|tripleoctagon|invtriangle|invtrapezium|invhouse|Mdiamond|Msquare|Mcircle|rect|rectangle|none|note|tab|folder|box3d|component|max|min|same)\b/
  end
  rule 'string.quoted.double.dot' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.dot'
    to %r/"/,
      0 => 'punctuation.definition.string.end.dot'
    rule 'constant.character.escape.dot' do
      match %r/\\./
    end
  end
  rule do
    from %r'(^[ \t]+)?(?=//)',
      1 => 'punctuation.whitespace.comment.leading.dot'
    to %r/(?!\G)/
    rule 'comment.line.double-slash.dot' do
      from %r'//',
        0 => 'punctuation.definition.comment.dot'
      to %r/\n/
    end
  end
  rule do
    from %r/(^[ \t]+)?(?=#)/,
      1 => 'punctuation.whitespace.comment.leading.dot'
    to %r/(?!\G)/
    rule 'comment.line.number-sign.dot' do
      from %r/#/,
        0 => 'punctuation.definition.comment.dot'
      to %r/\n/
    end
  end
  rule 'comment.block.dot' do
    from %r'/\*'
    to %r'\*/'
    both 0 => 'punctuation.definition.comment.dot'
  end
end
