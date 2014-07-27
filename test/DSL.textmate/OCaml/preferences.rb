# encoding: utf-8

preferences 'Indent rules' => 'source.ocaml' do
  decrease_indent_pattern %r/^\s*(end|done|with|in|else)\b|^\s*;;|^[^\("]*\)/
  increase_indent_pattern %r/^.*(\([^)"\n]*|begin)$|\bobject\s*$|\blet [a-zA-Z0-9_-]+( [^ ]+)+ =\s*$|method[ \t]+.*=[ \t]*$|->[ \t]*$|\b(for|while)[ \t]+.*[ \t]+do[ \t]*$|(\btry$|\bif\s+.*\sthen$|\belse|[:=]\s*sig|=\s*struct)\s*$/
  indent_next_line_pattern %r/(?!\bif.*then.*(else.*|(;|[ \t]in)[ \t]*$))\bif|\bthen[ \t]*$|\belse[ \t]*$$/
  uuid "AD257FE4-8F09-4FE6-A0C3-CD5E15F75C5D"
end

preferences 'Comments' => 'source.ocaml', file: 'Miscellaneous' do
  shell_variable 'TM_COMMENT_START', '(* '
  shell_variable 'TM_COMMENT_END', ' *)'
  uuid "4C99F5E7-F7D2-47A3-B232-C1E99C828F5D"
end

preferences 'Symbol List: Classes' => 'entity.name.type.class.ocaml' do
  show_in_symbol_list true
  symbol_transformation "s/^/class: /"
  uuid "72C6F9CD-7D1F-4956-8451-22F35339ABAB"
end

preferences 'Symbol List: Exceptions' => 'entity.name.type.exception.ocaml' do
  show_in_symbol_list true
  symbol_transformation "s/^/exception: /"
  uuid "5852E31D-A343-4FD5-953A-76996068C515"
end

preferences 'Symbol List: Ocamllex pattern definition' => 'entity.name.type.pattern.stupid-goddamn-hack.ocamllex' do
  show_in_symbol_list true
  symbol_transformation "s/^/pattern: /"
  uuid "52F126D8-181E-4A22-ABD4-831550FF28AD"
end

preferences 'Symbol List: Ocamllex pattern references' => 'entity.name.type.pattern.reference.stupid-goddamn-hack.ocamllex' do
  show_in_symbol_list false
  uuid "4CCB042A-DC5F-4D03-8BD5-96B91397A458"
end

preferences 'Symbol List: Ocamllex rules' => 'entity.name.function.entrypoint.ocamllex' do
  show_in_symbol_list true
  symbol_transformation "s/^/entrypoint: /"
  uuid "B13DEBC9-0853-42D6-882E-E38F213BD337"
end

preferences 'Symbol List: Ocamlyacc non-terminal definition' => 'entity.name.function.non-terminal.ocamlyacc' do
  show_in_symbol_list true
  symbol_transformation "s/^/non-terminal: /"
  uuid "2169BE86-FF3F-42AD-A396-82905FBF336A"
end

preferences 'Symbol List: Ocamlyacc non-terminal reference' => 'entity.name.function.non-terminal.reference.ocamlyacc' do
  show_in_symbol_list false
  uuid "AC8A21BC-AE1F-4213-AFC1-29EB62E72ABE"
end

preferences 'Symbol List: Ocamlyacc token definition' => 'entity.name.type.token.ocamlyacc' do
  show_in_symbol_list true
  symbol_transformation "s/^/token: /"
  uuid "018D26CA-0A0B-492A-B18D-25F518C7AE09"
end

preferences 'Symbol List: Ocamlyacc token reference' => 'entity.name.type.token.reference.ocamlyacc' do
  show_in_symbol_list false
  uuid "1CB2410B-4D16-48C6-96B8-D3580ECD280D"
end

preferences 'Symbol List: Types' => 'storage.type.user-defined.ocaml' do
  show_in_symbol_list true
  symbol_transformation "s/^/type: /"
  uuid "3605208D-9963-4F10-A4BC-C0EF15B84BCF"
end

preferences 'Symbol List: Variants' => 'entity.name.type.variant.ocaml | entity.name.type.variant.polymorphic.ocaml' do
  show_in_symbol_list false
  uuid "A40FC961-E731-454E-AEB3-0B7307EF17E0"
end

preferences 'Typing/highlight pairs' => 'source.ocaml', file: 'Typing pairs' do
  highlight_pairs "() [] {}"
  smart_typing_pairs "() [] {} \"\""
  uuid "1C41964E-2B51-400B-8010-A6F682FA57EE"
end
