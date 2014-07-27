# encoding: utf-8

preferences 'Folding' => 'source.plist.textmate', file: 'Folding - TextMate Plist' do
  folding_start_marker %r/^\s*([a-zA-Z_-]+ = )?[{(](?!.*[)}][;,]?\s*$)/
  folding_stop_marker %r/^\s*(\}|\))/
  uuid "5293C37D-4728-42F5-8219-B900CED6E358"
end

preferences 'Symbol List (Repository Item Scopes)' => 'source.plist.textmate.grammar meta.value-pair.repository-item constant.other.scope - meta.dictionary.captures', file: 'Symbol List (Repository item scopes)' do
  show_in_symbol_list true
  symbol_transformation "s/^(punctuation.*$)?/    /;"
  uuid "46D63D96-FBDA-4E36-B088-018D6B672FFB"
end

preferences 'Symbol List (Repository Items)' => 'source.plist.textmate.grammar meta.dictionary.repository entity.name.section.repository', file: 'Symbol List (Repository items)' do
  show_in_symbol_list true
  symbol_transformation 's/^/#/;				# start with "#"'
  uuid "6F3A4873-C006-471C-BC7E-7EF289C685B4"
end

preferences 'Symbol List (Repository Separator)' => 'source.plist.textmate.grammar support.constant.repository' do
  show_in_symbol_list true
  symbol_transformation 's/^repository$/-/;				# repository = separator'
  uuid "1515233D-64A7-48B3-A032-895A2A2E9789"
end

preferences 'Symbol List' => 'source.plist.textmate.grammar constant.other.scope - (meta.dictionary.repository|meta.value-pair.scopename)' do
  show_in_symbol_list true
  symbol_transformation "s/^punctuation.*$//;"
  uuid "985E70CD-0539-4E00-B0B9-F38D9789B8F3"
end
