# encoding: utf-8

module SublimeDSL
module SublimeText
class KeyMap

  ##
  # Keymap DSL interpreter.

  class DSLReader < Tools::BlankSlate

    attr_accessor :_file

    def initialize(file = nil)
      @keymaps = []
      @_file = file
      instance_eval File.read(file, encoding: 'utf-8'), file if file
    end

    def _keymaps
      @keymaps
    end

    def method_missing(sym, *args, &block)
      "invalid DSL statement: '#{sym}'"
    end

    def keymap(name, &block)
      reader = BindingReader.new(_file)
      reader.instance_eval(&block)
# unless reader._catchers_hash.empty?
#   reader._catchers_hash.each_pair { |i,c| p c }
# end
      map = KeyMap.new(name, reader._keyboard)
      map.bindings.concat reader._bindings
      @keymaps << map
    end

  end

  ##
  # Catches all method calls as MethodCatcher objects.

  class MethodCatcher < Tools::BlankSlate

    def initialize(object = nil, method = nil, args = nil)
      @object = object
      @method = method
      @args = args
    end

    # Returns a new MethodCatcher for +self+, +sym+ and +args+.
    def method_missing(sym, *args)
# puts "creating catcher: "
# puts "  object=#{self.inspect}"
# puts "  sym=#{sym.inspect}"
# puts "  args=#{args.inspect}"
      MethodCatcher.new(self, sym, args)
    end

    def _object; @object end
    def _method; @method end
    def _args; @args end

    def is_a?(klass)
      klass == MethodCatcher
    end

    def inspect
      "<#MethodCatcher object=#{@object.inspect} method=#{@method.inspect} args=#{@args.inspect}>"
    end

  end

  ##
  # DSL interpreter for bindings.

  class BindingReader < MethodCatcher

    def initialize(file)
      super(nil, nil, nil)
      @file = file
      @bindings = []
      @keyboard = Keyboard.sublime
      @conditionals = nil
      @catchers_hash = {}
    end

    def _bindings
      @bindings
    end

    def _keyboard
      @keyboard
    end

    def _catchers_hash
      @catchers_hash
    end

    def _conditionals
      @conditionals ||= { if: '_if', and: '_and', or: '_or' }
    end

    def method_missing(sym, *args)
      catcher = super(sym, *args)
      @catchers_hash[catcher.object_id] = catcher
      catcher
    end

    def keyboard(name)
      # FIXME: this is dirty
      # assumes the root is the directory above the one containing
      # the current file
      dir = File.dirname(@file)
      @keyboard = Keyboard.get(name, "#{dir}/..")
    end

    def conditionals(options = {})
      @conditionals = options.dup
      [:if, :and, :or].each do |key|
        method = options.delete(key) or raise Error, "no method name for #{key.inspect}"
        define_singleton_method method.to_sym, self.method("_#{key}".to_sym)
      end
      options.empty? or
        warn "unknown 'conditionals' arguments ignored: #{options.inspect}"
    end

    def bind(spec, arg, &block)
      ks = spec.split(/,\s+/).map { |s| @keyboard.ensure_keystroke(s) }
      cmd = get_command(arg)
      cmd.error and raise Error, "binding '#{spec}': #{cmd.error}"
      b = KeyBinding.new(ks, cmd)
      @bindings << b
    end

    def _if(*args, &block)
      b = @bindings.last or
        raise Error, "'#{_conditionals[:if]}' without a previous 'bind'"
      b.add_condition get_condition(args)
    end

    def _and(*args, &block)
      b = @bindings.last or
        raise Error, "'#{_conditionals[:and]}' without a previous '#{_conditionals[:if]}'"
      b.add_condition get_condition(args)
    end

    def _or(*args, &block)
      b = @bindings.last or
        raise Error, "'#{_conditionals[:or]}' without a previous '#{_conditionals[:if]}'"
      b = KeyBinding.new(b.keystrokes, b.command)
      @bindings << b
      b.add_condition get_condition(args)
    end

  private

    def get_command(arg)
      arg.is_a?(MethodCatcher) or
        return Command.new(nil, nil, "expected a sublime text command: #{arg.inspect}")
      consumed_catcher arg
      Command.from_method_missing(arg._method, arg._args)
    end

    def get_condition(args)
      args.map { |e| flatten_catchers(e) }.flatten.compact
    end

    def flatten_catchers(object)
      if object.is_a?(MethodCatcher)
        consumed_catcher object
        array = [
          flatten_catchers(object._object),
          flatten_catchers(object._method)
        ]
        if object._args && !object._args.empty?
            array.concat object._args.map { |a| flatten_catchers a }
        end
        array
      else
        object
      end
    end

    def consumed_catcher(c)
      @catchers_hash.delete c.object_id
    end

  end

end
end
end
