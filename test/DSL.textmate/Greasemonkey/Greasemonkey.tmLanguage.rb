# encoding: utf-8

language 'Greasemonkey' => 'source.js.greasemonkey' do
  file_types %w(user.js)
  first_line_match %r'// ==UserScript=='
  key_equivalent "^~G"  # TextMate only
  uuid "B57ED36B-65DD-492A-82D7-E6C80253BAAB"  # TextMate only

  rule 'support.class.greasemonkey' do
    match %r/\bunsafeWindow\b/
  end
  rule 'support.function.greasemonkey' do
    match %r/\bGM_(registerMenuCommand|xmlhttpRequest|setValue|getValue|log|openInTab|addStyle)\b(?=\()/
  end
  rule 'meta.header.greasemonkey' do
    from %r'// ==UserScript=='
    to %r'// ==/UserScript==\s*'
    rule 'meta.directive.standard.greasemonkey' do
      match %r'// (@(name|namespace|description|include|exclude))\b\s*(.+\s+)?',
        1 => 'keyword.other.greasemonkey',
        3 => 'string.unquoted.greasemonkey'
    end
    rule 'meta.directive.nonstandard.greasemonkey' do
      match %r'// (@(\S+))\b\s*(.+\s+)?',
        1 => 'keyword.other.greasemonkey',
        3 => 'string.unquoted.greasemonkey'
    end
  end
  include "source.js"
end
