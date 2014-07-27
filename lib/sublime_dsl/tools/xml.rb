# encoding: utf-8

module SublimeDSL
module Tools

  ##
  # Tools to process XML.

  module XML

    # Regexp matching forbidden control characters.
    FORBIDDEN_CHARS_RE = /[\x00-\x08\x0b\x0c\x0e-\x1f]/

    # Hash { 'forbidden character' => 'abbreviation' }.
    FORBIDDEN_CHARS_MAP = {
      "\x00" => 'NUL',
      "\x01" => 'SOH',
      "\x02" => 'STX',
      "\x03" => 'ETX',
      "\x04" => 'EOT',
      "\x05" => 'ENQ',
      "\x06" => 'ACK',
      "\x07" => 'BEL',
      "\x08" => 'BS',
      # "\x09" => 'HT',
      # "\x0a" => 'LF',
      "\x0b" => 'VT',
      "\x0c" => 'FF',
      # "\x0d" => 'CR',
      "\x0e" => 'SO',
      "\x0f" => 'SI',
      "\x10" => 'DLE',
      "\x11" => 'DC1',
      "\x12" => 'DC2',
      "\x13" => 'DC3',
      "\x14" => 'DC4',
      "\x15" => 'NAK',
      "\x16" => 'SYN',
      "\x17" => 'ETB',
      "\x18" => 'CAN',
      "\x19" => 'EM',
      "\x1a" => 'SUB',
      "\x1b" => 'ESC',
      "\x1c" => 'FS',
      "\x1d" => 'GS',
      "\x1e" => 'RS',
      "\x1f" => 'US'
    }

    # Returns a Nokogiri::XML::Document.
    # Raises an exception if the text contains control characters
    # forbidden in an XML document.
    def self.load(string_or_io)
      text = string_or_io.respond_to?(:read) ? string_or_io.read : string_or_io
      if text =~ FORBIDDEN_CHARS_RE
        abbrev = FORBIDDEN_CHARS_MAP[$&]
        raise Error, "illegal control character in XML: #{$&.inspect} (#{abbrev})"
      end

      Nokogiri.XML(text, &:noblanks) # I hate this API
    end

  end

end
end
