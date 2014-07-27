# encoding: utf-8

module SublimeDSL
module TextMate
class Theme

  class DSLReader

    def initialize(file = nil)
      @themes = []
      @current_theme = nil
      instance_eval File.read(file, encoding: 'utf-8'), file if file
    end

    def _themes
      @themes
    end

    def method_missing(sym, *args, &block)
      raise Error, "'#{sym}' is not a valid Theme DSL statement"
    end

    def bold; 'bold' end
    def italic; 'italic' end
    def underline; 'underline' end

    def theme(name, options={}, &block)
      @current_theme and raise Error, "'theme' blocks cannot be nested"
      @current_theme = Theme.new(name)
      @current_theme.basename = options.delete(:file)
      options.empty? or warn "invalid options: #{options.inspect}"
      instance_eval(&block)
      @themes << @current_theme
      @current_theme = nil
    end

    def author(value)
      ensure_context __method__
      @current_theme.author = value
    end

    def uuid(value)
      ensure_context __method__
      @current_theme.uuid = value
    end

    def license(text)
      @current_theme.license = text
    end

    def base_colors(options = {})
      ensure_context __method__
      @current_theme.base_colors.merge! options
    end

    def item(name, scope, *attributes)
      ensure_context __method__
      item = Item.new(name, scope)
      attributes.each do |a|
        if a.is_a? Hash
          a.each_pair do |k, v|
            if k == :back
              item.background = v
            else
              raise Error, "invalid item option: #{k.inspect} => #{v.inspect}"
            end
          end
        elsif %w(bold italic underline).include?(a)
          item.send "#{a}=", true
        elsif a.start_with? '#'
          item.foreground = a
        else
          raise Error, "invalid item attribute: #{a.inspect}"
        end
      end
      @current_theme.add_item item
    end

    def ensure_context(name)
      @current_theme or raise Error, "#{name} is invalid outside a 'theme' block"
    end

  end

end
end
end
