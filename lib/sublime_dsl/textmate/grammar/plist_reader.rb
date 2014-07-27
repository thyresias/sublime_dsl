# encoding: utf-8

module SublimeDSL
module TextMate
class Grammar

  ##
  # Creates a Grammar from a PList.

  class PListReader

    attr_reader :grammar

    def initialize(file)
      @grammar = Grammar.new(nil, nil)
      read_plist PList.import(file)
      @grammar.basename = File.basename(file, File.extname(file))
      @grammar.complete!
    end

  private

    def read_plist(root)

      grammar.name = root.delete('name')
      grammar.scope = root.delete('scopeName')

      root.each_pair do |key, value|
        case key
        when 'comment'
          grammar.comment = cleanup(value)
        when 'fileTypes'
          grammar.file_types = value  # an array of strings
        when *%w(foldingStartMarker foldingStopMarker firstLineMatch)
          grammar.send key.snake_case + '=', regexp(value)
        when *%w(keyEquivalent bundleUUID uuid)
          grammar.send key.snake_case + '=', value
        when 'patterns'
          grammar.patterns = patterns(value, grammar)  # an array
        when 'repository'
          value.each_pair do |name, content|
            f = Fragment.new(name)
            f.patterns = scan(content, f)
            f.patterns = [f.patterns] unless f.patterns.is_a? Array
            grammar.fragments << f
          end
        when 'injections'
          warn "grammar #{grammar}: #{key.inspect} is not supported"
        else
          warn "unknown key in grammar #{grammar}: #{key.inspect}"
        end
      end

    end

    def patterns(list, parent)
      list.map { |v| scan v, parent }.flatten
    end

    def scan(value, parent)
      value.is_a?(Hash) or raise Error, "expected a Hash: #{value.inspect}"
      hash = value.dup
      comment = cleanup(hash.delete('comment'))

      if (inc = hash['include'])
        hash.length == 1 or raise Error, "include: too many keys: #{value.inspect}"
        inc = Include.new(inc)
        inc.comment = comment
        return inc
      end

      # do not create a rule that just contains patterns: return the patterns instead
      if hash.length == 1 && hash['patterns']
        if comment
          parent.comment and raise Error, 'comment conflict'
          parent.comment = comment
        end
        return patterns(hash['patterns'], parent)
      end

      if (match = hash.delete('match'))
        rule = MatchRule.new
        caps = hash.delete('captures')
        if hash['beginCaptures']
          caps and raise Error, "both 'beginCaptures' and 'captures': " << value.inspect
          warn "grammar '#{grammar}': 'beginCaptures' understood as 'captures'" \
               " in 'match' rule: " << value.inspect
          caps = hash.delete('beginCaptures')
        end
        rule.match = create_match(match, caps)
      elsif hash['begin'] || hash['end']
        rule = BeginEndRule.new
        rule.content_scope = hash.delete('contentName')
        bcap = hash.delete('beginCaptures')
        ecap = hash.delete('endCaptures')
        caps = hash.delete('captures')
        assign_captures rule, caps if caps
        beg_re = hash.delete('begin')
        unless beg_re
          warn "no 'begin' for rule with 'end' in grammar #{grammar}"
          beg_re = ''
        end
        end_re = hash.delete('end')
        unless end_re
          warn "no 'end' for rule with 'begin' in grammar #{grammar}"
          end_re = ''
        end
        rule.from = create_match(beg_re, bcap)
        rule.to = create_match(end_re, ecap, rule.from.regexp)
        rule.to_last = hash.delete('applyEndPatternLast')
      else
        warn "grammar #{grammar}: no 'begin' nor 'match': " << hash.inspect
        rule = NoMatchRule.new
      end

      rule.scope = hash.delete('name')
      rule.comment = comment
      rule.disabled = hash.delete('disabled')
      rule.patterns = patterns(hash.delete('patterns'), rule) if hash['patterns']
      hash.length == 0 or warn "invalid rule keys in grammar #{grammar}: #{hash.inspect}"

      rule.complete!(grammar)

      rule
    end

    def create_match(re, captures, backref = nil)
      m = Match.new(regexp(re, backref))
      assign_captures m, captures if captures
      m
    end

    # Assign the PList +captures+ to +object+ (a Match or a BeginEndRule).
    def assign_captures(object, captures)
      # get the captures, making sure the keys are in ascending order
      cap = []
      captures.each_pair do |k,v|
        name = v['name']
        if name.nil?
          warn "invalid capture in grammar #{grammar}: #{v.inspect}"
          next
        elsif v.length > 1
          warn "extra capture ignored in grammar #{grammar}: #{v.inspect}"
        end
        cap[k.to_i] = name unless name.empty?
      end
      cap.each_with_index { |name, index| object.captures[index] = name if name }
    end

    # Replaces tabs by 2 spaces & dedents.
    def cleanup(text)
      text && text.gsub("\t", '  ').dedent
    end

    def regexp(str, backref = nil)
      Tools::RegexpWannabe.new(str, backref)
    end

  end

end
end
end
