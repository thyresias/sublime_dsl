# encoding: utf-8

preferences 'Folding' => 'source.icalendar' do
  folding_start_marker %r/^BEGIN:/
  folding_stop_marker %r/^END:/
  uuid "510E987A-C066-41B6-B3AC-5D819C183E9A"
end

preferences 'Symbol List: Exclude' => 'entity.name.section.icalendar' do
  show_in_symbol_list false
  uuid "23B0F3B2-9A6F-4547-8D73-5B8D9F78645A"
end
