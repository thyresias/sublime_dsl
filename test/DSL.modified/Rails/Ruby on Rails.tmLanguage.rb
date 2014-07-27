# encoding: utf-8

language 'Ruby on Rails' => 'source.ruby.rails' do
  file_types %w(rxml builder)
  folding_start_marker %r:(?x)^
      (\s*+
          (module|class|def
          |unless|if
          |case
          |begin
          |for|while|until
          |(  "(\\.|[^"])*+"          # eat a double quoted string
           | '(\\.|[^'])*+'        # eat a single quoted string
           |   [^#"']                # eat all but comments and strings
           )*
           (                \s   (do|begin|case)
           | [-+=&|*/~%^<>] \s*+ (if|unless)
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
    |   ^     \s*+ [}\]] \s*+ ([#].*)? $
    |   [#] .*? \(end\) \s*+ $    # Sune’s special marker
    )/
  key_equivalent "^~R"  # TextMate only
  uuid "54D6E91E-8F31-11D9-90C5-0011242E4184"  # TextMate only

  rule 'meta.rails.functional_test' do
    # Uses lookahead to match classes with the ControllerTest suffix; includes 'source.ruby' to avoid infinite recursion
    from %r/(^\s*)(?=class\s+(([.a-zA-Z0-9_:]+ControllerTest(\s*<\s*[.a-zA-Z0-9_:]+)?)))/
    to %r/^§1(?=end)\b/
    include "source.ruby"
    include "$self"
  end
  rule 'meta.rails.controller' do
    # Uses lookahead to match classes with the Controller suffix; includes 'source.ruby' to avoid infinite recursion
    from %r/(^\s*)(?=class\s+(([.a-zA-Z0-9_:]+Controller\b(\s*<\s*[.a-zA-Z0-9_:]+)?)|(<<\s*[.a-zA-Z0-9_:]+)))(?!.+\bend\b)/
    to %r/^§1(?=end)\b/
    include "source.ruby"
    include "$self"
  end
  rule 'meta.rails.helper' do
    # Uses lookahead to match modules with the Helper suffix; includes 'source.ruby' to avoid infinite recursion
    from %r/(^\s*)(?=module\s+((([A-Z]\w*::)*)[A-Z]\w*)Helper)/
    to %r/^§1(?=end)\b/
    include "source.ruby"
    include "$self"
  end
  rule 'meta.rails.mailer' do
    # Uses lookahead to match classes that inherit from ActionMailer::Base; includes 'source.ruby' to avoid infinite recursion
    from %r/(^\s*)(?=class\s+(([.a-zA-Z0-9_:]+(\s*<\s*ActionMailer::Base))))/
    to %r/^§1(?=end)\b/
    include "source.ruby"
    include "$self"
  end
  rule 'meta.rails.model' do
    # Uses lookahead to match classes that (may) inherit from ActiveRecord::Base; includes 'source.ruby' to avoid infinite recursion
    from %r/(^\s*)(?=class\s+.+ActiveRecord::Base)/
    to %r/^§1(?=end)\b/
    include "source.ruby"
    include "$self"
  end
  rule 'meta.rails.migration' do
    # Uses lookahead to match classes that (may) inherit from ActiveRecord::Migration; includes 'source.ruby' to avoid infinite recursion
    from %r/(^\s*)(?=class\s+.+ActiveRecord::Migration)/
    to %r/^§1(?=end)\b/
    rule do
      # Uses lookahead to match methods change_table; includes 'source.ruby' to avoid infinite recursion
      content_scope "meta.rails.migration.change_table"
      from %r/(^\s*)(?=change_table)\b/
      to %r/^§1(?=end)\b/
      include "source.ruby"
      include "$self"
    end
    rule do
      # Uses lookahead to match methods create_table; includes 'source.ruby' to avoid infinite recursion
      content_scope "meta.rails.migration.create_table"
      from %r/(^\s*)(?=create_table)\b/
      to %r/^§1(?=end)\b/
      include "source.ruby"
      include "$self"
    end
    include "source.ruby"
    include "$self"
  end
  rule 'meta.rails.unit_test' do
    # Uses lookahead to match classes with the Test suffix; includes 'source.ruby' to avoid infinite recursion
    from %r/(^\s*)(?=class\s+(?![.a-zA-Z0-9_:]+ControllerTest)(([.a-zA-Z0-9_:]+Test(\s*<\s*[.a-zA-Z0-9_:]+)?)|(<<\s*[.a-zA-Z0-9_:]+)))/
    to %r/^§1(?=end)\b/
    include "source.ruby"
    include "$self"
  end
  rule 'meta.rails.routes' do
    # Uses ActionController::Routing::Routes to determine it is a routes file; includes 'source.ruby' to avoid infinite recursion
    from %r/(^\s*)ActionController::Routing::Routes/
    to %r/^§1(?=end)\b/
    include "source.ruby"
    include "$self"
  end
  rule 'support.function.actionpack.rails' do
    match %r/\b(before_filter|skip_before_filter|skip_after_filter|after_filter|around_filter|filter|filter_parameter_logging|layout|require_dependency|render|render_action|render_text|render_file|render_template|render_nothing|render_component|render_without_layout|rescue_from|url_for|redirect_to|redirect_to_path|redirect_to_url|respond_to|helper|helper_method|model|service|observer|serialize|scaffold|verify|hide_action)\b/
  end
  rule 'support.function.activerecord.rails' do
    match %r/\b(named_scope|after_create|after_destroy|after_save|after_update|after_validation|after_validation_on_create|after_validation_on_update|before_create|before_destroy|before_save|before_update|before_validation|before_validation_on_create|before_validation_on_update|composed_of|belongs_to|has_one|has_many|has_and_belongs_to_many|validate|validate_on_create|validates_numericality_of|validate_on_update|validates_acceptance_of|validates_associated|validates_confirmation_of|validates_each|validates_format_of|validates_inclusion_of|validates_exclusion_of|validates_length_of|validates_presence_of|validates_size_of|validates_uniqueness_of|attr_protected|attr_accessible|attr_readonly)\b/
  end
  rule 'support.function.activesupport.rails' do
    match %r/\b(alias_method_chain|alias_attribute|delegate|cattr_accessor|mattr_accessor|returning)\b/
  end
  include "source.ruby"
end
