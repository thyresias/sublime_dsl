# encoding: windows-1252

language 'Mail' => 'text.mail.markdown' do
  file_types %w(mail eml)
  first_line_match %r/^From: .*(?=\w+@[\w-]+\.\w+)/
  key_equivalent "^~M"  # TextMate only
  uuid "15615A0C-37B0-4B3F-9105-53ED536AFBB4"  # TextMate only

  rule 'meta.header.mail' do
    content_scope "entity.name.section.mail"
    from %r/((?i:subject))(:)\s*/,
      1 => 'keyword.other.mail',
      2 => 'punctuation.separator.key-value.mail'
    to %r/^(?![ \t\v])/
  end
  rule 'meta.header.mail' do
    # FIXME: (error) invalid hex escape
    from %r/([\x21-\x39\x3B-\x7E]+)(:)\s*/,
      1 => 'keyword.other.mail',
      2 => 'punctuation.separator.key-value.mail'
    to %r/^(?![ \t\v])/
    include "#string"
    include "#comment"
    include "#reference"
    include "#atom"
  end
  rule 'text.html.markdown' do
    from %r/^(?![A-Za-z0-9]+:)/
    to %r/^(?=not)possible$/
    rule 'meta.separator.signature.mail' do
      match %r/^-- $\n/
    end
    include "text.html.markdown"
  end

  # FIXME: this fragment is never referenced
  fragment :any do
    include "#group"
    include "#reference"
    include "#string"
    include "#comment"
    include "#domain_literal"
    include "#atom"
  end

  fragment :atom do
    rule 'string.unquoted.atom.mail' do
      match %r/[^ \t\v\n()<>@,;:\\".\[\]]+/
    end
  end

  fragment :comment do
    rule 'comment.line.parentheses.mail' do
      from %r/\(/
      to %r/\)/
      both 0 => 'punctuation.definition.comment.mail'
      include "#quote_pair"
      include "#comment"
    end
  end

  fragment :domain_literal do
    rule 'meta.domain-literal.mail' do
      from %r/\[/
      to %r/\]/
      include "#quote_pair"
      include "#group"
      include "#reference"
      include "#string"
      include "#comment"
      include "#atom"
    end
  end

  fragment :encoded_text do
    rule 'meta.encoded-text.mail' do
      match %r/=\?(.*?)(?:\*[^?]+)?\?([QB])\?(.*?)\?=/,
        1 => 'constant.other.charset.mail',
        2 => 'constant.other.encoding.mail'
    end
  end

  fragment :group do
    rule 'meta.group.mail' do
      # this is to group addresses, RFC822 says that these “must occur in  matched pairs,” but e.g. the date header uses : as a time separator.
      from %r/:(?=.*;)/
      to %r/;/
      include "#reference"
      include "#string"
      include "#comment"
      include "#domain_literal"
      include "#atom"
    end
  end

  fragment :quote_pair do
    rule 'constant.other.escape.mail' do
      match %r/\\./
    end
  end

  fragment :reference do
    rule 'constant.other.reference.mail' do
      from %r/</
      to %r/>/
      both 0 => 'punctuation.definition.constant.mail'
      include "#string"
      include "#comment"
      include "#domain_literal"
      include "#atom"
    end
  end

  fragment :string do
    rule 'string.quoted.double.mail' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.mail'
      to %r/"/,
        0 => 'punctuation.definition.string.end.mail'
      include "#quote_pair"
      include "#encoded_text"
    end
  end
end
