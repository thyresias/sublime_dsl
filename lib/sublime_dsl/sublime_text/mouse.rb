# encoding: utf-8

module SublimeDSL
module SublimeText

  class Mouse

    def self.sublime
      @sublime ||= create_sublime_mouse
    end

    def self.create_sublime_mouse
      mouse = new('Sublime Text')
      (1..9).each { |i| mouse.add_button "button#{i}" }
      mouse.add_button "scroll_up"
      mouse.add_button "scroll_down"
      %w(shift ctrl alt super).each { |m| mouse.add_modifier m }
      mouse.modifiers.concat mouse.buttons
      mouse
    end

    attr_reader :name, :buttons, :modifiers

    def initialize(name)
      @name = name
      @buttons = []
      @modifiers = []
      @clicks = []
    end

    alias to_s name

    def clone(name)
      clone = Mouse.new(name)
      buttons.each { |b| clone.add_button b.st_name, b.name }
      (modifiers - buttons).each { |m| clone.add_modifier m.st_name, m.name }
      clone.modifiers.concat clone.buttons
      clone
    end

    def button(name)
      buttons.find { |b| b.name == name }
    end

    def modifier(name)
      modifiers.find { |b| b.name == name }
    end

    def add_button(st_name, name = nil)
      @buttons << Button.new(st_name, name)
    end

    def add_modifier(st_name, name = nil)
      @modifiers << Button.new(st_name, name)
    end

    def clicks_hash
      @clicks_hash ||= {}
    end

    def modifiers_index_hash
      @modifiers_index_hash ||= begin
        h = {}
        modifiers.each_with_index { |b,i| h[b.name] = i }
        h
      end
    end

    def ensure_click(spec)
      *modifier_names, button_name = spec.split('+')

      button = button(button_name) or
        raise Error, "invalid button #{button_name.inspect}"

      # check & reorder the modifiers
      unless modifier_names.empty?
        sorted = []
        modifier_names.each do |name|
          i = modifiers_index_hash[name]
          i or raise Error, "invalid modifier #{name.inspect}"
          sorted[i] = name
        end
        modifier_names = sorted.compact
      end

      # if there is a registered click for this spec, return it
      std_spec = [*modifier_names, button_name].join('+')
      click = clicks_hash[std_spec]
      return click if click

      # can't have the button in the modifiers
      modifier_names.include?(button_name) and
        raise Error, "can't have the button in the modifiers: #{spec.inspect}"

      # create and register the click
      modifiers = modifier_names.map { |n| modifier(n) }
      click = Click.new(modifiers, button)
      clicks_hash[click.to_spec] = click

      click
    end


    ##
    # A mouse button or modifier.

    class Button

      attr_reader :st_name
      attr_accessor :name

      def initialize(st_name, name)
        @st_name = st_name
        @name = name || st_name
      end

    end


    ##
    # A mouse click: button + modifiers.

    class Click

      attr_reader :button, :modifiers

      def initialize(modifiers, button)
        @modifiers = modifiers
        @button = button
      end

      def to_spec
        [*modifiers.map(&:name), button.name].join('+')
      end

      alias to_s to_spec

      def to_h
        h = { 'button' => button.st_name }
        h['modifiers'] = modifiers.map(&:st_name) unless modifiers.empty?
        h
      end

    end

  end

end
end
