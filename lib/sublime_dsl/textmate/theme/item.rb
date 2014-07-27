# encoding: utf-8

module SublimeDSL
module TextMate
class Theme

  class Item

    attr_reader :name, :scope
    attr_reader :background, :foreground
    attr_accessor :bold, :italic, :underline

    def initialize(name, scope)
      @name = name.nil? || name.empty? ? nil : name
      @scope = scope.nil? || scope.empty? ? nil : scope.strip.gsub(/\s+/m, ' ')
      @background = nil
      @foreground = nil
      @bold = nil
      @italic = nil
      @underline = nil
    end

    def background=(color)
      @background = color && color.upcase
    end

    def foreground=(color)
      @foreground = color && color.upcase
    end

    def font_style
      style = []
      %w(bold italic underline).each { |a| style << a if self.send(a) }
      style.empty? ? nil : style.join(' ')
    end

    def font_style=(string)
      string.split(/\s+/).each do |attr|
        case attr
        when 'bold' then @bold = true
        when 'italic' then @italic = true
        when 'underline' then @underline = true
        else raise Error, "unknown font_style: #{attr.inspect}"
        end
      end
    end

    def colors
      [background, foreground].compact
    end

    def to_dsl(colors_hash)
      scope_arg = scope.to_s.length > 70 ? '<<-SCOPE' : scope.to_s.to_source
      dsl = ''
      dsl << "# FIXME: no name:\n" unless name
      dsl << "# FIXME: no scope:\n" unless scope
      dsl << "item #{name.to_s.to_source}, #{scope_arg}"
      dsl << ", #{colors_hash[foreground]}" if foreground
      dsl << ", bold" if bold
      dsl << ", italic" if italic
      dsl << ", underline" if underline
      dsl << ", back: #{colors_hash[background]}" if background
      if scope_arg == '<<-SCOPE'
        dsl << "\n" << scope.wrap.indent(2)
        dsl << "\nSCOPE"
      end
      dsl
    end

  end

end
end
end