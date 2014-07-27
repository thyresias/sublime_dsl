# encoding: utf-8

preferences "Folding" => "source.nemerle" do
  # FIXME: (error) end pattern with unmatched parenthesis
  folding_start_marker %r/(\{|\(|<\[)/
  # FIXME: (error) unmatched close parenthesis
  folding_stop_marker %r/(\}|\)|]>)/
  uuid "F160D45A-6040-4428-AD8C-B2979C23453B"
end
