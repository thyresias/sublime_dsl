# encoding: utf-8

preferences 'Folding (Regular Expressions)' => 'source.regexp.oniguruma', file: 'Folding - Regular Expressions' do
  folding_start_marker %r'(/\*|\{|\()'
  folding_stop_marker %r'(\*/|\}|\))'
  uuid "A856C6FA-D67B-44F1-9440-052F86CB66E8"
end

preferences 'Properties: Comments' => 'source.tm-properties', file: 'Properties Comments' do
  shell_variable 'TM_COMMENT_START', '# '
  uuid "AD495D39-E4CE-4790-8263-92851356C2F2"
end

preferences 'Properties: Completions' => 'source.tm-properties', file: 'Properties Completions' do
  completions %w(
    exclude excludeFiles excludeDirectories excludeInBrowser excludeInFolderSearch
    excludeInFileChooser excludeFilesInBrowser excludeDirectoriesInBrowser include
    includeFiles includeDirectories includeInBrowser includeInFileChooser
    includeFilesInBrowser includeDirectoriesInBrowser includeFilesInFileChooser
    projectDirectory windowTitle scopeAttributes theme fontName fontSize fileType
    binary showInvisibles tabSize softTabs spellChecking spellingLanguage
  )
  uuid "CE48C640-F525-4FFC-AADE-5EBB676D0705"
end

preferences 'Smart Typing Pairs (Regex Character Class)' => 'constant.other.character-class.set.regexp', file: 'Smart Pairs (Regex Character Class)' do
  smart_typing_pairs ""
  uuid "247A4984-203C-46ED-B973-82A7196A5C5C"
end

preferences 'Spell Checking: Disable for CamelCase Words' => 'meta.word.camel-case' do
  spell_checking false
  uuid "EAACA103-A5C9-4D33-BB23-BA908CB83F22"
end

preferences 'Style: Separator' => 'meta.separator' do
  background "#3467D1"
  foreground "#FFFFFF"
  uuid "DA3A550A-F4AF-4CFD-935F-8687FA17DC4B"
end
