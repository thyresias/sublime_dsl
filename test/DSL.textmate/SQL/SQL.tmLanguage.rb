# encoding: utf-8

language 'SQL' => 'source.sql' do
  file_types %w(sql ddl dml)
  key_equivalent "^~S"  # TextMate only
  uuid "C49120AC-6ECC-11D9-ACC8-000D93589AF6"  # TextMate only

  include "#comments"
  rule 'meta.create.sql' do
    match %r/(?i:^\s*(create(?:\s+or\s+replace)?)\s+(aggregate|conversion|database|domain|function|group|(unique\s+)?index|language|operator class|operator|rule|schema|sequence|table|tablespace|trigger|type|user|view)\s+)(['"`]?)(\w+)\4/,
      1 => 'keyword.other.create.sql',
      2 => 'keyword.other.sql',
      5 => 'entity.name.function.sql'
  end
  rule 'meta.drop.sql' do
    match %r/(?i:^\s*(drop)\s+(aggregate|conversion|database|domain|function|group|index|language|operator class|operator|rule|schema|sequence|table|tablespace|trigger|type|user|view))/,
      1 => 'keyword.other.create.sql',
      2 => 'keyword.other.sql'
  end
  rule 'meta.drop.sql' do
    match %r/(?i:\s*(drop)\s+(table)\s+(\w+)(\s+cascade)?\b)/,
      1 => 'keyword.other.create.sql',
      2 => 'keyword.other.table.sql',
      3 => 'entity.name.function.sql',
      4 => 'keyword.other.cascade.sql'
  end
  rule 'meta.alter.sql' do
    match %r/(?i:^\s*(alter)\s+(aggregate|conversion|database|domain|function|group|index|language|operator class|operator|rule|schema|sequence|table|tablespace|trigger|type|user|view)\s+)/,
      1 => 'keyword.other.create.sql',
      2 => 'keyword.other.table.sql'
  end
  rule do
    match %r/(?xi)

        # normal stuff, capture 1
         \b(bigint|bigserial|bit|boolean|box|bytea|cidr|circle|date|double\sprecision|inet|int|integer|line|lseg|macaddr|money|oid|path|point|polygon|real|serial|smallint|sysdate|text)\b

        # numeric suffix, capture 2 + 3i
        |\b(bit\svarying|character\s(?:varying)?|tinyint|var\schar|float|interval)\((\d+)\)

        # optional numeric suffix, capture 4 + 5i
        |\b(char|number|varchar\d?)\b(?:\((\d+)\))?

        # special case, capture 6 + 7i + 8i
        |\b(numeric|decimal)\b(?:\((\d+),(\d+)\))?

        # special case, captures 9, 10i, 11
        |\b(times)(?:\((\d+)\))(\swithoutstimeszone\b)?

        # special case, captures 12, 13, 14i, 15
        |\b(timestamp)(?:(s)\((\d+)\)(\swithoutstimeszone\b)?)?

      /,
      1 => 'storage.type.sql',
      2 => 'storage.type.sql',
      3 => 'constant.numeric.sql',
      4 => 'storage.type.sql',
      5 => 'constant.numeric.sql',
      6 => 'storage.type.sql',
      7 => 'constant.numeric.sql',
      8 => 'constant.numeric.sql',
      9 => 'storage.type.sql',
      10 => 'constant.numeric.sql',
      11 => 'storage.type.sql',
      12 => 'storage.type.sql',
      13 => 'storage.type.sql',
      14 => 'constant.numeric.sql',
      15 => 'storage.type.sql'
  end
  rule 'storage.modifier.sql' do
    match %r/(?i:\b((?:primary|foreign)\s+key|references|on\sdelete(\s+cascade)?|check|constraint)\b)/
  end
  rule 'constant.numeric.sql' do
    match %r/\b\d+\b/
  end
  rule 'keyword.other.DML.sql' do
    match %r/(?i:\b(select(\s+distinct)?|insert\s+(ignore\s+)?into|update|delete|from|set|where|group\sby|or|like|and|union(\s+all)?|having|order\sby|limit|(inner|cross)\s+join|join|straight_join|(left|right)(\s+outer)?\s+join|natural(\s+(left|right)(\s+outer)?)?\s+join)\b)/
  end
  rule 'keyword.other.DDL.create.II.sql' do
    match %r/(?i:\b(on|((is\s+)?not\s+)?null)\b)/
  end
  rule 'keyword.other.DML.II.sql' do
    match %r/(?i:\bvalues\b)/
  end
  rule 'keyword.other.LUW.sql' do
    match %r/(?i:\b(begin(\s+work)?|start\s+transaction|commit(\s+work)?|rollback(\s+work)?)\b)/
  end
  rule 'keyword.other.authorization.sql' do
    match %r/(?i:\b(grant(\swith\sgrant\soption)?|revoke)\b)/
  end
  rule 'keyword.other.data-integrity.sql' do
    match %r/(?i:\bin\b)/
  end
  rule 'keyword.other.object-comments.sql' do
    match %r/(?i:^\s*(comment\s+on\s+(table|column|aggregate|constraint|database|domain|function|index|operator|rule|schema|sequence|trigger|type|view))\s+.*?\s+(is)\s+)/
  end
  rule 'keyword.other.alias.sql' do
    match %r/(?i)\bAS\b/
  end
  rule 'keyword.other.order.sql' do
    match %r/(?i)\b(DESC|ASC)\b/
  end
  rule 'keyword.operator.star.sql' do
    match %r/\*/
  end
  rule 'keyword.operator.comparison.sql' do
    match %r/[!<>]?=|<>|<|>/
  end
  rule 'keyword.operator.math.sql' do
    match %r'-|\+|/'
  end
  rule 'keyword.operator.concatenator.sql' do
    match %r/\|\|/
  end
  rule 'support.function.scalar.sql' do
    # List of SQL99 built-in functions from http://www.oreilly.com/catalog/sqlnut/chapter/ch04.html
    match %r/(?i)\b(CURRENT_(DATE|TIME(STAMP)?|USER)|(SESSION|SYSTEM)_USER)\b/
  end
  rule 'support.function.aggregate.sql' do
    # List of SQL99 built-in functions from http://www.oreilly.com/catalog/sqlnut/chapter/ch04.html
    match %r/(?i)\b(AVG|COUNT|MIN|MAX|SUM)(?=\s*\()/
  end
  rule 'support.function.string.sql' do
    match %r/(?i)\b(CONCATENATE|CONVERT|LOWER|SUBSTRING|TRANSLATE|TRIM|UPPER)\b/
  end
  rule do
    match %r/(\w+?)\.(\w+)/,
      1 => 'constant.other.database-name.sql',
      2 => 'constant.other.table-name.sql'
  end
  include "#strings"
  include "#regexps"

  fragment :comments do
    rule do
      from %r/(^[ \t]+)?(?=--)/,
        1 => 'punctuation.whitespace.comment.leading.sql'
      to %r/(?!\G)/
      rule 'comment.line.double-dash.sql' do
        from %r/--/,
          0 => 'punctuation.definition.comment.sql'
        to %r/\n/
      end
    end
    rule do
      from %r/(^[ \t]+)?(?=#)/,
        1 => 'punctuation.whitespace.comment.leading.sql'
      to %r/(?!\G)/
      rule 'comment.line.number-sign.sql' do
        from %r/#/,
          0 => 'punctuation.definition.comment.sql'
        to %r/\n/
      end
    end
    rule 'comment.block.c' do
      from %r'/\*'
      to %r'\*/'
      both 0 => 'punctuation.definition.comment.sql'
    end
  end

  fragment :regexps do
    rule 'string.regexp.sql' do
      from %r'/(?=\S.*/)',
        0 => 'punctuation.definition.string.begin.sql'
      to %r'/',
        0 => 'punctuation.definition.string.end.sql'
      include "#string_interpolation"
      rule 'constant.character.escape.slash.sql' do
        match %r'\\/'
      end
    end
    rule 'string.regexp.modr.sql' do
      # We should probably handle nested bracket pairs!?! -- Allan
      from %r/%r\{/,
        0 => 'punctuation.definition.string.begin.sql'
      to %r/\}/,
        0 => 'punctuation.definition.string.end.sql'
      include "#string_interpolation"
    end
  end

  fragment :string_escape do
    rule 'constant.character.escape.sql' do
      match %r/\\./
    end
  end

  fragment :string_interpolation do
    rule 'string.interpolated.sql' do
      match %r/(#\{)([^\}]*)(\})/,
        1 => 'punctuation.definition.string.end.sql'
    end
  end

  fragment :strings do
    rule 'string.quoted.single.sql' do
      # this is faster than the next begin/end rule since sub-pattern will match till end-of-line and SQL files tend to have very long lines.
      match %r/(')[^'\\]*(')/,
        1 => 'punctuation.definition.string.begin.sql',
        3 => 'punctuation.definition.string.end.sql'
    end
    rule 'string.quoted.single.sql' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.sql'
      to %r/'/,
        0 => 'punctuation.definition.string.end.sql'
      include "#string_escape"
    end
    rule 'string.quoted.other.backtick.sql' do
      # this is faster than the next begin/end rule since sub-pattern will match till end-of-line and SQL files tend to have very long lines.
      match %r/(`)[^`\\]*(`)/,
        1 => 'punctuation.definition.string.begin.sql',
        3 => 'punctuation.definition.string.end.sql'
    end
    rule 'string.quoted.other.backtick.sql' do
      from %r/`/,
        0 => 'punctuation.definition.string.begin.sql'
      to %r/`/,
        0 => 'punctuation.definition.string.end.sql'
      include "#string_escape"
    end
    rule 'string.quoted.double.sql' do
      # this is faster than the next begin/end rule since sub-pattern will match till end-of-line and SQL files tend to have very long lines.
      match %r/(")[^"#]*(")/,
        1 => 'punctuation.definition.string.begin.sql',
        3 => 'punctuation.definition.string.end.sql'
    end
    rule 'string.quoted.double.sql' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.sql'
      to %r/"/,
        0 => 'punctuation.definition.string.end.sql'
      include "#string_interpolation"
    end
    rule 'string.other.quoted.brackets.sql' do
      from %r/%\{/,
        0 => 'punctuation.definition.string.begin.sql'
      to %r/\}/,
        0 => 'punctuation.definition.string.end.sql'
      include "#string_interpolation"
    end
  end
end
