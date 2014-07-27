
module SublimeDSL
module Tools

  ##
  # Tools for console interaction.

  class Console

    attr_reader :verbosity
    attr_accessor :set_ruby_verbosity
    attr_reader :in_progress

    def initialize
      @verbosity = 1
      @set_ruby_verbosity = true
      @in_progress = false
    end

    def error(text)
      end_progress
      $stderr.puts text
    end

    def verbosity=(value)
      if set_ruby_verbosity
        case value
        when 0 then $VERBOSE = nil
        when 1 then $VERBOSE = false
        when 2 then $VERBOSE = true
        end
      end
      @verbosity = value
    end

    def info(text, force = false)
      return unless $stdout.tty? && (verbosity > 0 || force)
      end_progress
      puts text
    end

    def width
      (ENV['COLUMNS'] || 80).to_i
    end

    def progress(index, count, file, force = false)
      return unless $stdout.tty? && (verbosity == 2 || force)
      @in_progress = true
      c = count.to_s
      prefix = "file %#{c.length}d/#{c}: " % index
      line = "#{prefix}#{file}"
      padding = width - line.length - 1
      if padding < 0
        file = file[(-padding) .. -1]
        file[0..2] = "..."
        line = "#{prefix}#{file}"
      else
        line << ' ' * padding
      end
      print "#{line}\r"
      $stdout.flush
    end

  private

    def end_progress
      puts() if in_progress
      @in_progress = false
    end

  end

end
end
