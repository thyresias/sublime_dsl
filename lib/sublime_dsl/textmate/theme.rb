# encoding: utf-8

require_relative 'theme/item'
require_relative 'theme/dsl_reader'
require_relative 'theme/plist_writer'

module SublimeDSL
module TextMate

  class Theme

    # Create from a PList file.
    def self.import(file)
      p = PList.import(file)
      t = new(p.delete('name'))
      t.basename = File.basename(file, File.extname(file))
      t.author = p.delete('author')
      t.uuid = p.delete('uuid')
      t.comment = p.delete('comment')
      t.license = p.delete('license')
      p.delete('settings').each do |h|
        n = h['name']
        s = h['scope'] && h['scope'].strip
        if n || s
          e = Item.new(n, s)
          h['settings'].each_pair do |prop, value|
            next if value.empty?
            e.send "#{prop.snake_case}=", value
          end
          t.add_item e
        else
          h['settings'].each_pair do |prop, color|
            key = prop.snake_case #.to_sym
            color.upcase! if color =~ /^#/
            t.base_colors[key] = color
          end
        end
      end
      p.empty? or raise Error, "unknown theme keys: #{p.inspect}"
      t
    end

    # Returns the content of this file after __END__
    # (DATA is not available for required files).

    def self.color_data # :nodoc:
      data = ''
      File.open(__FILE__) do |f|
        in_data = false
        f.each_line do |line|
          if line =~ /^__END__/
            in_data = true
          elsif in_data
            data << line
          end
        end
      end
      data
    end

    # Hash { '#xxxxxx' => color_name }, read from the
    # DATA section of this file.

    COLOR_NAMES_HASH = {}

    color_data.each_line do |line|
      line.strip!
      next if line.empty? || line.start_with?('=')
      name, value = line.split(/\s+/)
      COLOR_NAMES_HASH["##{value}"] = name.snake_case
    end

    include CustomBaseName

    attr_accessor :name, :author, :uuid, :comment, :license

    # base color hash:
    #   background
    #   caret
    #   foreground
    #   invisibles
    #   line_highlight
    #   selection
    #   selection_border
    #   inactive_selection
    #
    # Monokai* also have:
    #   inactive_selection
    #   inactive_selection_foreground
    #   find_highlight
    #   find_highlight_foreground
    #   active_guide
    #   brackets_foreground
    #   brackets_options
    #   bracket_contents_foreground
    #   bracket_contents_options

    attr_reader :base_colors

    # array of defined items
    attr_reader :items

    def initialize(name)
      @name = name
      @author = nil
      @uuid = nil
      @comment = nil
      @license = nil
      @base_colors = {}
      @items = []
    end

    def add_item(e)
      warn "unnamed item in theme #{name.inspect}" unless e.name
      warn "empty scope for item '#{e.name}' in theme #{name.inspect}" unless e.scope
      e.name && items.any? { |el| el.name == e.name } and
        warn "duplicate item name '#{e.name}' in theme #{name.inspect}"
      items << e
    end

    def to_dsl
      out = StringIO.new('', 'wb:utf-8')

      args = name.to_source
      args << dsl_file_arg

      out.puts comment.strip.lines.map { |l| "# #{l}" }.join << "\n\n" if comment
      out.puts "theme #{args} do"
      out.puts
      out.puts "  author '#{author}'" if author
      out.puts "  uuid '#{uuid}'" if uuid
      if license
        out.puts
        out.puts "  license <<-TXT"
        license.lines.each { |l| out.puts l.strip.empty? ? '' : l.strip.wrap.indent(4) }
        out.puts "  TXT"
      end

      out.puts
      max = colors_hash.values.map(&:length).max
      colors_hash.each_pair do |color, name|
        out.puts "  %*1$2$s = '%3$s'" % [-max, name, color]
      end

      out.puts
      out.puts "  base_colors("
      base_colors.each_pair do |k,v|
        out.puts "    #{k}: #{colors_hash[v]},"
      end
      out.puts "  )"

      out.puts
      names_hash = items.group_by(&:name)
      items.each do |e|
        out.puts '  # FIXME: duplicate name:' if e.name && names_hash[e.name].length > 1
        out.puts e.to_dsl(colors_hash).indent(2)
      end

      out.puts "\nend"

      out.string
    end

    def write(dir)
      file = "#{dir}/#{basename}.tmTheme.rb"
      File.open(file, 'wb:utf-8') do |f|
        f.puts '# encoding: utf-8'
        f.puts "\n" << to_dsl
      end
    end

    def export(dir)
      file = "#{dir}/#{basename}.tmTheme"
      PListWriter.new(self).export(file)
    end

    # A Hash { <color value> => <color name> }.
    def colors_hash
      @colors_hash ||= begin
        colors = base_colors.values + items.flat_map(&:colors)
        colors.uniq!
        h = {}
        colors.each_with_index { |c, i| h[c] = COLOR_NAMES_HASH[c] || "color#{i}" }
        h
      end
    end

  end

end
end

__END__

= Red

IndianRed             CD5C5C
LightCoral            F08080
Salmon                FA8072
DarkSalmon            E9967A
LightSalmon           FFA07A
Crimson               DC143C
Red                   FF0000
FireBrick             B22222
DarkRed               8B0000

= Pink

Pink                  FFC0CB
LightPink             FFB6C1
HotPink               FF69B4
DeepPink              FF1493
MediumVioletRed       C71585
PaleVioletRed         DB7093

= Orange

LightSalmon           FFA07A
Coral                 FF7F50
Tomato                FF6347
OrangeRed             FF4500
DarkOrange            FF8C00
Orange                FFA500

= Yellow

Gold                  FFD700
Yellow                FFFF00
LightYellow           FFFFE0
LemonChiffon          FFFACD
LightGoldenrodYellow  FAFAD2
PapayaWhip            FFEFD5
Moccasin              FFE4B5
PeachPuff             FFDAB9
PaleGoldenrod         EEE8AA
Khaki                 F0E68C
DarkKhaki             BDB76B

= Purple

Lavender              E6E6FA
Thistle               D8BFD8
Plum                  DDA0DD
Violet                EE82EE
Orchid                DA70D6
Fuchsia               FF00FF
Magenta               FF00FF
MediumOrchid          BA55D3
MediumPurple          9370DB
BlueViolet            8A2BE2
DarkViolet            9400D3
DarkOrchid            9932CC
DarkMagenta           8B008B
Purple                800080
Indigo                4B0082
SlateBlue             6A5ACD
DarkSlateBlue         483D8B

= Green

GreenYellow           ADFF2F
Chartreuse            7FFF00
LawnGreen             7CFC00
Lime                  00FF00
LimeGreen             32CD32
PaleGreen             98FB98
LightGreen            90EE90
MediumSpringGreen     00FA9A
SpringGreen           00FF7F
MediumSeaGreen        3CB371
SeaGreen              2E8B57
ForestGreen           228B22
Green                 008000
DarkGreen             006400
YellowGreen           9ACD32
OliveDrab             6B8E23
Olive                 808000
DarkOliveGreen        556B2F
MediumAquamarine      66CDAA
DarkSeaGreen          8FBC8F
LightSeaGreen         20B2AA
DarkCyan              008B8B
Teal                  008080

= Blue

Aqua                  00FFFF
Cyan                  00FFFF
LightCyan             E0FFFF
PaleTurquoise         AFEEEE
Aquamarine            7FFFD4
Turquoise             40E0D0
MediumTurquoise       48D1CC
DarkTurquoise         00CED1
CadetBlue             5F9EA0
SteelBlue             4682B4
LightSteelBlue        B0C4DE
PowderBlue            B0E0E6
LightBlue             ADD8E6
SkyBlue               87CEEB
LightSkyBlue          87CEFA
DeepSkyBlue           00BFFF
DodgerBlue            1E90FF
CornflowerBlue        6495ED
MediumSlateBlue       7B68EE
RoyalBlue             4169E1
Blue                  0000FF
MediumBlue            0000CD
DarkBlue              00008B
Navy                  000080
MidnightBlue          191970

= Brown

Cornsilk              FFF8DC
BlanchedAlmond        FFEBCD
Bisque                FFE4C4
NavajoWhite           FFDEAD
Wheat                 F5DEB3
BurlyWood             DEB887
Tan                   D2B48C
RosyBrown             BC8F8F
SandyBrown            F4A460
Goldenrod             DAA520
DarkGoldenrod         B8860B
Peru                  CD853F
Chocolate             D2691E
SaddleBrown           8B4513
Sienna                A0522D
Brown                 A52A2A
Maroon                800000

= White

White                 FFFFFF
Snow                  FFFAFA
Honeydew              F0FFF0
MintCream             F5FFFA
Azure                 F0FFFF
AliceBlue             F0F8FF
GhostWhite            F8F8FF
WhiteSmoke            F5F5F5
Seashell              FFF5EE
Beige                 F5F5DC
OldLace               FDF5E6
FloralWhite           FFFAF0
Ivory                 FFFFF0
AntiqueWhite          FAEBD7
Linen                 FAF0E6
LavenderBlush         FFF0F5
MistyRose             FFE4E1

= Grey

Gainsboro             DCDCDC
LightGrey             D3D3D3
Silver                C0C0C0
DarkGray              A9A9A9
Gray                  808080
DimGray               696969
LightSlateGray        778899
SlateGray             708090
DarkSlateGray         2F4F4F
Black                 000000
