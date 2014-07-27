# encoding: utf-8

language 'Graphviz (DOT)' => 'source.dot', file: 'DOT' do
  file_types %w(dot DOT)
  folding_start_marker %r/\{/
  folding_stop_marker %r/\}/
  key_equivalent "^~G"  # TextMate only
  uuid "1A53D54E-6B1D-11D9-A006-000D93589AF6"  # TextMate only

  rule 'storage.type.dot' do
    match %r/\b(node|edge|graph|digraph|subgraph|strict)\b/
  end
  rule 'support.constant.attribute.node.dot' do
    match %r/\b(bottomlabel|color|comment|distortion|fillcolor|fixedsize|fontcolor|fontname|fontsize|group|height|label|layer|orientation|peripheries|regular|shape|shapefile|sides|skew|style|toplabel|URL|width|z)\b/
  end
  rule 'support.constant.attribute.edge.dot' do
    match %r/\b(arrowhead|arrowsize|arrowtail|color|comment|constraint|decorate|dir|fontcolor|fontname|fontsize|headlabel|headport|headURL|label|labelangle|labeldistance|labelfloat|labelcolor|labelfontname|labelfontsize|layer|lhead|ltail|minlen|samehead|sametail|style|taillabel|tailport|tailURL|weight)\b/
  end
  rule 'support.constant.attribute.graph.dot' do
    match %r/\b(bgcolor|center|clusterrank|color|comment|compound|concentrate|fillcolor|fontname|fontpath|fontsize|label|labeljust|labelloc|layers|margin|mclimit|nodesep|nslimit|nslimit1|ordering|orientation|page|pagedir|quantum|rank|rankdir|ranksep|ratio|remincross|rotate|samplepoints|searchsize|size|style|URL)\b/
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
  rule 'comment.line.double-slash.dot' do
    match %r'(//).*$\n?',
      1 => 'punctuation.definition.comment.dot'
  end
  rule 'comment.line.number-sign.dot' do
    match %r/(#).*$\n?/,
      1 => 'punctuation.definition.comment.dot'
  end
  rule 'comment.block.dot' do
    from %r'/\*'
    to %r'\*/'
    both 0 => 'punctuation.definition.comment.dot'
  end
end
