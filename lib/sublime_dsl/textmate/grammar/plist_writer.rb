# encoding: utf-8

module SublimeDSL
module TextMate
class Grammar

  ##
  # Creates the PList for a grammar.

  class PListWriter

    attr_reader :grammar
    attr_reader :root

    def initialize(grammar)
      @grammar = grammar
      @root = {}
      convert_grammar
    end

    def export(file)
      PList.export(root, file)
    end

  private

    def convert_grammar

      root['name'] = grammar.name
      root['scopeName'] = grammar.scope

      %w(fileTypes firstLineMatch foldingStartMarker foldingStopMarker keyEquivalent uuid bundleUUID).each do |att|
        root[att] = convert_object(grammar.send(att.snake_case))
      end

      root['patterns'] = convert_array(grammar.patterns)

      frags = {}
      grammar.fragments.each { |f| frags[f.name] = convert_fragment(f) }
      root['repository'] = frags

      cleanup_hash root

    end

    def convert_object(object)
      k = object.class.name.split('::').last.snake_case
      send "convert_#{k}", object
    end

    def convert_array(list)
      list.map { |o| convert_object o }
    end

    def convert_fragment(f)
      unless f.used
        warn "grammar '#{grammar.name}': fragment '#{f.name}' never used, not output"
        return nil
      end
      a = convert_array(f.patterns)
      a.length > 1 ? { 'patterns' => a } : a.first
    end

    def convert_include(inc)
      { 'include' => inc.fragment_name }
    end

    def convert_no_match_rule(rule)
      return nil if rule.empty?
      h = convert_rule_start(rule)
      h['patterns'] = convert_array(rule.patterns)
      h
    end

    def convert_match_rule(rule)
      h = convert_rule_start(rule)
      h.merge! convert_match(rule.match, 'match', 'captures')
    end

    def convert_begin_end_rule(rule)
      h = convert_rule_start(rule)
      h['contentName'] = rule.content_scope
      h.merge! convert_match(rule.from, 'begin', 'beginCaptures')
      h.merge! convert_match(rule.to, 'end', 'endCaptures')
      h.merge! convert_captures('captures', rule.captures)
      h['applyEndPatternLast'] = convert_object(rule.to_last)
      h['patterns'] = convert_array(rule.patterns)
      h
    end

    def convert_rule_start(rule)
      { 'name' => rule.scope, 'disabled' => convert_object(rule.disabled) }
    end

    def convert_match(match, regexp_key, captures_key)
      { regexp_key => convert_regexp_wannabe(match.regexp) }
        .merge convert_captures(captures_key, match.captures)
    end

    def convert_regexp_wannabe(re)
      re.to_s
    end

    def convert_captures(captures_key, captures)
      h = {}
      return h if captures.empty?
      captures.each_pair do |number, scope|
        h[number.to_s] = { 'name' => scope }
      end
      { captures_key => h }
    end

    def convert_string(v); v; end;
    def convert_nil_class(v); v; end
    def convert_true_class(v); 1; end
    def convert_false_class(v); 0; end

    def cleanup_object(o)
      case o
      when Array; cleanup_array o
      when Hash; cleanup_hash o
      end
    end

    def cleanup_array(list)
      list.each { |o| cleanup_object o }
      list.reject! { |o| empty(o) }
    end

    def cleanup_hash(h)
      h.keys.each do |key|
        value = h[key]
        cleanup_object value
        if empty(value)
          # HACK: an empty 'begin' or 'end' matches anything (used by C & Tcl grammars)
          if key != 'end' && key != 'begin'
            h.delete key
          else
            h[key] = ''
          end
        end
      end
    end

    def empty(o)
      o.nil? || o.respond_to?(:empty?) && o.empty?
    end

  end

end
end
end
