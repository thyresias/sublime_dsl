require 'rbconfig'
require 'json'
require 'nokogiri'
require 'tmpdir'
require 'zip'

require_relative 'sublime_dsl/core_ext'
require_relative 'sublime_dsl/tools'
require_relative 'sublime_dsl/textmate'
require_relative 'sublime_dsl/sublime_text'
require_relative 'sublime_dsl/cli'

module SublimeDSL

  VERSION = '0.1.2'

  class Error < StandardError; end
  class OptionError < Error; end
  class DSLError < Error; end

  Console = Tools::Console.new

end
