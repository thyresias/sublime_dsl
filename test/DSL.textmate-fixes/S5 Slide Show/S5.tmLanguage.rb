# encoding: utf-8

language 'S5 Slide Show' => 'source.s5', file: 'S5' do
  file_types %w(s5)
  key_equivalent "^~S"  # TextMate only
  uuid "84A2047B-4453-418D-B009-A3D3C60F3D1E"  # TextMate only

  rule 'meta.header.s5' do
    match %r/^([A-Za-z0-9]+)(:)\s*(.*)$\n?/,
      1 => 'keyword.other.s5',
      2 => 'punctuation.separator.key-value.s5',
      3 => 'string.unquoted.s5'
  end
  rule do
    from %r/^(?![A-Za-z0-9]+:)/
    to %r/^(?=not)possible$/
    rule do
      #
      # name = 'meta.separator.handout.s5';
      # match = '(^_{10}$)';
      #
      content_scope "text.html.markdown.handout.s5"
      from %r/(^_{10}$)/,
        1 => 'meta.separator.handout.s5'
      # FIXME: (error) '#{' will be interpreted as interpolation: escape '#' as '\#'
      to %r/(?=^(?:(?:✂-{6})+|^\#{10})$)/
      include "text.html.markdown"
    end
    rule do
      #
      # name = 'meta.separator.notes.s5';
      # match = '(^#{10}$)';
      #
      content_scope "text.html.markdown.notes.s5"
      # FIXME: (error) '#{' will be interpreted as interpolation: escape '#' as '\#'
      from %r/(^\#{10}$)/,
        1 => 'meta.separator.notes.s5'
      to %r/(?=^(?:(?:✂-{6})+|_{10})$)/
      include "text.html.markdown"
    end
    rule do
      #
      # name = 'meta.separator.slide.s5';
      # match = '^((✂-{6})+$\n)';
      #
      content_scope "text.html.markdown.slide.s5"
      from %r/^((✂-{6})+$\n)/,
        1 => 'meta.separator.slide.s5'
      # FIXME: (error) '#{' will be interpreted as interpolation: escape '#' as '\#'
      to %r/(?=^(?:(?:✂-{6})+|_{10}|\#{10})$)/
      include "text.html.markdown"
    end
    include "text.html.markdown"
  end
end
