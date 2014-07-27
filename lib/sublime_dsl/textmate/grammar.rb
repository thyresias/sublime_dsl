# encoding: utf-8

require_relative 'grammar/plist_reader'
require_relative 'grammar/dsl_writer'
require_relative 'grammar/dsl_reader'
require_relative 'grammar/plist_writer'

module SublimeDSL
module TextMate

  ##
  # A language grammar.

  class Grammar

    # Create from a PList file.
    def self.import(file)
      PListReader.new(file).grammar
    end

    include CustomBaseName

    attr_accessor :name
    attr_accessor :scope
    attr_accessor :file_types
    attr_accessor :comment
    attr_accessor :first_line_match
    attr_accessor :folding_start_marker
    attr_accessor :folding_stop_marker

    # TextMate only
    attr_accessor :key_equivalent
    attr_accessor :uuid
    attr_accessor :bundle_uuid

    # content
    attr_accessor :patterns
    attr_accessor :fragments

    def initialize(name, scope)

      @name = name
      @scope = scope

      @file_types = nil
      @first_line_match = nil
      @folding_start = nil
      @folding_stop = nil

      @key_equivalent = nil
      @uuid = nil

      @patterns = []
      @fragments = []

    end

    alias to_s name

    def complete!
      @repos = fragments.keyed_by(&:name)
      resolve_includes self
      fragments.each { |f| resolve_includes f }
    end

    def resolve_includes(parent)
      parent.patterns.each do |o|
        if o.respond_to? :patterns
          resolve_includes o
        elsif o.is_a?(Include) && o.fragment_name.start_with?('#')
          name = o.fragment_name[1..-1]
          o.fragment = @repos[name]
          if o.fragment
            o.fragment.used = true
          else
            warn "grammar #{self.name}: no such fragment: #{o.fragment_name.inspect}"
          end
        end
      end
    end

    def write(dir)
      file = "#{dir}/#{basename}.tmLanguage.rb"
      File.open(file, 'wb:utf-8') do |f|
        f.puts '# encoding: utf-8'
        f.puts "\n" << DSLWriter.new(self).dsl
      end
    end

    def export(dir)
      file = "#{dir}/#{basename}.tmLanguage"
      PListWriter.new(self).export(file)
    end

    ##
    # A repository item.

    class Fragment
      attr_reader :name
      attr_accessor :comment
      attr_accessor :patterns
      attr_accessor :used
      def initialize(name)
        @name = name
        @comment = nil
        @patterns = []
        @used = nil
      end
    end

    ##
    # An included fragment.

    class Include
      attr_reader :fragment_name
      attr_accessor :fragment
      attr_accessor :comment
      def initialize(fragment_name)
        @fragment_name = fragment_name
      end
    end

    ##
    # An abstract rule.

    class Rule
      attr_accessor :scope
      attr_accessor :comment
      attr_accessor :disabled
      def complete!(grammar) end
    end

    ##
    # A 'match' rule.

    class MatchRule < Rule
      attr_accessor :match  # Match object
    end

    ##
    # A 'begin/end' rule.

    class BeginEndRule < Rule

      attr_accessor :content_scope
      attr_accessor :from   # Match object
      attr_accessor :to     # Match object
      attr_accessor :to_last
      attr_reader   :captures   # common captures, a hash { number => scope }
      attr_accessor :patterns

      def initialize
        @patterns = []
        @captures = {}
      end

      def complete!(grammar)
        captures.each_pair do |index, scope|
          fscope = from.captures[index]
          tscope = to.captures[index]
          if fscope
            if tscope == fscope
              if fscope == scope
                # from scope == to scope == common scope => just keep common
                from.captures.delete(index)
                to.captures.delete(index)
              else
                # from scope == to scope != common scope => set common = from/to
                warn "grammar #{grammar}: 'both' capture #{index} => #{scope.inspect} replaced by 'from/to' capture #{index} => #{fscope.inspect}"
                captures[index] = fscope
                from.captures.delete index
                to.captures.delete index
              end
            elsif tscope.nil?
              if fscope == scope
                # from scope == common scope, no 'to' scope => just keep common
                from.captures.delete(index)
              else
                # from scope != common scope, no 'to' scope => common become 'to'
                warn "grammar #{grammar}: 'both' capture #{index} => #{scope.inspect} moved to 'to' ('from' has #{index} => #{fscope.inspect})"
                add_capture captures.delete(index), index, to.captures
              end
            else
              # from scope != to scope => ignore common
              warn "grammar #{grammar}: 'both' capture #{index} => #{scope.inspect} ignored: 'from' and 'to' already given"
              captures.delete(index)
            end
          elsif tscope.nil?
            # both fscope & tscope nil: ok
          else
            if tscope == scope
              # to scope == common scope, no 'from' scope => just keep common
              to.captures.delete(index)
            else
              # to scope != common scope, no 'from' scope => common become 'from'
              warn "grammar #{grammar}: 'both' capture #{index} => #{scope.inspect} moved to 'from' ('to' has #{index} => #{tscope.inspect})"
              add_capture captures.delete(index), index, from.captures
            end
          end
        end
        if !from.captures.empty? && from.captures == to.captures
          captures.merge! from.captures
          from.captures.clear
          to.captures.clear
        end
      end

      def add_capture(scope, index, captures)
        captures[index] = scope
        h = {}
        captures.keys.sort.each do |i|
          h[i] = captures[i]
        end
        captures.clear
        captures.merge! h
      end

    end

    ##
    # A rule without 'match' nor 'begin'

    class NoMatchRule < Rule

      attr_accessor :patterns

      def initialize
        @patterns = []
      end

      def empty?
        scope.nil? && patterns.empty?
      end

    end

    ##
    # A regexp with its captures.

    class Match
      attr_reader :regexp
      attr_reader :captures   # hash { number => scope }
      def initialize(regexp)
        @regexp = regexp
        @captures = {}
      end
    end

  end

end
end
