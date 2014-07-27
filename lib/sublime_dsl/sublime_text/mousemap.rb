# encoding: utf-8

module SublimeDSL
module SublimeText

  class MouseMap

    def self.import(file)
      name = File.basename(file, File.extname(file))
      map = new(name)
      list = JSON[File.read(file, encoding: 'utf-8')]
      begin
        map.bindings.concat list.map { |h| MouseBinding.from_json(h) }
      rescue => ex
        puts "file: #{file}"
        raise ex
      end

      map
    end

    attr_reader :name, :bindings

    def initialize(name)
      @name = name
      @bindings = []
    end

    def write(dir)
      file = "#{dir}/#{name}.mousemap.rb"
      File.open(file, 'wb') do |f|
        f.puts "\nmousemap #{name.to_source} do"
        f.puts
        bindings.each do |b|
          begin
            f.puts '  ' << b.to_dsl
          rescue => ex
            puts "file: #{file}\nbinding: #{b.click}"
            raise ex
          end
        end
        f.puts "\nend"
      end
    end

    def export(dir)
      file = "#{dir}/#{name}.sublime-mousemap"
      File.open(file, 'wb:utf-8') { |f| f.write to_json }
    end

    def to_json
      "[\n" <<
        bindings.map { |b| JSON.generate(b.to_h) }.join(",\n").indent(2) <<
      "\n]"
    end


    ##
    # A mouse binding: a click with its command(s).

    class MouseBinding

      def self.from_json(json_hash)
        h = json_hash.dup

        button = h.delete('button') or raise Error, 'no button: ' << json_hash.inspect
        modifiers = h.delete('modifiers')
        spec = [*modifiers, button].join('+')
        click = Mouse.sublime.ensure_click(spec)

        count = h.delete('count')
        count = count.to_i if count

        press = h.delete('press_command')
        press_command = press ? Command.new(press, h.delete('press_args')) : nil

        cmd = h.delete('command')
        command = cmd ? Command.new(cmd, h.delete('args')) : nil

        h.empty? or raise Error, 'unexpected JSON keys: ' << h.inspect
        new(click, count, press_command, command)

      rescue => ex
        warn "error with binding #{json_hash.inspect}"
        warn ex.message
        raise
      end

      attr_reader :click, :count, :press_command, :command
      attr_accessor :source_file

      def initialize(click, count, press_command, command)
        @click = click
        @count = count
        @press_command = press_command
        @command = command
      end

      def to_dsl
        spec = click.to_spec
        dsl = "click#{count} #{spec.to_source}"
        dsl << ", down: #{press_command.to_dsl}" if press_command
        dsl << ", up: #{command.to_dsl}" if command

        dsl
      end

      def to_h
        h = click.to_h
        h['count'] = count if count
        h.merge! press_command.to_h('press_command', 'press_args') if press_command
        h.merge! command.to_h if command
        h
      end

    end


    class DSLReader < Tools::BlankSlate

      def initialize(file = nil)
        @mousemaps = []
        @current_map = nil
        @mouse = Mouse.sublime
        instance_eval File.read(file, encoding: 'utf-8'), file if file
      end

      def _mousemaps
        @mousemaps
      end

      def mousemap(name, &block)
        @current_map and raise Error, "'mousemap' blocks cannot be nested"
        @current_map = MouseMap.new(name)
        instance_eval(&block)
        @mousemaps << @current_map
        @current_map = nil
      end

      def button_names(maps={})
        # create a copy of the Sublime mouse
        @mouse = Mouse.sublime.clone('Custom Names')
        maps.each_pair do |name, st_name|
          b = @mouse.modifier(st_name) or
            raise Error, "no button nor modifier named '#{st_name}'"
          b.name = name
        end
      end

      def click1(spec, options={})
        click spec, options.merge({ count: 1 })
      end

      def click2(spec, options={})
        click spec, options.merge({ count: 2 })
      end

      def click3(spec, options={})
        click spec, options.merge({ count: 3 })
      end

      def click(spec, options={})
        @current_map or raise Error, "'click' is invalid outside of a 'mousemap' block"
        click = @mouse.ensure_click(spec)
        count = options.delete(:count)
        press_cmd = options.delete(:down)
        press_cmd && press_cmd.error and raise Error, "click '#{spec}':#{press_cmd.error}"
        cmd = options.delete(:up)
        cmd && cmd.error and raise Error, "click '#{spec}':#{cmd.error}"
        press_cmd || cmd or
          raise Error, "click '#{spec}': no 'up' nor 'down' command"
        @current_map.bindings << MouseBinding.new(click, count, press_cmd, cmd)
      end

      def method_missing(sym, *args, &block)
        @current_map or raise Error, "'#{sym}' is invalid outside of a 'mousemap' block"
        Command.from_method_missing(sym, args)
      end

    end

  end

end
end
