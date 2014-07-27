# encoding: utf-8

preferences 'Typing Pairs: Block Opening' => 'keyword.control.start-block.ruby, meta.syntax.ruby.start-block', file: 'Block typing pairs' do
  smart_typing_pairs "\"\" () {} [] “” ||"
  uuid "6D75102B-6E51-4360-8F12-BE12327B6AE6"
end

preferences 'Comments' => 'source.ruby' do
  shell_variable 'TM_COMMENT_START', '# '
  shell_variable 'TM_COMMENT_START_2', '=begin
'
  shell_variable 'TM_COMMENT_END_2', '=end
'
  uuid "1D26F26C-C6F7-434F-84F8-FEE895372E8A"
end

preferences 'Completion: ENV[…] variables' => 'meta.environment-variable.ruby string.quoted' do
  completion_command 'env|grep "^$TM_CURRENT_WORD"|sort|cut -d= -f1'
  uuid "1A7701FA-D866-498C-AD4C-7846538DB535"
end

preferences 'Completion: require strings' => 'meta.require.ruby string.quoted' do
  completion_command <<-'TXT'
    #!/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby
    		ptrn = /^#{Regexp.escape ENV["TM_CURRENT_WORD"].to_s}[^.]+\..+/
    		puts( $LOAD_PATH.inject([]) do |res, path|
    		res << Dir.new(path).grep(ptrn) { |file| file[/^[^.]+/] } if File.exists?(path)
    		res
    		end.sort.uniq )
  TXT
  uuid "AEDD6A5F-417F-4177-8589-B07518ACA9DE"
end

preferences 'ERb: Disable Indent Corrections' => 'meta.embedded.line.erb' do
  disable_indent_corrections true
  uuid "DF7E649B-5464-424C-A480-F7A130E0E075"
end

preferences 'Folding (ERB)' => 'text.html.erb', file: 'Folding - ERB' do
  folding_start_marker %r'(?x)
    (<(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)\b.*?>
    |<!--(?!.*-->)
    |\{\s*($|\?>\s*$|//|/\*(.*\*/\s*$|(?!.*?\*/)))
    )'
  folding_stop_marker %r'(?x)
    (</(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)>
    |^\s*-->
    |(^|\s)\}
    )'
  uuid "EA050E4E-1658-4AA6-BE90-9D4638823A10"
end

preferences 'Folding (Ruby)' => 'source.ruby -string.unquoted.heredoc', file: 'Folding' do
  # FIXME: (warning) character class has duplicated range
  folding_start_marker %r:(?x)^
      (\s*+
          (module|class|def(?!.*\bend\s*$)
          |unless|if
          |case
          |begin
          |for|while|until
           |^=begin
          |(  "(\\.|[^"])*+"          # eat a double quoted string
           | '(\\.|[^'])*+'        # eat a single quoted string
           |   [^#"']                # eat all but comments and strings
           )*
           (                        \s   (do|begin|case)
           | (?<!\$)[-+=&|*/~%^<>~] \s*+ (if|unless)
           )
          )\b
          (?! [^;]*+ ; .*? \bend\b )
      |(  "(\\.|[^"])*+"              # eat a double quoted string
       | '(\\.|[^'])*+'            # eat a single quoted string
       |   [^#"']                    # eat all but comments and strings
       )*
       ( \{ (?!  [^}]*+ \} )
       | \[ (?! [^\]]*+ \] )
       )
      ).*$
  |   [#] .*? \(fold\) \s*+ $         # Sune’s special marker
  :
  folding_stop_marker %r/(?x)
    (   (^|;) \s*+ end   \s*+ ([#].*)? $
    |   (^|;) \s*+ end \. .* $
    |   ^     \s*+ [}\]] ,? \s*+ ([#].*)? $
    |   [#] .*? \(end\) \s*+ $      # Sune’s special marker
    |   ^=end
    )
  /
  uuid "494CBF95-0A56-41B9-BD5A-FC3EEEF28172"
end

preferences 'Indent' => 'source.ruby', file: 'Miscellaneous' do
  decrease_indent_pattern %r/^\s*([}\]](,?\s*(#|$)|\.[a-zA-Z_]\w*\b)|(end|rescue|ensure|else|elsif|when)\b)/
  # FIXME: (warning) character class has duplicated range
  increase_indent_pattern %r:(?x)^
    (\s*
        (module|class|def
        |unless|if|else|elsif
        |case|when
        |begin|rescue|ensure
        |for|while|until
        |(?= .*? \b(do|begin|case|if|unless)\b )
         # the look-ahead above is to quickly discard non-candidates
         (  "(\\.|[^\\"])*+"        # eat a double quoted string
         | '(\\.|[^\\'])*+'      # eat a single quoted string
         |   [^#"']                # eat all but comments and strings
         )*
         (                         \s   (do|begin|case)
         | [-+=&|*/~%^<>~](?<!\$.) \s*+ (if|unless)
         )
        )\b
        (?! [^;]*+ ; .*? \bend\b )
    |(  "(\\.|[^\\"])*+"            # eat a double quoted string
     | '(\\.|[^\\'])*+'          # eat a single quoted string
     |   [^#"']                    # eat all but comments and strings
     )*
     ( \{ (?!  [^}]*+ \} )
     | \[ (?! [^\]]*+ \] )
     )
    ).*$:
  uuid "6FEAF60F-F0F3-4618-9259-DE93285F50D1"
end

preferences 'Symbol List: Method' => 'source.ruby meta.function', file: 'Symbo List˸ Method' do
  show_in_symbol_list true
  symbol_transformation 's/^\s*def\s+/ /'
  uuid "92E190C9-A861-4025-92D4-D6B5A24C22D4"
end

preferences 'Symbol List: No Function Call' => 'source.ruby meta.function-call entity.name.function' do
  show_in_symbol_list false
  uuid "A5D50494-EB97-48DE-A2BE-322DF52A7A7A"
end
