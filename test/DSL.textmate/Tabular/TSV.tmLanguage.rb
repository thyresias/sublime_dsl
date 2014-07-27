# encoding: utf-8

language 'TSV' => 'text.tabular.tsv' do
  file_types %w(tsv)
  key_equivalent "^~T"  # TextMate only
  uuid "7D87F38B-A972-4F61-B9C0-7D6D15EEED38"  # TextMate only

  include "#table"

  fragment :field do
    rule do
      content_scope "meta.tabular.field.tsv"
      from %r/(:^|(?<=\t))(?!$|\t)/
      to %r/$|(\t)/,
        1 => 'punctuation.separator.tabular.field.tsv'
    end
    rule 'punctuation.separator.tabular.field.tsv' do
      match %r/\t/
    end
  end

  fragment :header do
    rule 'meta.tabular.row.header.tsv' do
      from %r/^(?!$)/
      to %r/$/
      include "#field"
    end
  end

  fragment :row do
    rule 'meta.tabular.row.tsv' do
      from %r/^(?!$)/
      to %r/$/
      include "#field"
    end
  end

  fragment :table do
    rule 'meta.tabular.table.tsv' do
      from %r/^/
      to %r/^$not possible$^/
      include "#header"
      rule do
        #
        # everything after the first row is not a header
        #
        from %r/(\n)/,
          1 => 'punctuation.separator.table.row.tsv'
        to %r/^$not possible$^/
        include "#row"
        rule 'punctuation.separator.table.row.tsv' do
          match %r/\n/
        end
      end
    end
  end
end
