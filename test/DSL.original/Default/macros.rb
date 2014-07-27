# encoding: utf-8

macro "Add Line" do
  move_to "hardeol"
  insert characters: "\n"
end

macro "Add Line Before" do
  move_to "hardbol"
  insert characters: "\n"
  move by: "lines", forward: false
  reindent force_indent: false
end

macro "Add Line in Braces" do
  insert characters: "\n\n"
  move by: "lines", forward: false
  move_to "hardeol", extend: false
  reindent single_line: true
end

macro "Delete Left Right" do
  left_delete
  right_delete
end

macro "Delete Line" do
  expand_selection to: "line"
  add_to_kill_ring forward: true
  left_delete
end

macro "Delete to BOL" do
  move_to "bol", extend: true
  add_to_kill_ring forward: false
  left_delete
end

macro "Delete to EOL" do
  move_to "eol", extend: true
  add_to_kill_ring forward: true
  right_delete
end

macro "Delete to Hard BOL" do
  move_to "hardbol", extend: true
  add_to_kill_ring forward: false
  left_delete
end

macro "Delete to Hard EOL" do
  move_to "hardeol", extend: true
  add_to_kill_ring forward: true
  right_delete
end
