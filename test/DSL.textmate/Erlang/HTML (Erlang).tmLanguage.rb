# encoding: utf-8

language 'HTML (Erlang)' => 'text.html.erlang.yaws' do
  file_types %w(yaws)
  key_equivalent "^~E"  # TextMate only
  uuid "3FBFF015-B650-4734-848C-47B53ACD5E32"  # TextMate only

  rule do
    content_scope "meta.embedded.erlang"
    from %r/(^\s*)?(?=<erl>)/,
      1 => 'punctuation.whitespace.embedded.leading.html'
    to %r/(?!\G)(\s*\n)?/,
      1 => 'punctuation.whitespace.embedded.trailing.html'
    rule do
      content_scope "source.erlang"
      from %r/(<)(erl)(>)/,
        0 => 'meta.tag.template.html',
        1 => 'punctuation.definition.tag.begin.html',
        2 => 'entity.name.tag.html',
        3 => 'punctuation.definition.tag.end.html'
      to %r'((</))(erl)(>)',
        0 => 'meta.tag.template.html',
        1 => 'punctuation.definition.tag.begin.html',
        2 => 'source.erlang',
        3 => 'entity.name.tag.html',
        4 => 'punctuation.definition.tag.end.html'
      include "source.erlang"
    end
  end
  include "text.html.basic"
end
