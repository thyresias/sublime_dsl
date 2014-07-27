# encoding: utf-8

preferences 'Markup: Quoted Text' => 'markup.quote', file: 'Markup; Quoted Text' do
  font_name "Gill Sans"
  uuid "451229CD-4BB8-4452-9CAD-F6FDDC2DEAE5"
end

preferences 'Markup: Raw' => 'markup.raw.block', file: 'Markup; Raw' do
  font_name "Courier"
  uuid "0C1646D2-09E9-44E9-B9A3-0B1008D27A54"
end

preferences 'Markup: Heading 1' => 'markup.heading.1' do
  font_name "Baskerville"
  font_size "2.25em"
  uuid "871BD5CF-C391-48FA-B4B8-DE47B9F5CF98"
end

preferences 'Markup: Heading 2' => 'markup.heading.2' do
  font_name "Baskerville"
  font_size "2.1em"
  uuid "C31F7239-A39F-4A86-BD88-6FB1369ABF3F"
end

preferences 'Markup: Heading 3' => 'markup.heading.3' do
  font_name "Baskerville"
  font_size "1.85em"
  uuid "C512E524-5455-4840-893C-822C39C949EA"
end

preferences 'Markup: Heading 4' => 'markup.heading.4' do
  font_name "Baskerville"
  font_size "1.6em"
  uuid "C0127CB1-BE5B-4235-8242-2FA6E6B3A7AF"
end

preferences 'Markup: Heading 5' => 'markup.heading.5' do
  font_name "Baskerville"
  font_size "1.35em"
  uuid "D4807696-6978-469B-AB3F-482D01C91D4C"
end

preferences 'Markup: Heading 6' => 'markup.heading.6' do
  font_name "Baskerville"
  font_size "1.1em"
  uuid "F671DCFB-45A3-4B37-BD5B-FD7F8D12B35F"
end

# FIXME: no scope
preferences 'Theme Path' => nil do
  shell_variable 'TM_THEME_PATH', '${TM_THEME_PATH:+$TM_THEME_PATH:}$TM_BUNDLE_SUPPORT/web-themes'
  uuid "6CE23013-E624-4A0B-9F0A-972D459010EE"
end

preferences 'Unprintable' => 'deco.unprintable' do
  background "#00000011"
  font_name "Menlo"
  font_size 12
  foreground "#AAAAAA"
  uuid "20881CB9-5D12-4D74-8EE6-9ABAA7B408D3"
end
