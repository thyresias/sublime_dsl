# encoding: utf-8

class String

  # Same as #inspect, but between single quotes,
  # so only \ and single quotes are escaped.
  def inspect_sq
    # escape all \ trailing, or followed by a \ or a '
    # escape single quotes
    "'" << self.gsub(/\\$|\\(?=[\\'])/, '\\\\\\\\').gsub("'", "\\\\'") << "'"
  end

  # Same as #inspect, but only escapes control characters and double quotes.
  def inspect_dq
    '"' << self.gsub(/[[:cntrl:]\\"]/) { |c| c.inspect[1..-2]  } << '"'
  end

  # Returns the shortest between #inspect_sq and #inspect_dq.
  # If same length, acts according to +prefer_dq+
  # (prefer double quotes?)
  def to_source(prefer_dq = false)
    sq = inspect_sq
    dq = inspect_dq
    case dq.length <=> sq.length
    when  1 then sq
    when -1 then dq
    when  0 then prefer_dq ? dq : sq
    end
  end

  HTML_ESCAPE_MAP = { '&' => '&amp;', '"' => '&quot;', '<' => '&lt;', '>' => '&gt;' }

  # Returns the string with characters escaped to HTML entities:
  #   < => &lt;
  #   > => &gt;
  #   & => &amp;
  #   " => &quot;  (if escape_quotes == true)
  def html_escape(escape_quotes = true)
    if escape_quotes
      self.gsub(/[&><"]/, HTML_ESCAPE_MAP)
    else
      self.gsub(/[&><]/, HTML_ESCAPE_MAP)
    end
  end

  # <tt>pascal_case('snake_case') # => SnakeCase</tt>.
  def pascal_case
    self.gsub(/(?:^|_)(.)/) { $1.upcase }
  end

 # <tt>camel_case('snake_case') # => snakeCase</tt>.
 def camel_case
   self.gsub(/_(.)/) { $1.upcase }
 end

 # <tt>snake_case('PascalCase') # => pascal_case</tt>.
 # <tt>snake_case('camelCase') # => camel_case</tt>.
  def snake_case
    self
      .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
      .gsub(/([a-z\d])([A-Z])/,'\1_\2')
      .downcase
  end

  # Shifts all lines left, preserving relative indentation.
  def dedent
    self.dup.dedent!
  end

  # Shifts all lines left, preserving relative indentation.
  # Returns +self+.
  def dedent!
    if (re = dedent_regexp)
      self.gsub! re, ''
    end
    self
  end

  # Indents all non-empty lines by the number of spaces passed.
  def indent(spaces)
    self.gsub(/^(.+)/, (' ' * spaces) + '\1')
  end

  # Indents all non-empty lines by the number of spaces passed.
  # Returns +self+.
  def indent!(spaces)
    self.gsub!(/^(.+)/, (' ' * spaces) + '\1')
    self
  end

  # Wraps at spaces so that no line is longer than the passed +width+,
  # if possible. Multiple newlines, tabs & spaces are replaced by
  # a single space.
  def wrap(width = 80)
    words = self.split(/\s+/m)
    wrapped = words.shift
    len = wrapped.length
    words.each do |w|
      len += 1 + w.length
      if len > width
        wrapped << "\n" << w
        len = w.length
      else
        wrapped << ' ' << w
      end
    end
    wrapped
  end

private

  # Returns the regexp to dedent +self+, or +nil+ if no dedent is needed,
  # or there are leading tabs on non-empty lines.
  def dedent_regexp
    min_indent = self.length
    self.each_line do |line|
      # if no leading space, no dedent
      line =~ /^\S/ and return nil
      # skip empty lines
      line =~ /^\s*$/ and next
      # do nothing when tabs are present
      line =~ /^ *\t/ and return nil
      indent = line.match(/^ +/).to_s.length
      min_indent = indent if indent < min_indent
    end
    Regexp.new('^' << ' ' * min_indent, Regexp::MULTILINE)
  end

end
