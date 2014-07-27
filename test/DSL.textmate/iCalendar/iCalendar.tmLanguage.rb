# encoding: utf-8

language 'iCalendar' => 'source.icalendar' do
  file_types %w(ics ifb)
  key_equivalent "^~I"  # TextMate only
  uuid "16771FA0-6B1D-11D9-A369-000D93589AF6"  # TextMate only

  rule 'keyword.other.component-begin.icalendar' do
    match %r/^BEGIN:(.*)/,
      1 => 'entity.name.section.icalendar'
  end
  rule 'keyword.other.component-end.icalendar' do
    match %r/^END:(.*)/,
      1 => 'entity.name.section.icalendar'
  end
  rule 'variable.other.property.icalendar' do
    match %r/^([A-Z\-\;0-9\=]+):/
  end
  rule 'constant.datetime.icalendar' do
    match %r/\b(\d){8}(T\d{6}(Z)?)?/
  end
  rule 'constant.numeric.icalendar' do
    match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)(L|l|UL|ul|u|U|F|f)?\b/
  end
  rule 'string.quoted.double.icalendar' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.icalendar'
    to %r/"/,
      0 => 'punctuation.definition.string.end.icalendar'
  end
end
