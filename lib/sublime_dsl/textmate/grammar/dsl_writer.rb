# encoding: utf-8

module SublimeDSL
module TextMate
class Grammar

  ##
  # Creates the DSL for a grammar.

  class DSLWriter

    attr_reader :grammar
    attr_reader :io

    def initialize(grammar)
      @grammar = grammar
      @io = StringIO.new('', 'wb:utf-8')
      output_grammar
    end

    def dsl
      io.string
    end

  private

    def output_grammar

      args = "#{grammar.name.to_source} => #{grammar.scope.to_source}"
      args << grammar.dsl_file_arg

      # grammar start
      io.puts "language #{args} do"
      indent = '  '

      # comment
      output_comment grammar.comment, indent

      # file types
      if grammar.file_types && !grammar.file_types.empty?
        if grammar.file_types.any? { |t| t =~ /\s/ }
          array = grammar.file_types.map { |t| "'" << t << "'" }.join(', ')
          io.puts indent + "file_types [#{array}]"
        else
          list = grammar.file_types.join(' ')
          if list.length <= 80
            io.puts indent + "file_types %w(#{list})"
          else
            io.puts indent + "file_types %w("
            io.puts list.wrap.indent(indent.length + 2)
            io.puts indent + ")"
          end
        end
      else
        io.puts indent + '# FIXME: no file types'
      end

      # regexps
      %w(firstLineMatch foldingStartMarker foldingStopMarker).each do |att|
        met = att.snake_case
        re = grammar.send(met)
        next unless re
        io.print re.fixme_comments(indent)
        io.puts indent + met + ' ' + re.inspect(true)
      end

      # TextMate stuff
      %w(keyEquivalent uuid bundleUUID).each do |att|
        met = att.snake_case
        str = grammar.send(met)
        next unless str
        io.puts indent + met + ' ' + str.inspect + '  # TextMate only'
      end

      # patterns
      io.puts
      output_array grammar.patterns, indent

      # repository
      grammar.fragments.each { |f| output_fragment f, indent }

      # grammar end
      io.puts 'end'

    end

    def output_object(object, indent)
      k = object.class.name.split('::').last.snake_case
      send "output_#{k}", object, indent
    end

    def output_array(list, indent)
      list.each { |o| output_object o, indent }
    end

    def output_fragment(f, indent)
      io.puts
      io.puts indent + '# FIXME: this fragment is never referenced' unless f.used
      io.puts "#{indent}fragment #{f.name.to_sym.inspect} do"
      i = indent + '  '
      output_comment f.comment, i
      output_array f.patterns, i
      io.puts indent + 'end'
    end

    def output_include(inc, indent)
      output_comment inc.comment, indent
      io.puts indent + 'include ' + inc.fragment_name.inspect
    end

    def output_no_match_rule(rule, indent)
      io.puts indent + '# FIXME: no "match" nor "begin/end"' unless !rule.patterns.empty? &&
        (rule.scope && rule.scope.start_with?('meta.') || !rule.disabled.nil?)
      output_rule_start rule, indent
      output_array rule.patterns, indent + '  '
      io.puts indent + 'end'
    end

    def output_match_rule(rule, indent)
      output_rule_start rule, indent
      output_match 'match', rule.match, indent + '  '
      io.puts indent + 'end'
    end

    def output_begin_end_rule(rule, indent)
      output_rule_start rule, indent
      i = indent + '  '
      io.puts i + 'content_scope ' + rule.content_scope.inspect if rule.content_scope
      output_match 'from', rule.from, i
      output_match 'to', rule.to, i
      unless rule.captures.empty?
        io.print i + 'both '
        output_captures rule.captures, i + '     '
      end
      output_boolean 'to_last', rule.to_last, i
      output_array rule.patterns, i
      io.puts indent + 'end'
    end

    def output_rule_start(rule, indent)
      io.puts indent + (rule.scope ? "rule '#{rule.scope}' do" : 'rule do')
      indent += '  '
      output_comment rule.comment, indent
      output_boolean 'disabled', rule.disabled, indent
    end

    def output_match(name, match, indent)
      io.print match.regexp.fixme_comments(indent)
      io.print indent + name + ' ' + match.regexp.inspect(true)
      if match.captures.empty?
        io.puts
      else
        io.print ",\n" << indent + '  '
        output_captures match.captures, indent + '  '
      end
    end

    def output_captures(captures, indent)
      lines = []
      captures.each_pair do |number, scope|
        lines << number.to_s + " => '" + scope + "'"
      end
      io.puts lines.join(",\n" + indent)
    end

    def output_boolean(name, value, indent)
      io.puts indent + name + ' ' + (value.to_i == 0 ? 'false' : 'true') if value
    end

    def output_comment(text, indent)
      text and text.each_line { |l| io.puts indent + ('# ' + l).rstrip }
    end

  end

end
end
end
