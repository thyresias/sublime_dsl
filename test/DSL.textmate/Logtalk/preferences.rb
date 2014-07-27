# encoding: utf-8

preferences 'Completions' => 'source.logtalk' do
  completions %w(
    if elif else endif encoding ensure_loaded include calls category dynamic
    end_category end_object end_protocol info initialization object protocol
    synchronized threaded uses alias discontiguous meta_predicate meta_non_terminal
    mode module multifile coinductive op private protected public use_module export
    reexport current_object current_protocol current_category object_property
    protocol_property category_property create_object create_protocol
    create_category abolish_object abolish_protocol abolish_category complements
    extends complements_object conforms_to_protocol extends_object extends_protocol
    extends_category implements implements_protocol imports imports_category
    instantiates instantiates_class specializes specializes_class abolish_events
    current_event define_events logtalk_load logtalk_compile logtalk_library_path
    logtalk_load_context current_logtalk_flag set_logtalk_flag threaded_call
    threaded_once threaded_ignore threaded_exit threaded_peek threaded_wait
    threaded_notify self this sender parameter before after phrase expand_term
    expand_goal goal_expansion term_expansion true fail call catch throw
    subsumes_term unify_with_occurs_check var atom integer float atomic callable
    compound nonvar number ground acyclic_term compare arg copy_term functor
    numbervars term_variables current_predicate predicate_property abolish assertz
    asserta clause retract retractall bagof findall forall setof current_input
    current_output set_input set_output open close flush_output stream_property
    at_end_of_stream set_stream_position get_char get_code peek_char peek_code
    put_char put_code nl get_byte peek_byte put_byte read read_term write writeq
    write_canonical atom_chars atom_codes atom_concat number_chars number_codes
    current_op char_conversion current_char_conversion ignore once repeat
    atom_length atom_concat sub_atom atom_chars atom_codes char_code number_chars
    number_codes set_prolog_flag current_prolog_flag halt keysort sort abs acos asin
    atan ceiling cos exp float_fractional_part float_integer_part floor log max min
    mod rem round sign sin sqrt truncate
  )
  uuid "73BD67B7-8673-4022-BF87-06C69F013847"
end

preferences 'Disable indent corrections' => 'source.logtalk' do
  disable_indent_corrections true
  uuid "BB7D9FF7-6CFA-4609-9146-A5E7714358EC"
end

preferences 'Symbol list: entities' => 'source.logtalk entity.name', file: 'Entity list' do
  show_in_symbol_list true
  symbol_transformation ""
  uuid "F7EA22E4-A54C-4BAB-8E65-F411A8B1107A"
end

preferences 'Folding' => 'source.logtalk' do
  folding_start_marker %r'(/\*|:-\s+(if|object|protocol|category)(?=[(]))'
  folding_stop_marker %r'(\*/|:-\s+(endif|end_(object|protocol|category))(?=[.]))'
  uuid "8B821B39-5F6B-4D3A-9A34-FD4302CACB28"
end

preferences 'Miscellaneous' => 'source.logtalk' do
  highlight_pairs "() {} []"
  increase_indent_pattern %r/(:-|-->)$/
  smart_typing_pairs "\"\" () {} [] ''"
  uuid "B25054C4-CAA1-4F80-9864-0F5E12B5E741"
end
