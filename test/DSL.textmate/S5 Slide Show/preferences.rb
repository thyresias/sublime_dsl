# encoding: utf-8

preferences 'Folding' => 'source.s5' do
  folding_start_marker %r'(?x)
    (<(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)\b.*?>
    |<!--(?!.*-->)
    |\{\s*($|\?>\s*$|//|/\*(.*\*/\s*$|(?!.*?\*/)))
    )'
  folding_stop_marker %r'(?x)
    (</(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)>
    |^\s*-->
    |(^|\s)\}
    )'
  uuid "55763113-D969-45FC-B7A6-21BF858A51B4"
end

preferences 'Handout Separator' => 'meta.separator.handout.s5' do
  background "#ffffff"
  foreground "#000000"
  uuid "A69219C5-84EE-4E27-9FF9-E18D49CF5B46"
end

preferences 'Notes Separator' => 'meta.separator.notes.s5' do
  background "#ffffff"
  foreground "#000000"
  uuid "6FD8D6A8-63B3-4DFA-BB8A-EE744EFC79AA"
end
