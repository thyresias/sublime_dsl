# encoding: utf-8

preferences 'Completions: Cocoa' => 'source.objc, source.objc++', file: 'Cocoa completions' do
  completions %w(
    retain release autorelease description stringWithFormat:
    componentsSeparatedByString: componentsJoinedByString: isEqualToString:
    UTF8String lastPathComponent pathExtension stringByAbbreviatingWithTildeInPath
    stringByAppendingPathComponent: stringByAppendingPathExtension:
    stringByDeletingLastPathComponent stringByDeletingPathExtension
    stringByExpandingTildeInPath stringByResolvingSymlinksInPath
    stringByStandardizingPath valueForKey: valueForKeyPath: setValue: forKey:
    forKeyPath: NSArray NSDictionary NSMutableArray NSMutableDictionary
    NSMutableString NSString
  )
  uuid "512175CE-933E-4312-BBF2-D744700CB4CA"
end

preferences 'Folding' => 'source.objc++, source.objc' do
  folding_start_marker %r'(?x)
     /\*\*(?!\*)
    |^(?![^{]*?//|[^{]*?/\*(?!.*?\*/.*?\{)).*?\{\s*($|//|/\*(?!.*?\*/.*\S))
    |^@(interface|protocol|implementation)\b (?!.*;)
    '
  folding_stop_marker %r'(?<!\*)\*\*/|^\s*\}|^@end\b'
  uuid "1366A19B-083A-4DB1-BD93-3FD9104B5028"
end

preferences 'Highlight Pairs: Protocol Specifiers' => 'meta.protocol-list.objc | meta.inherited-protocol.end.objc | meta.return-type.objc | meta.argument-type.objc' do
  highlight_pairs "<> ()"
  uuid "0D675D9D-B93C-400D-B8D6-C9888F7FAAE4"
end

preferences 'Symbol List: Method' => 'meta.function.objc', file: 'Symbol List' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/^([-+])\s*\(.*?\)\s*/ $1 /; # strip result type
    s/:\s*\(.*?\)\s*\w+\s*/:/g;   # strip argument variables
    s/\s*;?$//g;                  # strip terminating ws + semi-colon
  TXT
  uuid "ADFCD53A-3CC4-4C31-88C4-BB607684951A"
end

preferences 'Typing Pairs: Protocol Specifier' => '(meta.interface-or-protocol.objc | meta.return-type.objc | meta.argument-type.objc) - meta.protocol-list.objc' do
  smart_typing_pairs "<> ()"
  uuid "C41409C1-97FD-4326-A8E9-7BF89ED6BEAF"
end
