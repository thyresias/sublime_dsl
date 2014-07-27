# encoding: utf-8

module SublimeDSL
module SublimeText
class Package

  ##
  # 'Universal' DSL reader: reads any DSL block and updates its package.

  class DSLReader

    def initialize(file, package)
      @file = file
      @package = package
      instance_eval File.read(file, encoding: 'utf-8'), file
    end

    def method_missing(sym, *args, &block)
      raise DSLError, "'#{sym}' is not a valid Package DSL statement"
    end

    def theme(*args, &block)
      r = TextMate::Theme::DSLReader.new
      r.theme(*args, &block)
      @package.themes.concat r._themes
    end

    def language(*args, &block)
      r = TextMate::Grammar::DSLReader.new
      r.language(*args, &block)
      @package.grammars.concat r._grammars
    end

    def preferences(*args, &block)
      r = TextMate::Preference::DSLReader.new
      r.preferences(*args, &block)
      @package.preferences.concat r._preferences
    end

    def snippets(*args, &block)
      r = TextMate::Snippet::DSLReader.new
      r.snippets(*args, &block)
      @package.snippets.concat r._snippets
    end

    def settings(*args, &block)
      r = SettingSet::DSLReader.new
      r.settings(*args, &block)
      @package.setting_sets.concat r._setting_sets
    end

    def macro(*args, &block)
      r = Macro::DSLReader.new
      r.macro(*args, &block)
      @package.macros.concat r._macros
    end

    def commands(*args, &block)
      r = CommandSet::DSLReader.new
      r.commands(*args, &block)
      @package.command_sets.concat r._command_sets
    end

    def menu(*args, &block)
      r = Menu::DSLReader.new
      r.menu(*args, &block)
      @package.menus.concat r._menus
    end

    def mousemap(*args, &block)
      r = MouseMap::DSLReader.new
      r.mousemap(*args, &block)
      @package.mousemaps.concat r._mousemaps
    end

    def keymap(*args, &block)
      r = KeyMap::DSLReader.new
      r._file = @file
      r.keymap(*args, &block)
      @package.keymaps.concat r._keymaps
    end

    def keyboard(*args, &block)
      raise Error, "keyboards must be defined in a separate *.keyboard.rb file"
    end

  end

end
end
end
