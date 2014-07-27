# encoding: utf-8

module SublimeDSL
module TextMate
class Theme

  class PListWriter

    attr_reader :theme
    attr_reader :root

    def initialize(theme)
      @theme = theme
      @root = {}
      convert_theme
    end

    def export(file)
      PList.export(root, file)
    end

  private

    def convert_theme

      root['name'] = theme.name
      root['author'] = theme.author if theme.author
      root['uuid'] = theme.uuid
      root['license'] = theme.license.rstrip << "\n\t" if theme.license

      base_colors = {}
      theme.base_colors.each_pair { |k,v| base_colors[k.to_s.camel_case] = v }

      items = theme.items.map do |e|
        h = {}
        h['name'] = e.name if e.name
        h['scope'] = e.scope if e.scope
        h['settings'] = a = {}
        a['foreground'] = e.foreground if e.foreground
        a['background'] = e.background if e.background
        a['fontStyle'] = e.font_style if e.font_style
        h
      end

      root['settings'] = [{ 'settings' => base_colors }] + items

    end

  end

end
end
end
