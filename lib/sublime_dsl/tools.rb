# encoding: utf-8

require_relative 'tools/blank_slate'
require_relative 'tools/console'
require_relative 'tools/helpers'
require_relative 'tools/regexp_wannabe'
require_relative 'tools/stable_inspect.rb'
require_relative 'tools/value_equality.rb'
require_relative 'tools/xml'

module SublimeDSL

  module Tools

    # Zips the content of +dir+ into file +archive+.
    def self.zip(dir, archive)
      dir = dir + '/' unless dir.end_with?('/')
      Zip::File.open(archive, Zip::File::CREATE) do |zipfile|
        Dir["#{dir}**/*"].each { |f| zipfile.add(f.sub(dir, ''), f) }
      end
    end

    # Returns the running OS: :Windows, :OSX or :Linux.
    def self.os
      @os ||=
        case RbConfig::CONFIG['host_os']
        when /mswin|mingw/
          :Windows
        when /darwin/
          :OSX
        else
          :Linux
        end
    end

    # Replacement for characters forbidden in Windows file names.
    FORBIDDEN_CHARS_MAP = {
      '<' => '˂',  # \u02C2 - modifier letter left arrowhead
      '>' => '˃',  # \u02C3 - modifier letter right arrowhead
      ':' => '˸',  # \u02F8 - modifier letter raised colon
      '"' => 'ʺ',  # \u02BA - double prime
      '/' => '∕',  # \u2215 - division slash
      '|' => '¦',  # \u00A6 - broken bar
      '?' => 'ʔ',  # \u0294 - latin letter glottal stop
      '*' => '✶',  # \u2736 - six pointed black star
      '\\' => 'ʅ'  # \u0285 - latin small letter squat reversed esh
    }

    # Regexp matching characters forbidden in Windows file names.
    FORBIDDEN_RE = /[#{FORBIDDEN_CHARS_MAP.keys.map { |s| '\\' << s }.join}]/

    # Returns an OS-compatible file name for +text+.
    #
    # Maps forbidden characters in Windows file names to something
    # visually close (even on OSX and Linux):
    #   <>:"/|?*\  =>  ˂˃˸ʺ∕¦ʔ✶ʅ
    #--
    # TODO: allow the user to control this (with a config file).

    def self.filename(text)
      text.gsub(FORBIDDEN_RE, FORBIDDEN_CHARS_MAP)
    end

  end

end