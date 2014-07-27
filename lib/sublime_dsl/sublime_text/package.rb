# encoding: utf-8

require_relative 'package/importer'
require_relative 'package/writer'
require_relative 'package/reader'
require_relative 'package/exporter'
require_relative 'package/dsl_reader'

module SublimeDSL
module SublimeText

  class Package

    # Create a new Package from a Sublime Text 'Packages' subdirectory.
    #
    # The options can be any Importer option.

    def self.import(name, options = {})
      importer = Importer.new(name)
      process_options importer, options

      importer.package
    end

    # Create a new Package from a DSL directory.
    #
    # The options can be any Reader option.

    def self.read(name, options = {})
      reader = Reader.new(name)
      process_options reader, options

      reader.package
    end

    def self.process_options(object, options)
      options.each_pair do |k,v|
        m = "#{k}="
        raise OptionError, "invalid option '#{k}'" unless object.respond_to? m
        object.send m, v
      end
    end

    attr_reader :name

    attr_reader :themes
    attr_reader :grammars
    attr_reader :preferences
    attr_reader :snippets
    attr_reader :setting_sets
    attr_reader :macros
    attr_reader :command_sets
    attr_reader :menus
    attr_reader :mousemaps
    attr_reader :keymaps

    attr_reader :other_files

    def initialize(name)
      @name = name
      @themes = []
      @grammars = []
      @preferences = []
      @snippets = []
      @setting_sets = []
      @macros = []
      @command_sets = []
      @menus = []
      @mousemaps = []
      @keymaps = []

      @other_files = []
    end

    # Writes the package to DSL files.
    # The options can be any Writer option.

    def write(options = {})
      writer = Writer.new(self)
      self.class.process_options writer, options
      writer.write
    end

    # Exports the package.
    # The options can be any Exporter option.

    def export(options = {})
      exporter = Exporter.new(self)
      self.class.process_options exporter, options
      exporter.export
    end

  end

end
end
