# encoding: utf-8

module SublimeDSL
module TextMate
class Grammar

  class DSLReader

    def initialize(file = nil)
      @grammars = []
      @context_stack = []
      instance_eval File.read(file, encoding: 'utf-8'), file if file
    end

    def _grammars
      @grammars
    end

    def _context
      @context_stack.last
    end

    def _grammar
      @context_stack.first
    end

    def method_missing(sym, *args, &block)
      raise Error, "'#{sym}' is not a valid grammar DSL statement"
    end

    def language(options = {}, &block)
      _context and raise Error, "'language' blocks cannot be nested"
      base = options.delete(:file)
      options.length == 0 and raise Error, 'missing name & scope'
      name = options.keys.first
      scope = options.delete(name)
      options.empty? or warn "invalid options: #{options.inspect}"
      g = Grammar.new(name, scope)
      g.basename = base
      @context_stack.push g
      instance_eval(&block)
      @context_stack.pop
      g.complete!
      @grammars << g
    end

    def file_types(array)
      ensure_writer
      _grammar.file_types = array
    end

    def first_line_match(re)
      ensure_writer
      _grammar.first_line_match = Tools::RegexpWannabe.new(re.source)
    end

    def folding_start_marker(re)
      ensure_writer
      _grammar.folding_start_marker = Tools::RegexpWannabe.new(re.source)
    end

    def folding_stop_marker(re)
      ensure_writer
      _grammar.folding_stop_marker = Tools::RegexpWannabe.new(re.source)
    end

    def key_equivalent(str)
      ensure_writer
      _grammar.key_equivalent = str
    end

    def uuid(str)
      ensure_writer
      _grammar.uuid = str
    end

    def bundle_uuid(str)
      ensure_writer
      _grammar.bundle_uuid = str
    end

    def include(name_or_module)
      if name_or_module.is_a?(Module)
        self.class.send :include, name_or_module
      else
        ensure_reader :patterns
        _context.patterns << Include.new(name_or_module)
      end
    end

    def fragment(name)
      ensure_reader :fragments
      f = Fragment.new(name.to_s)   # FIXME pas la peine de sortir des :sym pour faire du to_s!
      _grammar.fragments << f
      @context_stack.push f
      yield self # block.call
      @context_stack.pop
    end

    def rule(scope = nil)
      ensure_reader :patterns
      b = RuleBuilder.new(scope)
      @context_stack.push b
      yield self # block.call
      @context_stack.pop
      b.rule.complete! _grammar
      _context.patterns << b.rule
    end

    def match(re, captures = {})
      ensure_reader
      _context.match re, captures
    end

    def from(re, captures = {})
      ensure_reader
      _context.from re, captures
    end

    def to(re, captures = {})
      ensure_reader
      _context.to re, captures
    end

    def both(captures)
      ensure_reader
      _context.both captures
    end

    def content_scope(scope)
      ensure_writer
      _context.content_scope = scope
    end

    def to_last(value)
      ensure_writer
      _context.to_last = value
    end

    def disabled(value)
      ensure_writer
      _context.disabled = value
    end

    def ensure_reader(method = nil)
      name = caller[0].gsub(/.*`(.*)'$/, '\1')
      method ||= name
      _context.respond_to? method or raise invalid_context(name)
    end

    def ensure_writer(method = nil)
      name = caller[0].gsub(/.*`(.*)'$/, '\1')
      method ||= name + '='
      _context.respond_to? method or raise invalid_context(name)
    end

    def invalid_context(name)
      if _context
        c = _context.class.name.split('::').last.snake_case
        c = 'rule' if c == 'rule_builder'
        "#{name} is invalid inside '#{c}'"
      else
        "#{name} is invalid outside 'language'"
      end
    end

  end

  class RuleBuilder

    attr_accessor :state

    def initialize(scope)
      @state = State.new(self)
      @state.scope = scope
    end

    def disabled=(value)
      state.disabled = value
    end

    def match(re, captures)
      state.match re, captures
    end

    def from(re, captures)
      state.from re, captures
    end

    def to(re, captures)
      state.to re, captures
    end

    def both(captures)
      state.both captures
    end

    def content_scope=(scope)
      state.content_scope = scope
    end

    def to_last=(value)
      state.to_last = value
    end

    def patterns
      state.patterns
    end

    def rule
      state.rule
    end

    class State

      attr_accessor :builder
      attr_accessor :scope, :comment, :disabled

      def initialize(builder)
        @scope = @comment = @disabled = nil
        @builder = builder
        @patterns = []
      end

      def match(re, captures)
        @patterns.empty? or raise Error, "a 'match' rule cannot contain 'include' or 'rule'"
        s = state_for(MatchState)
        s.match re, captures
      end

      def from(re, captures)
        s = state_for(BeginEndState)
        s.from re, captures
      end

      def to(re, captures)
        s = state_for(BeginEndState)
        s.to re, captures
      end

      def both(captures)
        s = state_for(BeginEndState)
        s.both captures
      end

      def content_scope=(scope)
        s = state_for(BeginEndState)
        s.content_scope = scope
      end

      def to_last=(value)
        s = state_for(BeginEndState)
        s.to_last = value
      end

      def patterns
        @patterns
      end

      def rule
        r = NoMatchRule.new
        init r
        r.patterns.concat @patterns
        r
      end

    private

      def state_for(klass)
        s = klass.new(builder)
        s.scope = scope
        s.comment = comment
        s.disabled = disabled
        s.patterns.concat @patterns unless @patterns.empty?
        @builder.state = s
      end

      def init(rule)
        rule.scope = @scope
        rule.comment = @comment
        rule.disabled = @disabled
      end

    end

    class MatchState < State

      def match(re, captures)
        @match = Match.new(Tools::RegexpWannabe.new(re.source))
        @match.captures.merge! captures
      end

      def from(re, captures)
        raise Error, "'from' is invalid with 'match'"
      end

      def to(re, captures)
        raise Error, "'to' is invalid with 'match'"
      end

      def both(captures)
        raise Error, "'both' is invalid with 'match'"
      end

      def content_scope=(scope)
        raise Error, "'content_scope' is invalid with 'match'"
      end

      def to_last=(value)
        raise Error, "'to_last' is invalid with 'match'"
      end

      def patterns
        raise Error, "'patterns' is invalid with 'match'"
      end

      def rule
        r = MatchRule.new
        init r
        r.match = @match
        r
      end

    end

    class BeginEndState < State

      def initialize(builder)
        super builder
        @from = @to = nil
        @both = {}
        @content_scope = nil
        @to_last = nil
      end

      def match(re, captures)
        raise Error, "'match' is invalid with 'from' or 'to'"
      end

      def from(re, captures)
        @from and raise Error, "'from' called twice"
        @from = Match.new(Tools::RegexpWannabe.new(re.source))
        @from.captures.merge! captures
      end

      def to(re, captures)
        @to and raise Error, "'to' called twice"
        @to = Match.new(Tools::RegexpWannabe.new(re.source, @from))
        @to.captures.merge! captures
      end

      def both(captures)
        @both.empty? or raise Error, "'both' already specified"
        @both.merge! captures
      end

      def content_scope=(scope)
        @content_scope = scope
      end

      def to_last=(value)
        @to_last = value
      end

      def rule
        r = BeginEndRule.new
        init r
        r.content_scope = @content_scope
        r.from = @from
        r.to = @to
        r.to_last = @to_last
        r.captures.merge! @both
        r.patterns.concat @patterns
        r
      end

    end

  end

end
end
end
