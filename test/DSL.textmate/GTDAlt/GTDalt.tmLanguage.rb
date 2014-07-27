# encoding: utf-8

language 'GTDalt' => 'text.gtdalt' do
  file_types %w(gtd gtdlog)
  key_equivalent "^~G"  # TextMate only
  uuid "C36472BD-A8CD-4613-A595-CEFB052E6181"  # TextMate only

  rule 'meta.project.begin.gtdalt' do
    from %r/^\s*(project)\s+(.*)(\n)/,
      0 => 'meta.line.project.begin.gtdalt',
      1 => 'keyword.control.project.begin.gtdalt',
      2 => 'entity.name.section.project.title.gtdalt',
      3 => 'meta.project.newline.gtdalt'
    to %r/^\s*(end)\s*/,
      0 => 'meta.line.project.end.gtdalt',
      1 => 'keyword.control.project.end.gtdalt'
    include "$self"
  end
  rule 'meta.action.only-context.gtdalt' do
    match %r/^\s*((@)\S++\n)/,
      1 => 'storage.type.context.action.gtdalt',
      2 => 'punctuation.definition.context.action.gtdalt'
  end
  rule 'meta.action.gtdalt' do
    from %r/^\s*((@)\S++\s)/,
      1 => 'storage.type.context.action.gtdalt',
      2 => 'punctuation.definition.context.action.gtdalt'
    to %r/\n|$/
    include "#note"
    include "#date"
    include "#title"
  end
  rule 'meta.action.completed.gtdalt' do
    match %r/^((#)completed(:))((\[)\d{4}-\d{2}-\d{2}(\]))\s*(.*)/,
      0 => 'comment.line.number-sign.action.completed.gtdalt',
      2 => 'punctuation.definition.completed.gtdalt',
      3 => 'punctuation.definition.completed.gtdalt',
      4 => 'string.quoted.other.timestamp.action.completed.gtdalt',
      5 => 'punctuation.definition.date.gtdalt',
      6 => 'punctuation.definition.date.gtdalt'
  end
  rule 'meta.note.gtdalt' do
    from %r/^((\[)\d+(\]))/,
      1 => 'support.other.note.gtdalt',
      2 => 'punctuation.definition.note.note.gtdalt',
      3 => 'punctuation.definition.note.note.gtdalt'
    to %r/\n|$/
    include "#link"
  end
  rule 'meta.action.archived.gtdalt' do
    match %r'^(\/)(\d{4}-\d{2}-\d{2})(\/)([^\/]+)(\/)(@\S+)\s++(.*)$',
      1 => 'punctuation.separator.archived.gtdalt',
      2 => 'string.quoted.other.timestamp.action.archived.gtdalt',
      3 => 'punctuation.separator.archived.gtdalt',
      4 => 'support.other.project.action.archived.gtdalt',
      5 => 'punctuation.separator.archived.gtdalt',
      6 => 'storage.type.context.action.archived.gtdalt',
      7 => 'comment.line.slash.action.archived.gtdalt'
  end
  rule 'meta.project.archived.gtdalt' do
    match %r'^(\/)(\d{4}-\d{2}-\d{2})(\/)([^\/]+)$',
      1 => 'punctuation.separator.archived.gtdalt',
      2 => 'string.quoted.other.timestamp.project.archived.gtdalt',
      3 => 'punctuation.separator.archived.gtdalt',
      4 => 'support.other.project.archived.gtdalt'
  end
  rule 'comment.line.number-sign.generic.gtdalt' do
    from %r/^(#)\s/
    to %r/\n/
    both 1 => 'punctuation.definition.comment.gtdalt'
  end

  fragment :date do
    rule do
      match %r/((?:due|at|from)(:))((\[)\d{4}-\d{2}-\d{2}(\]))/,
        1 => 'keyword.operator.due.gtdalt',
        2 => 'punctuation.separator.key-value.due.gtdalt',
        3 => 'string.quoted.other.timestamp.due.gtdalt',
        4 => 'punctuation.definition.due.gtdalt',
        5 => 'punctuation.definition.due.gtdalt'
    end
  end

  fragment :link do
    rule do
      match %r/(<)([^>]*)(>)/,
        1 => 'punctuation.definition.link.gtdalt',
        2 => 'markup.underline.link.gtdalt',
        3 => 'punctuation.definition.link.gtdalt'
    end
  end

  fragment :note do
    rule 'support.other.note.gtdalt' do
      match %r/(\[)\d+(\])/,
        1 => 'punctuation.definition.note.gtdalt',
        2 => 'punctuation.definition.note.gtdalt'
    end
  end

  fragment :title do
    rule 'constant.other.title.gtdalt' do
      match %r/\S+(?:\s+\S+)*?(?=\s*(?:\[\d+\]|(?:due|at|from):|$))/
    end
  end
end
