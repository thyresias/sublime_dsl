# encoding: utf-8

module SublimeDSL
module SublimeText

  ##
  # A keyboard.

  class Keyboard

    SUBLIME_MODIFIERS = %w(shift ctrl alt super)

    SUBLIME_KEYS = %w(
      escape f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15 f16 f17 f18 f19 f20 sysreq pause
      up down right left
      insert home end pageup pagedown backspace delete
      tab enter context_menu
      keypad0 keypad1 keypad2 keypad3 keypad4 keypad5 keypad6 keypad7 keypad8 keypad9
      keypad_period keypad_divide keypad_multiply keypad_minus keypad_plus keypad_enter
      clear break
      browser_back browser_forward browser_refresh browser_stop
      browser_search browser_favorites browser_home

      ` 0 1 2 3 4 5 6 7 8 9 - = +
      a b c d e f g h i j k l m n o p q r s t u v w x y z
      [ ] \\ ; ' , . /
      space
    )

    SUBLIME_ALIAS_MAP = {
      'forward_slash' => '/',
      'backquote' => '`',
      'equals' => '=',
      'plus' => '+',
      'minus' => '-'
    }

    SUBLIME_ALIAS_RE = /^(#{SUBLIME_ALIAS_MAP.keys.join('|')})$/

    @defining_sublime = false

    # The standard Sublime Text keyboard.
    def self.sublime
      @sublime ||= begin
        kb = Keyboard.new('Sublime Text')
        SUBLIME_MODIFIERS.each { |name| kb.add_modifier name }
        SUBLIME_KEYS.each { |name| kb.add_key name }
        # map_char and map_key call this method while @sublime is not yet set
        unless @defining_sublime
          @defining_sublime = true
          # FIXME: space => key_event nil, but generates a key_event when modified,
          # because it's a character
          # => put it in SUBLIME_ALIAS_MAP, but remember it was named 'space' when
          # generating its to_s ('ctrl+ ' will generate problems...)
          kb.map_char 'space' => ' ', key_event: nil
          @defining_sublime = false
        end
        kb
      end
    end

    def self.get(name, root)
      file = nil
      Dir.chdir(root) do
        files = Dir['**/*.keyboard.rb']
        file = SublimeText.order_config(files).last
        file or raise Error, "file '#{name}.keyboard.rb' not found"
        file = File.expand_path(file)
      end
      DSLReader.new(file)._keyboard
    end

    attr_reader :name, :os
    attr_reader :modifiers, :keys   # Key instances
    attr_reader :keystrokes_hash    # normalized spec => KeyStroke or CharStroke instance

    def initialize(name)
      @name = name
      @os = nil
      @modifiers = []
      @keys = []
      @keystrokes_hash = {}
      # Vintage generic character
      add_keystroke CharStroke.new('<character>')
    end

    def os=(value)
      case value.to_s.downcase
      when 'windows' then @os = 'Windows'
      when 'osx' then @os = 'OSX'
      when 'linux' then @os = 'Linux'
      else raise Error, "invalid OS value: #{value}"
      end
    end

    def modifier(name)
      modifiers.find { |k| k.name == name }
    end

    def key(name)
      keys.find { |k| k.name == name }
    end

    def add_modifier(name)
      m = Key.new(name)
      m.st_name = name if SUBLIME_MODIFIERS.include?(name)
      @modifiers << m
    end

    def map_modifier(name, st_name)
      m = modifier(name) or raise Error, "unknown modifier: '#{name}'"
      SUBLIME_MODIFIERS.include?(st_name) or raise Error, "invalid ST modifier: #{st_name}"
      m.st_name = st_name
    end

    # Create a Key +name+ and adds the corresponding KeyStroke to this keyboard.
    #
    # * If +name+ is one character long, the KeyStroke generates a chr_event +name+
    #   and no key_event.
    #
    # * Otherwise, the KeyStroke generates no chr_event, and a key_event +name+
    #   if +name+ is a Sublime Text key name.

    def add_key(name)
      k = Key.new(name)
      k.st_name = name if SUBLIME_KEYS.include?(name)
      @keys << k
      ks = KeyStroke.new([], k)
      if name.length == 1
        ks.chr_event = name
      else
        ks.key_event = k.st_name
      end
      add_keystroke ks

      k
    end

    # Assigns the key_event for the keystroke +spec+.
    # +st_spec+ must be a valid ST keystroke, or nil if
    # the keystroke is not seen by ST.

    def map_key(spec, st_spec)
      ks = ensure_keystroke(spec)
      if st_spec.nil?
        ks.key_event = nil
      else
        st_ks = Keyboard.sublime.ensure_keystroke(st_spec)
        st_spec = st_ks.to_spec
        if ks.modifiers.empty?
          ks.key.st_name = st_spec
          ks.key_event = st_spec if st_spec.length > 1
        else
          ks.key_event = st_spec
        end
      end
    end

    # Map a keystroke to a chr_event.
    # Optionally sets the key_event.
    def map_char(options = {})
      ks_name = options.keys.first
      ks = ensure_keystroke(ks_name)
      ks.chr_event = options[ks_name]
      if options.has_key?(:key_event)
        st_spec = options[:key_event]
        if st_spec
          st_ks = Keyboard.sublime.ensure_keystroke(st_spec)
          st_spec = st_ks.to_spec
        end
        ks.key_event = st_spec
      end
    end

    def add_keystroke(ks)
      @keystrokes_hash[ks.to_spec] = ks
    end

    def keystrokes
      keystrokes_hash.values
    end

    def keystroke_for_sublime_spec(st_spec)
      st_ks = Keyboard.sublime.ensure_keystroke(st_spec)
      st_spec = st_ks.to_spec   # standardize

      # return the first one with a key event = the passed spec
      this_ks = keystrokes.find { |ks| ks.key_event == st_spec }
      return this_ks if this_ks

      # if one char, no problem
      return ensure_keystroke(st_spec) if st_spec.length == 1 || st_spec == '<character>'

      # not (yet?) registered: find a keystroke with the same key
      base_ks = keystrokes.find { |ks| ks.key && ks.key.st_name == st_ks.key.name }
      if base_ks
        this_spec = st_ks.modifiers.map(&:name).join('+') << '+' << base_ks.key.name
        this_ks = ensure_keystroke(this_spec)
        return this_ks
      end

      NullStroke.new(st_spec)
    end

    # Returns a KeyStroke or CharStroke for +spec+, and adds it to
    # the registered keystrokes if not already there. Raises an
    # exception if +spec+ is not valid.
    #
    # * If +spec+ is one character long, returns a KeyStroke or CharStroke
    #   if found, otherwise creates a new CharStroke.
    #
    # * If +spec+ is more than one character long, the key has to exist,
    #   as well as the modifiers if any, otherwise an exception is raised.
    #   If the corresponding KeyStroke is not found, it will be created
    #   and registered.

    def ensure_keystroke(spec)

      # split the specification
      #   ctrl++ -> ['ctrl', '+']
      #   ctrl+num+ -> ['ctrl', 'num+']
      *modifier_names, key_name = spec.split(/\+(?!$)/)

      # normalize the key name
      self == Keyboard.sublime and
        key_name.sub! SUBLIME_ALIAS_RE, SUBLIME_ALIAS_MAP

      # check & reorder the modifiers
      unless modifier_names.empty?
        sorted = []
        modifier_names.each do |name|
          i = modifiers_index_hash[name] or
            raise Error, "invalid modifier #{name.inspect} for keyboard #{self.name}"
          sorted[i] = name
        end
        modifier_names = sorted.compact
      end

      # if there is a registered keystroke for this spec, return it
      std_spec = [*modifier_names, key_name].join('+')
      ks = keystrokes_hash[std_spec]
      return ks if ks

      # shift + character is not ok
      modifiers = modifier_names.map { |n| modifier(n) }
      modifiers.map(&:st_name) == ['shift'] && key_name.length == 1 and
        raise Error, "#{spec.to_source(true)} is invalid: specify the corresponding character"

      key = key(key_name)

      # The ST keyboard accepts any character as a valid key
      if self == Keyboard.sublime && key.nil?
        key_name.length == 1 or raise Error, "invalid key name in #{spec.to_source(true)}"
        key = add_key(key_name)
        return keystrokes_hash[key_name] if modifiers.empty?
      end

      if key
        # registered key
        ks = KeyStroke.new(modifiers, key)
        assign_default_key_event ks
      else
        # unregistered: has to be a character
        key_name.length == 1 or
          raise Error, "#{spec.inspect}: key #{key_name.inspect} is undefined"
        modifier_names.empty? or
          raise Error, "#{spec.inspect}: #{key_name.inspect} is not a key"
        ks = CharStroke.new(key_name)
      end

      add_keystroke ks

      ks
    end

    # Assign the default key_event of a new keystroke (before its registration).
    # It will be the modified key_event of a less specific keystroke.
    #
    # For instance, if we register 'shift+ctrl+keypad5', and 'shift+keypad5' has
    # key event 'clear', this assigns 'ctrl+clear'. If there are several
    # possibilities, the one(s) with the most modifiers are selected.
    # If there are ex-aequo, the order of precedence is the order of registration
    # of the modifiers.

    def assign_default_key_event(keystroke)

      # the ST keyboard: just register
      if self == Keyboard.sublime
        spec = keystroke.to_spec
        keystroke.key_event = spec if spec.length > 1
        return
      end

      # we always have modifiers, as all non-modified keys are already registered
      keystroke.modifiers.empty? and raise Error, "bug: #{keystroke} is not registered"

      # if the key has a ST name, assume the ST equivalent
      if keystroke.key.st_name
        spec = keystroke.modifiers.map(&:st_name).join('+') << '+' << keystroke.key.st_name
        keystroke.key_event = spec
        return
      end

      # the candidates are the registered keystrokes for that key with all
      # modifiers included in the passed modifiers (so at least the keystroke
      # for the key itself)
      candidates = keystrokes_hash.values.select do |ks|
        ks.key == keystroke.key &&
          ks.modifiers - keystroke.modifiers == []
      end
      candidates.empty? and raise Error, "bug: nothing registered for #{keystroke}"

      if candidates.length > 1

        # select the one(s) with the most modifiers
        max = 0
        candidates.each do |ks|
          max = ks.modifiers.length if ks.modifiers.length > max
        end
        candidates.reject! { |ks| ks.modifiers.length < max }

        # apply modifier priority:
        # create the bit mask for each keystroke,
        # and then select the lowest one
        if candidates.length > 1
          sort_array =
            candidates.map do |ks|
              mask = 0
              ks.modifiers.each do |m|
                mask += (1 << modifiers_index_hash[m.name])
              end
              [ks, mask]
            end
          candidates = sort_array.sort_by(&:last).map(&:first)
        end

      end

      # select the reference keystroke
      ref = candidates.first
      if ref.key_event.nil?
        keystroke.key_event = nil
        return
      end

      # apply the modifier delta versus the reference
      delta = keystroke.modifiers - ref.modifiers
      spec = delta.map(&:st_name).join('+') << '+' << ref.key_event
      keystroke.key_event = Keyboard.sublime.ensure_keystroke(spec).to_spec

    end

    def modifiers_index_hash
      @modifiers_index_hash ||= begin
        h = {}
        modifiers.each_with_index { |m, i| h[m.name] = i }
        h
      end
    end


    ##
    # A physical key or modifier on the keyboard.

    class Key

      attr_reader :name
      attr_accessor :st_name

      def initialize(name)
        @name = name
        @st_name = nil
      end

      def to_s
        name
      end

      def eql?(other)
        other.is_a?(Key) && other.name == self.name
      end

      alias == eql?

      def hash
        name.hash
      end

    end


    ##
    # A keystroke: modifiers + key.

    class KeyStroke

      attr_reader :key, :modifiers
      attr_accessor :key_event
      attr_accessor :chr_event
      attr_accessor :chr_dead
      attr_accessor :os_action

      def initialize(modifiers, key)
        @modifiers = modifiers
        @key = key
        @key_event = nil
        @chr_event = nil
        @chr_dead = false
        @os_action = nil
      end

      def type
        :key
      end

      def to_spec
        (modifiers.dup << key).map(&:to_s).join('+')
      end

      alias to_s to_spec

      def inspect
        s = "<#KeyStroke #{to_spec}"
        s << " key_event=#{key_event.inspect}"
        s << " chr_event=#{chr_event.inspect}"
        s << " dead=true" if chr_dead
        s << " os_action=#{os_action.inspect}" if os_action
        s
      end

      include Tools::ValueEquality

      def <=>(other)
        c = self.key <=> other.key
        c = self.modifiers <=> other.modifiers if c == 0
        c
      end

    end

    ##
    # A character: characters are supposed to be available on any keyboard.

    class CharStroke

      def initialize(char)
        @char = char
      end

      def type
        :char
      end

      def key
        nil
      end

      def modifiers
        []
      end

      def key_event
        nil
      end

      def chr_event
        @char
      end

      def chr_dead
        nil
      end

      def os_action
        nil
      end

      def to_spec
        @char
      end

      alias to_s to_spec

      def inspect
        "<#CharStroke char=#{@char}>"
      end

    end


    ##
    # A ST keystroke that has no equivalent on this keyboard.

    class NullStroke

      def initialize(st_spec)
        @key_event = st_spec
      end

      def type
        :null
      end

      def key
        nil
      end

      def modifiers
        []
      end

      def key_event
        @key_event
      end

      def chr_event
        nil
      end

      def chr_dead
        nil
      end

      def os_action
        nil
      end

      def to_spec
        nil
      end

      def inspect
        "<#NullStroke key_event=#{@key_event}>"
      end

    end


    class DSLReader

      attr_reader :_keyboard

      def initialize(file)
        @_keyboard = nil
        @in_definition = false
        instance_eval ::File.read(file, encoding: 'utf-8'), file
      end

      def method_missing(sym, *args, &block)
        raise Error, "'#{sym}' is not a keyboard DSL statement"
      end

      def keyboard(name)
        @_keyboard and raise Error, 'only one keyboard definition per file'
        @in_definition and raise Error, "'keyboard' blocks cannot be nested"
        @_keyboard = Keyboard.new(name)
        @in_definition = true
        yield self
        @in_definition = false
      end

      def os(value)
        ensure_context __method__
        _keyboard.os = value
      end

      def add_modifiers(spec)
        ensure_context __method__
        spec.split(/\s/).each { |name| _keyboard.add_modifier name }
      end

      def map_modifier(options={})
        ensure_context __method__
        name = options.keys.first
        name or raise Error, 'missing argument'
        st_name = options.delete(name)
        options.empty? or warn "extraneous arguments ignored: #{options.inspect}"
        _keyboard.map_modifier name, st_name
      end

      def add_keys(spec, options={})
        ensure_context __method__
        keys = parse_key_list(spec)

        st_spec = options.delete(:st_keys)
        if st_spec
          st_keys = parse_key_list(st_spec)
          keys.length == st_keys.length or
            raise Error, "st_keys: got #{st_keys.length} keys, expected #{keys.length}"
        end
        options.empty? or warn "extraneous arguments ignored: #{options.inspect}"

        keys.each_with_index do |name, i|
          _keyboard.add_key name
          if st_spec
            _keyboard.map_key name, st_keys[i]
          # done automatically when registering key events of new keystrokes:
          # elsif Keyboard.sublime.key(name)
          #   _keyboard.map_key name, name
          end
        end

      end

      def map_key(options={})
        ensure_context __method__
        name = options.keys.first
        name or raise Error, 'missing argument'
        st_name = options.delete(name)
        options.empty? or warn "extraneous arguments ignored: #{options.inspect}"
        _keyboard.map_key name, st_name
      end

      def map_char(options={})
        spec = options.keys.first
        spec or raise Error, 'missing argument'
        char = options.delete(spec)
        dead = options.delete(:dead)
        options.empty? or warn "extraneous arguments ignored: #{options.inspect}"
        char.length == 1 or raise Error, "map_dead: expected a character, got #{char.inspect}"
        ks = _keyboard.ensure_keystroke(spec)
        ks.chr_event = char
        ks.chr_dead = true if dead
      end

      def os_action(options={})
        spec = options.keys.first
        spec or raise Error, 'missing argument'
        action = options.delete(spec)
        key_event = options.delete(:key_event)
        options.empty? or warn "extraneous arguments ignored: #{options.inspect}"
        ks = _keyboard.ensure_keystroke(spec)
        ks.os_action = action
        ks.key_event = nil unless key_event
      end

    private

      def ensure_context(method)
        _keyboard or raise Error, "'#{method}' is invalid outside of a 'keyboard' block"
      end

      def parse_key_list(string)
        specs = string.split(/\s/)
        specs.flat_map do |spec|
          if spec =~ /^([a-z]*)(\d+)-\1(\d+)$/
            stem = $1
            start = $2.to_i
            stop = $3.to_i
            (start..stop).map { |i| "#{stem}#{i}" }
          else
            spec
          end
        end
      end

    end

  end

end
end
