# encoding: utf-8

language 'NAnt Build File' => 'source.nant-build', file: 'Build' do
  file_types %w(build)
  folding_start_marker %r'<[^!?/>]+|<!--'
  folding_stop_marker %r'/>|</[^?>]+|-->'
  uuid "1BA72668-707C-11D9-A928-000D93589AF6"  # TextMate only

  rule 'comment.block.nant' do
    from %r/<!--/
    to %r/-->/
    both 0 => 'punctuation.definition.comment.nant'
  end
  rule 'meta.tag.nant' do
    from %r'(</?)([-_a-zA-Z0-9:]+)'
    to %r'(/?>)'
    both 1 => 'punctuation.definition.tag.nant',
         2 => 'entity.name.tag.nant'
    rule 'entity.other.attribute-name.nant' do
      match %r/ ([a-zA-Z-]+)/
    end
    rule 'string.quoted.double.nant' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.nant'
      to %r/"/,
        0 => 'punctuation.definition.string.end.nant'
    end
    rule 'string.quoted.single.nant' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.nant'
      to %r/'/,
        0 => 'punctuation.definition.string.end.nant'
    end
  end
  rule 'constant.character.entity.nant' do
    match %r/(&)([a-zA-Z]+|#[0-9]+|#x[0-9a-fA-F]+)(;)/,
      1 => 'punctuation.definition.constant.nant',
      3 => 'punctuation.definition.constant.nant'
  end
  rule 'invalid.illegal.bad-ampersand.nant' do
    match %r/&/
  end
end
