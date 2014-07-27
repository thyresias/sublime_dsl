# encoding: utf-8

preferences 'Folding (CM)' => 'source.cm', file: 'Folding - CM' do
  folding_start_marker %r/\(\*/
  folding_stop_marker %r/\*\)/
  uuid "2312A5D1-8495-4851-B545-87C84AA39151"
end

preferences 'Folding (Standard ML)' => 'source.ml', file: 'Folding - Standard ML' do
  folding_start_marker %r/\(\*|\b(struct|sig)\b/
  folding_stop_marker %r/\*\)|\bend\b/
  uuid "66E76A0B-74F6-4E07-A24D-8E3635618EA9"
end

preferences 'Indentation Rules' => 'source.ml' do
  decrease_indent_pattern %r/^(?!(struct|sig))\s*(end|in)\b/
  increase_indent_pattern %r/(?x) .*\bsig\b(?!.*\bend\b)
              | .*\bstruct\b(?!.*\bend\b) 
              | .*\blet\b(?!.*\bin\b.*\bend\b)
              | \blocal\b(?!.*\bin\b.*\bend\b)
              | \bin\b(?!.*\bend\b)
              | .*\(case\b(?!\))
              | .*\bcase\b(?!(.*of.*=>.*))/
  indent_next_line_pattern %r/(?x) ^ .* : \s*(\(\* .* \*\))? \s* $
              | ^.*fun.*(?=\n\s*\|)
              | ^.*(?=\n\s*\|)/
  uuid "12572377-6CB1-45C3-8012-4E2918D182C5"
end

preferences 'Settings' => 'source.ml' do
  shell_variable 'TM_COMMENT_START', '(*'
  shell_variable 'TM_COMMENT_END', '*)'
  uuid "0B18DEFF-66E4-49B7-8D1F-9E6B7B9DB5AA"
end
