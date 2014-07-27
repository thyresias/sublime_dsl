# encoding: utf-8

module SublimeDSL
module Tools

  ##
  # A string that would like to be a Regexp.
  # May contain back-references to another RegexpWannabe,
  # stored as '§1', '§2', etc.

  class RegexpWannabe

    attr_reader :source
    attr_reader :regexp   # may be nil if error
    attr_reader :backref
    attr_reader :error
    attr_reader :warnings

    # FIXME: warnings ignored in JSON DSLs

    # FIXME: 3 possible sources: PList, JSON, Ruby Regexp
    # - when from PList, the current way of doing things seems ok
    # - when from JSON, \t & \n should be converted to \\t and \\n
    #   and back to \t & \n on output (they don't use (?x))
    # - when from Ruby, source should not be altered on input,
    #   but the output depends on JSON vs PList

    def initialize(source, backref = nil)
      # encode in utf-8, remove escaped newlines
      @source = source.encode('utf-8').gsub(/(^|[^\\](\\\\)*+)\\\n/, '\1')
      @backref = backref
      @regexp = nil
      @error = nil
      @warnings = []
      try_conversion
      @error = message_only(@error) if @error
      @source.gsub!("\t", "  ") if extended?
    end

    # Returns the ruby syntax.
    #
    # If #source contains a '/', tries to return an r-form <tt>%r'...'</tt> or <tt>%r:...:</tt> or
    # <tt>%r!...!</tt>. If it does not, or if the #source contains all 3 characters <tt>':!</tt>,
    # return <tt>/.../</tt> if +rform+ is false (the default), or <tt>%r/.../</tt> if +rform+ is
    # true. (The latter syntax avoids warnings when the regexp is the first argument to a method
    # and parentheses are not used around arguments.)

    def inspect(rform = false)
      str = extended? ? source : source.gsub("\t", '\t').gsub("\n", '\n')
      s = rform ? '%r' : ''
      return "#{s}/#{str}/" unless str.include?('/')
      %w(' : !).each { |c| return "%r#{c}#{str}#{c}" unless str.include?(c) }
      # replace / with \/ unless already escaped
      escaped = str.gsub( %r"(^|[^\\](\\\\)*+)(?=/)", '\1\\')
      "#{s}/#{escaped}/"
    end

    # Returns the string syntax.
    # * If +json+ == false, the string is suitable for PList.
    # * If +json+ == true, the string is suitable for JSON output with String#inspect.

    def to_s(for_json = false)
      if regexp
        # remove \/ escapes
        str = regexp.source.gsub( %r"(^|[^\\](\\\\)*+)\\(?=/)", '\1')
        str = str.gsub("\t", '\t').gsub("\n", '\n') unless extended?
        if for_json
          str.gsub!( %r"(^|[^\\](\\\\)*+)\\n", "\\1\n")
          str.gsub!( %r"(^|[^\\](\\\\)*+)\\t", "\\1\t")
        end
      else
        str = source
      end
      str.gsub(/§(?=[1-9])/, '\\')
    end

    # Returns an array of fixme comments.
    def fixmes
      comments = []
      error and
        comments << "# FIXME: (error) #{error}"
      source =~ /#[@${]/ and
        comments << "# FIXME: (error) '#$&' will be interpreted as interpolation: escape '#' as '\\#'"
      comments.concat warnings.map { |w| "# FIXME: (warning) #{w}" }
      comments
    end

    # Returns the fixme comments for this regexp.
    # If no fixme, returns an empty string.

    def fixme_comments(indent = '  ')
      fixmes.map { |c| "#{indent}#{c}\n" }.join
    end

  private

    def extended?
      source =~ /\(\?[im]*x(:|[-im]*\))/
    end

    def try_conversion
      @warnings = capture_warnings { @regexp = Regexp.new(source) }
      @backref = nil unless source =~ /§[1-9]/
    rescue RegexpError => ex
      msg = ex.message
      unless backref && msg =~ /^invalid backref|^invalid pattern in look-behind/
        @error = msg
        return
      end

      if backref.error
        warnings << 'contains references to a Regexp with an error'
        return
      end

      # replace \n with §n (but \\n remains \\n, while \\\n => \\§n, etc.)
      source.gsub!(/((^|[^\\])(\\\\)*)\\(?=[1-9])/, '\1§')

      unless backref.warnings.empty?
        warnings << 'contains references to a Regexp with warning(s)'
        return
      end

      begin
        @warnings = capture_warnings { @regexp = Regexp.new(source) }
      rescue RegexpError => ex
        @error = ex.message
      end
    end

    def capture_warnings
      prev_verbose, $VERBOSE = $VERBOSE, 2
      prev_stderr, $stderr = $stderr, StringIO.new('', 'wb:utf-8')
      yield
      msg = $stderr.string
      msg.lines.grep(/ warning: /).map do |line|
        line = line[/.*? warning: (.*)/, 1]
        message_only(line)
      end
    ensure
      $stderr = prev_stderr
      $VERBOSE = prev_verbose
    end

    def message_only(msg)
      line = msg.lines.first.strip
      line =~ /(.*?):/ and line = $1.strip
      line
    end

  end

end
end
