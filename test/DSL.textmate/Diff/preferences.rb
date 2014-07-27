# encoding: utf-8

preferences 'Folding Patterns' => 'source.diff' do
  folding_indented_block_ignore %r/^[-+!<> ]/
  folding_indented_block_start %r/^(@@ |\d+[acd]\d+|diff )/
  uuid "9B46F71B-3813-4F2E-AD9C-D4C6FAAFC169"
end

preferences 'Style: Changed' => 'markup.changed', file: 'Markup style˸ Changed' do
  background "#F5C411"
  foreground "#FFFFFF"
  uuid "EB0FD215-C2EE-4576-86FD-ABA3EDCB5A7B"
end

preferences 'Style: Deleted' => 'markup.deleted', file: 'Markup style˸ Deleted' do
  background "#FF3D3D"
  foreground "#FFFFFF"
  uuid "FFF345C5-D3B4-4975-A610-69CC645FEE7C"
end

preferences 'Style: Index' => 'meta.diff.index', file: 'Markup style˸ Diff metadata' do
  background "#3467D1"
  font_style "italic"
  foreground "#FFFFFF"
  uuid "F9C2B477-B6F7-4951-953B-32BFEF121F7C"
end

preferences 'Style: Header' => 'meta.diff.header', file: 'Markup style˸ Header' do
  background "#5685E3"
  foreground "#FFFFFF"
  uuid "ED5636AE-09EF-46C4-A4F8-B88F701763E2"
end

preferences 'Style: Inserted' => 'markup.inserted', file: 'Markup style˸ Inserted' do
  background "#73FF65"
  foreground "#000000"
  uuid "7D036841-43BD-49CA-892F-0A6837EF8FB7"
end

preferences 'Style: Range' => 'meta.diff.range', file: 'Markup style˸ Range' do
  background "#3467D1"
  font_style "italic"
  foreground "#FFFFFF"
  uuid "71A420A8-0892-4622-BDA4-CC00D98C59E6"
end

preferences 'Symbol List: Indent Ranges' => 'source.diff meta.diff.range' do
  # Insert (figure space) padding
  # 		so that “+nnn,n” becomes “+ nnn, n”
  symbol_transformation <<-'TXT'
    s/[-+](\d)(\d)?(\d)?(\d)?,/(?4:: (?3:: (?2:: )))$0/g;
    s/,(\d)\b/, $1/g;
    s/^/ /;
  TXT
  uuid "A0B3B6D2-59B1-407F-B310-7FA67222B37A"
end
