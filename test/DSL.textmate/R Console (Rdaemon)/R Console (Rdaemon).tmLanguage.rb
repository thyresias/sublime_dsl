# encoding: utf-8

language 'R Console (Rdaemon)' => 'source.rd.console' do
  file_types %w(Rcon)
  key_equivalent "^~R"  # TextMate only
  uuid "BFF67768-64A2-4D0B-A324-F07D1E08AA9B"  # TextMate only

  rule 'markup.quote.rd.console.error' do
    from %r/(?i)^\s*(error|erreur|fehler|errore|erro)( |:)/,
      0 => 'constant.other.rd.console.error'
    to %r/(.*)(?=> )/,
      0 => 'keyword.other.embedded.rd.console'
  end
  rule 'storage.type.method.rd.console.warning' do
    from %r/^\s*(Warning|Warning messages?|Message d.avis|Warnmeldung|Messaggio di avvertimento|Mensagem de aviso):/,
      0 => 'entity.name.tag.rd.console.warning'
    to %r/.*(?=> )/,
      0 => 'keyword.other.embedded.rd.console'
  end
  rule 'source.rd.console.prompt' do
    from %r/^[>+:] /,
      0 => 'keyword.other.embedded.rd.console'
    to %r/\n\z/
    include "source.r"
  end
  rule 'source.rd.console.prompt' do
    from %r/^Browse\[\d+\]/,
      0 => 'meta.section.embedded.rd.console'
    to %r/\n\z/
    include "source.r"
  end
  rule 'source.r.embedded' do
    from %r/^(?<![>+:])/
    to %r/\n/
    include "source.r"
  end
end
