# encoding: utf-8

language 'Cap’n Proto' => 'source.capnp' do
  file_types %w(capnp)
  key_equivalent "^~C"  # TextMate only
  uuid "57EA0128-2507-456B-AFF2-BEAFEB5A6B6E"  # TextMate only

  rule do
    match %r/\b(struct)(?:\s+([A-Za-z]+))?/,
      1 => 'keyword.other.struct.capnp',
      2 => 'entity.name.type.capnp'
  end
  rule 'keyword.other.capnp' do
    match %r/\b(using|import|union|enum|const|interface|annotation)\b/
  end
  rule 'storage.type.builtin.capnp' do
    match %r/:(Void|Bool|U?Int(8|16|32|64)|Float(32|64)|Text|Data|List\([.a-zA-Z0-9()]*\)|Object|union|group)/
  end
  rule 'storage.type.custom.capnp' do
    match %r/:[.a-zA-Z0-9()]+/
  end
  rule 'constant.language.capnp' do
    match %r/\b(true|false|void)\b/
  end
  rule 'constant.numeric.capnp' do
    match %r/\b(0x\h+|\d+(\.\d+)?)\b/
  end
  rule 'constant.numeric.unique-id.capnp' do
    match %r/@0x\h+/
  end
  rule 'constant.numeric.ordinal.capnp' do
    match %r/@\d+/
  end
  rule 'string.quoted.double.capnp' do
    from %r/"/
    to %r/"/
    rule 'constant.character.escape.capnp' do
      match %r/\./
    end
  end
  rule do
    from %r/(^[ \t]+)?(?=#)/,
      1 => 'punctuation.whitespace.comment.leading.capnp'
    to %r/(?!\G)/
    rule 'comment.line.number-sign.capnp' do
      from %r/#/,
        0 => 'punctuation.definition.comment.capnp'
      to %r/\n/
    end
  end
  rule do
    match %r/(\{)(\})/,
      1 => 'punctuation.section.block.begin.capnp',
      2 => 'punctuation.section.block.end.capnp'
  end
end
