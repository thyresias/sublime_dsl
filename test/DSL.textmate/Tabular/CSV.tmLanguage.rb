# encoding: utf-8

language 'CSV' => 'text.tabular.csv' do
  file_types %w(csv)
  key_equivalent "^~C"  # TextMate only
  uuid "B0691F9F-D279-48CB-8959-2C9426579002"  # TextMate only

  include "#table"

  fragment :field do
    rule do
      #
      # this field uses "s and is thus able to enclose
      # newlines or commas
      #
      content_scope "meta.tabular.field.quoted.csv"
      from %r/(^|(?<=,))(")/,
        2 => 'punctuation.definition.field.csv'
      to %r/(")($|(,))/,
        1 => 'punctuation.definition.field.csv',
        3 => 'punctuation.separator.tabular.field.csv'
      rule 'constant.character.escape.straight-quote.csv' do
        match %r/""/
      end
    end
    rule do
      content_scope "meta.tabular.field.csv"
      from %r/(:^|(?<=,))(?!$|,)/
      to %r/$|(,)/,
        1 => 'punctuation.separator.tabular.field.csv'
    end
    rule 'punctuation.separator.tabular.field.csv' do
      match %r/,/
    end
  end

  fragment :header do
    rule 'meta.tabular.row.header.csv' do
      from %r/^(?!$)/
      to %r/$/
      include "#field"
    end
  end

  fragment :row do
    rule 'meta.tabular.row.csv' do
      from %r/^(?!$)/
      to %r/$/
      include "#field"
    end
  end

  fragment :table do
    rule 'meta.tabular.table.csv' do
      from %r/^/
      to %r/^$not possible$^/
      include "#header"
      rule do
        #
        # everything after the first row is not a header
        #
        from %r/(\n)/,
          1 => 'punctuation.separator.table.row.csv'
        to %r/^$not possible$^/
        include "#row"
        rule 'punctuation.separator.table.row.csv' do
          match %r/\n/
        end
      end
    end
  end
end
