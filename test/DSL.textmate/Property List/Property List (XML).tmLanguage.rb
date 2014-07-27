# encoding: utf-8

language 'Property List (XML)' => 'text.xml.plist' do
  # FIXME: no file types
  first_line_match %r/\s*<\?xml .*\n\s*<!DOCTYPE\s*(?i:plist)\s/
  uuid "76F96472-7552-4884-80B0-BC73CE4DE635"  # TextMate only

  include "#xml"

  fragment :xml do
    rule do
      from %r/((<)((plist\b)))/
      to %r'((/)((plist))(>))'
      both 1 => 'meta.tag.plist.xml.plist',
           2 => 'punctuation.definition.tag.xml.plist',
           3 => 'entity.name.tag.xml.plist',
           4 => 'entity.name.tag.localname.xml.plist',
           5 => 'punctuation.definition.tag.xml.plist'
      rule 'meta.tag.plist.xml.plist' do
        from %r/(?<=<plist)(?!>)\s*(?:(version)(=)(?:((").*?("))|((').*?('))))?/,
          1 => 'entity.other.attribute-name.version.xml.plist',
          2 => 'punctuation.separator.key-value.xml.plist',
          3 => 'string.quoted.double.xml.plist',
          4 => 'punctuation.definition.string.begin.xml.plist',
          5 => 'punctuation.definition.string.end.xml.plist',
          6 => 'string.quoted.single.xml.plist',
          7 => 'punctuation.definition.string.begin.xml.plist',
          8 => 'punctuation.definition.string.end.xml.plist'
        to %r/(?=>)/
      end
      rule do
        # Tag with no content
        match %r'((>(<)))(?=/plist)',
          1 => 'meta.tag.plist.xml.plist',
          2 => 'punctuation.definition.tag.xml.plist',
          3 => 'meta.scope.between-tag-pair.xml.plist'
      end
      rule do
        from %r'((>))(?!</plist)',
          1 => 'meta.tag.plist.xml.plist',
          2 => 'punctuation.definition.tag.xml.plist'
        to %r'(<)(?=/plist)',
          0 => 'meta.tag.plist.xml.plist',
          1 => 'punctuation.definition.tag.xml.plist'
        include "#xml_tags"
      end
    end
    include "#xml_invalid"
    include "#xml_comment"
    include "text.xml"
    include "#xml_stray-char"
  end

  fragment :xml_comment do
    rule 'comment.block.xml.plist' do
      from %r/<!--/
      to %r/(?<!-)-->/
      both 0 => 'punctuation.definition.comment.xml.plist'
      rule 'invalid.illegal.double-dash-not-allowed.xml.plist' do
        match %r/-(?=-->)|--/
      end
    end
  end

  fragment :xml_innertag do
    rule 'constant.character.entity.xml.plist' do
      match %r/&([a-zA-Z0-9_-]+|#[0-9]+|#x[0-9a-fA-F]+);/
    end
    rule 'invalid.illegal.bad-ampersand.xml.plist' do
      match %r/&/
    end
  end

  fragment :xml_invalid do
    rule do
      # Invalid tag
      match %r'((<)/?(\w+).*?(>))',
        1 => 'meta.tag.boolean.xml.plist',
        2 => 'punctuation.definition.tag.xml.plist',
        3 => 'invalid.illegal.tag-not-recognized.xml.plist',
        4 => 'punctuation.definition.tag.xml.plist'
    end
  end

  fragment :"xml_stray-char" do
    rule 'invalid.illegal.character-data-not-allowed-here.xml.plist' do
      match %r/\S/
    end
  end

  fragment :xml_tags do
    rule do
      # Empty tag: Dictionary
      match %r'((<)((dict))(>))(((<)/)((dict))(>))',
        1 => 'meta.tag.dict.xml.plist',
        2 => 'punctuation.definition.tag.xml.plist',
        3 => 'entity.name.tag.xml.plist',
        4 => 'entity.name.tag.localname.xml.plist',
        5 => 'punctuation.definition.tag.xml.plist',
        6 => 'meta.tag.dict.xml.plist',
        7 => 'punctuation.definition.tag.xml.plist',
        8 => 'meta.scope.between-tag-pair.xml.plist',
        9 => 'entity.name.tag.xml.plist',
        10 => 'entity.name.tag.localname.xml.plist',
        11 => 'punctuation.definition.tag.xml.plist'
    end
    rule do
      # Empty tag: Array
      match %r'((<)((array))(>))(((<)/)((array))(>))',
        1 => 'meta.tag.array.xml.plist',
        2 => 'punctuation.definition.tag.xml.plist',
        3 => 'entity.name.tag.xml.plist',
        4 => 'entity.name.tag.localname.xml.plist',
        5 => 'punctuation.definition.tag.xml.plist',
        6 => 'meta.tag.array.xml.plist',
        7 => 'punctuation.definition.tag.xml.plist',
        8 => 'meta.scope.between-tag-pair.xml.plist',
        9 => 'entity.name.tag.xml.plist',
        10 => 'entity.name.tag.localname.xml.plist',
        11 => 'punctuation.definition.tag.xml.plist'
    end
    rule do
      # Empty tag: String
      match %r'((<)((string))(>))(((<)/)((string))(>))',
        1 => 'meta.tag.string.xml.plist',
        2 => 'punctuation.definition.tag.xml.plist',
        3 => 'entity.name.tag.xml.plist',
        4 => 'entity.name.tag.localname.xml.plist',
        5 => 'punctuation.definition.tag.xml.plist',
        6 => 'meta.tag.string.xml.plist',
        7 => 'punctuation.definition.tag.xml.plist',
        8 => 'meta.scope.between-tag-pair.xml.plist',
        9 => 'entity.name.tag.xml.plist',
        10 => 'entity.name.tag.localname.xml.plist',
        11 => 'punctuation.definition.tag.xml.plist'
    end
    rule do
      # the extra captures are required to duplicate the effect of the namespace parsing in the XML syntax
      content_scope "constant.other.name.xml.plist"
      from %r/((<)((key))(>))/
      to %r'((</)((key))(>))'
      both 1 => 'meta.tag.key.xml.plist',
           2 => 'punctuation.definition.tag.xml.plist',
           3 => 'entity.name.tag.xml.plist',
           4 => 'entity.name.tag.localname.xml.plist',
           5 => 'punctuation.definition.tag.xml.plist'
      rule do
        from %r/<!\[CDATA\[/
        # FIXME: (warning) regular expression has ']' without escape
        to %r/]]>/
        both 0 => 'punctuation.definition.constant.xml'
      end
    end
    rule do
      # Self-closing Dictionary
      match %r'((<)((dict))\s*?/(>))',
        1 => 'meta.tag.dict.xml.plist',
        2 => 'punctuation.definition.tag.xml.plist',
        3 => 'entity.name.tag.xml.plist',
        4 => 'entity.name.tag.localname.xml.plist',
        5 => 'punctuation.definition.tag.xml.plist'
    end
    rule do
      # Self-closing Array
      match %r'((<)((array))\s*?/(>))',
        1 => 'meta.tag.array.xml.plist',
        2 => 'punctuation.definition.tag.xml.plist',
        3 => 'entity.name.tag.xml.plist',
        4 => 'entity.name.tag.localname.xml.plist',
        5 => 'punctuation.definition.tag.xml.plist'
    end
    rule do
      # Self-closing String
      match %r'((<)((string))\s*?/(>))',
        1 => 'meta.tag.string.xml.plist',
        2 => 'punctuation.definition.tag.xml.plist',
        3 => 'entity.name.tag.xml.plist',
        4 => 'entity.name.tag.localname.xml.plist',
        5 => 'punctuation.definition.tag.xml.plist'
    end
    rule do
      # Self-closing Key
      match %r'((<)((key))\s*?/(>))',
        1 => 'meta.tag.key.xml.plist',
        2 => 'punctuation.definition.tag.xml.plist',
        3 => 'entity.name.tag.xml.plist',
        4 => 'entity.name.tag.localname.xml.plist',
        5 => 'punctuation.definition.tag.xml.plist'
    end
    rule do
      # Dictionary
      from %r/((<)((dict))(>))/
      to %r'((</)((dict))(>))'
      both 1 => 'meta.tag.dict.xml.plist',
           2 => 'punctuation.definition.tag.xml.plist',
           3 => 'entity.name.tag.xml.plist',
           4 => 'entity.name.tag.localname.xml.plist',
           5 => 'punctuation.definition.tag.xml.plist'
      include "#xml_tags"
    end
    rule do
      # Array
      from %r/((<)((array))(>))/
      to %r'((</)((array))(>))'
      both 1 => 'meta.tag.array.xml.plist',
           2 => 'punctuation.definition.tag.xml.plist',
           3 => 'entity.name.tag.xml.plist',
           4 => 'entity.name.tag.localname.xml.plist',
           5 => 'punctuation.definition.tag.xml.plist'
      include "#xml_tags"
    end
    rule do
      # Strings
      content_scope "string.quoted.other.xml.plist"
      from %r/((<)((string))(>))/
      to %r'((</)((string))(>))'
      both 1 => 'meta.tag.string.xml.plist',
           2 => 'punctuation.definition.tag.xml.plist',
           3 => 'entity.name.tag.xml.plist',
           4 => 'entity.name.tag.localname.xml.plist',
           5 => 'punctuation.definition.tag.xml.plist'
      include "#xml_innertag"
      rule 'string.unquoted.cdata.xml' do
        from %r/<!\[CDATA\[/
        # FIXME: (warning) regular expression has ']' without escape
        to %r/]]>/
        both 0 => 'punctuation.definition.string.xml'
      end
    end
    rule do
      # Numeric
      from %r/((<)((real))(>))/
      to %r'((</)((real))(>))'
      both 1 => 'meta.tag.real.xml.plist',
           2 => 'punctuation.definition.tag.xml.plist',
           3 => 'entity.name.tag.xml.plist',
           4 => 'entity.name.tag.localname.xml.plist',
           5 => 'punctuation.definition.tag.xml.plist'
      rule do
        from %r/(<!\[CDATA\[)/
        # FIXME: (warning) regular expression has ']' without escape
        # FIXME: (warning) regular expression has ']' without escape
        to %r/(]]>)/
        both 0 => 'punctuation.definition.constant.xml',
             1 => 'constant.numeric.real.xml.plist'
        rule 'constant.numeric.real.xml.plist' do
          match %r/[-+]?\d+(\.\d*)?(E[-+]\d+)?/
        end
        rule 'invalid.illegal.not-a-number.xml.plist' do
          match %r/./
        end
      end
      rule 'constant.numeric.real.xml.plist' do
        match %r/[-+]?\d+(\.\d*)?(E[-+]\d+)?/
      end
      rule 'invalid.illegal.not-a-number.xml.plist' do
        match %r/./
      end
    end
    rule do
      # Integer
      from %r/((<)((integer))(>))/
      to %r'((</)((integer))(>))'
      both 1 => 'meta.tag.integer.xml.plist',
           2 => 'punctuation.definition.tag.xml.plist',
           3 => 'entity.name.tag.xml.plist',
           4 => 'entity.name.tag.localname.xml.plist',
           5 => 'punctuation.definition.tag.xml.plist'
      rule 'constant.numeric.integer.xml.plist' do
        match %r/[-+]?\d+/
      end
      rule 'invalid.illegal.not-a-number.xml.plist' do
        match %r/./
      end
    end
    rule do
      # Boolean
      match %r'((<)((true|false))\s*?(/>))',
        1 => 'meta.tag.boolean.xml.plist',
        2 => 'punctuation.definition.tag.xml.plist',
        3 => 'entity.name.tag.xml.plist',
        4 => 'entity.name.tag.localname.xml.plist',
        5 => 'punctuation.definition.tag.xml.plist'
    end
    rule do
      # Data
      from %r/((<)((data))(>))/
      to %r'((</)((data))(>))'
      both 1 => 'meta.tag.data.xml.plist',
           2 => 'punctuation.definition.tag.xml.plist',
           3 => 'entity.name.tag.xml.plist',
           4 => 'entity.name.tag.localname.xml.plist',
           5 => 'punctuation.definition.tag.xml.plist'
      rule 'constant.numeric.base64.xml.plist' do
        match %r'[A-Za-z0-9+/]'
      end
      rule 'constant.numeric.base64.xml.plist' do
        match %r/=/
      end
      rule 'invalid.illegal.invalid-character.xml.plist' do
        match %r/[^ \n\t]/
      end
    end
    rule do
      # Date
      from %r/((<)((date))(>))/
      to %r'((</)((date))(>))'
      both 1 => 'meta.tag.date.xml.plist',
           2 => 'punctuation.definition.tag.xml.plist',
           3 => 'entity.name.tag.xml.plist',
           4 => 'entity.name.tag.localname.xml.plist',
           5 => 'punctuation.definition.tag.xml.plist'
      rule 'constant.other.date.xml.plist' do
        match %r/(?x)
                    [0-9]{4}            # Year
                    -                # Divider
                    (0[1-9]|1[012])          # Month
                    -                # Divider
                    (?!00|3[2-9])[0-3][0-9]      # Day
                    T                # Separator
                    (?!2[5-9])[0-2][0-9]      # Hour
                    :                # Divider
                    [0-5][0-9]            # Minute
                    :                # Divider
                    (?!6[1-9])[0-6][0-9]      # Second
                    Z                # Zulu
                  /
      end
    end
    include "#xml_invalid"
    include "#xml_comment"
    include "#xml_stray-char"
  end
end
