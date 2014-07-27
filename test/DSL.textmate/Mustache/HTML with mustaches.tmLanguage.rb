# encoding: utf-8

language 'HTML (Mustache)' => 'text.html.mustache', file: 'HTML with mustaches' do
  file_types %w(mustache)
  key_equivalent "^~H"  # TextMate only
  uuid "23C9A029-DEF3-42C2-9680-ED39392876E1"  # TextMate only

  rule 'comment.block.mustache' do
    from %r/\{\{!/
    to %r/\}\}/
  end
  rule 'meta.tag.template.mustache' do
    from %r'\{\{[{<>#/]?'
    to %r/\}?\}\}/
    both 0 => 'entity.name.tag.mustache'
  end
  include "text.html.basic"
end
