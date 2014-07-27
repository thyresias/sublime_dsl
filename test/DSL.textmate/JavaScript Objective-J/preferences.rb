# encoding: utf-8

preferences 'Folding' => 'source.js.objj' do
  folding_start_marker %r'(?x)
     /\*\*(?!\*)
    |^(?![^{]*?//|[^{]*?/\*(?!.*?\*/.*?\{)).*?\{\s*($|//|/\*(?!.*?\*/.*\S))
    |^@(interface|protocol|implementation)\b
  '
  folding_stop_marker %r'(?<!\*)\*\*/|^\s*\}|^@end\b'
  uuid "BF6E43DC-58C2-4DFF-B963-571D51E9CC4D"
end
