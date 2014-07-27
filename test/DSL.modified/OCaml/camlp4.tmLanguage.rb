# encoding: utf-8

language 'camlp4' => 'source.camlp4.ocaml' do
  # FIXME: no file types
  folding_start_marker %r/(\bEXTEND\B)/
  folding_stop_marker %r/(\bEND\b)/
  uuid "37538B6B-CEFA-4DAE-B1E4-1218DB82B37F"  # TextMate only

  rule 'meta.camlp4-stream.ocaml' do
    from %r/(\[<)(?=.*?>\])/
    to %r/(?=>\])/
    both 1 => 'punctuation.definition.camlp4-stream.ocaml'
    include "#camlpppp-streams"
  end
  rule 'punctuation.definition.camlp4-stream.ocaml' do
    match %r/\[<|>\]/
  end
  rule 'keyword.other.camlp4.ocaml' do
    match %r/\bparser\b|<(<|:)|>>|\$(:|\${0,1})/
  end

  fragment :"camlpppp-streams" do
    rule 'meta.camlp4-stream.element.ocaml' do
      from %r/(')/,
        1 => 'punctuation.definition.camlp4.simple-element.ocaml'
      to %r/(;)(?=\s*')|(?=\s*>\])/,
        1 => 'punctuation.separator.camlp4.ocaml'
      include "source.ocaml"
    end
  end
end
