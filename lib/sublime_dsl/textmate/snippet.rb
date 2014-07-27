# encoding: utf-8

module SublimeDSL
module TextMate

  class Snippet

    # Returns a Snippet read from +file+.
    def self.import(file)
      Importer.for(file).snippet
    end

    # Hash { attributeName => attribute_name }
    def self.to_snake_map
      @to_snake_map ||= Hash[
        %w(
          name content scope tabTrigger keyEquivalent
          semanticClass uuid bundleUUID
        ).map { |a| [a, a.snake_case] }
      ]
    end

    include CustomBaseName

    attr_accessor :name, :content, :tab_trigger, :scope
    attr_accessor :key_equivalent, :semantic_class, :uuid, :bundle_uuid    # TextMate only
    attr_writer :file_format
    attr_reader :warnings

    def initialize
      @name = nil
      @content = nil
      @tab_trigger = nil
      @scope = nil

      @key_equivalent = nil
      @semantic_class = nil
      @uuid = nil
      @bundle_uuid = nil

      @file_format = nil
      @warnings = []
    end

    def file_format
      @file_format || :sublime_text
    end

    def complete!

      # assign name from the base name if not given
      unless name
        if @basename
          warnings << 'name assigned from the file name'
          @name = basename
          @basename = nil
        else
          raise Error, 'the snippet name is required'
        end
      end

      tab_trigger || key_equivalent or
        warnings << 'no tab trigger nor key equivalent'

      warnings.each { |w| warn "snippet #{name}: #{w}" }

      # remove spaces on empty lines
      @content.gsub!(/^[ \t]+$/, '')

    end

    alias to_s name

    include Tools::StableInspect

    def to_dsl(default_scope)

      options = ''

      case scope
      when NilClass
        warn "scope missing for snippet #{name.to_source}, set to '#{default_scope}'"
        warnings << 'missing scope, will be default_scope'
      when default_scope
      else
        options << ", scope: #{scope.to_source}"
      end

      options << ", semantic_class: #{semantic_class.to_source}" if semantic_class
      options << ", uuid: #{uuid.to_source}" if uuid
      options << ", bundle_uuid: #{bundle_uuid.to_source}" if bundle_uuid
      options << dsl_file_arg

      dsl = warnings.map { |w| "  # FIXME: #{w}\n" }.join

      if tab_trigger
        start = "tab #{tab_trigger.to_source}"
        options << ", key_equivalent: #{key_equivalent.inspect_dq}" if key_equivalent
      elsif key_equivalent
        start = "key #{key_equivalent.inspect_dq}"
      else
        start = 'key nil'
      end

      if content =~ /[ \t]$/
        dsl << "  #{start}, #{name.to_source}, #{content.inspect_dq}#{options}\n"
      else
        # TODO: use the ruby heredoc mnemonic from default_scope (CPP, RUBY, XML, etc.)
        dsl << "  #{start}, #{name.to_s.to_source}, <<-'TXT'#{options}\n"
        dsl << content << "\nTXT\n"
      end

      dsl
    end

    def export(dir)
      if file_format == :textmate
        file = "#{dir}/#{basename}.tmSnippet"
        content = to_plist
      else
        file = "#{dir}/#{basename}.sublime-snippet"
        content = to_xml
      end
      File.open(file, 'wb:utf-8') { |f| f.write content }
    end

    def to_xml
<<-XML
<snippet>
\t<content>#{c(content)}</content>
\t<tabTrigger>#{h(tab_trigger)}</tabTrigger>
\t<scope>#{h(scope)}</scope>
\t<description>#{h(name)}</description>
</snippet>
XML
    end

    def to_plist
      h = {}
      Snippet.to_snake_map.each_pair do |camel, snake|
        value = send(snake)
        h[camel] = value if value
      end
      PList.dump(h)
    end

    def h(text)
      text.html_escape(false)
    end

    # HACK: return <![CDATA[#{content}]]>, except if +content+ is itself <![CDATA[...
    def c(content)
      content =~ /<!\[CDATA\[/ ? h(content) : "<![CDATA[#{content}]]>"
    end

    ##
    # Abstract importer

    class Importer

      # Return a concrete importer for +file+.
      def self.for(file)
        case File.extname(file)
        when '.tmSnippet'
          PListReader.new(file)
        when '.sublime-snippet'
          XMLReader.new(file)
        else
          raise Error, "unknown snippet file format: #{file}"
        end
      end

      attr_reader :file, :snippet

      def initialize(file)
        @file = file
        @snippet = Snippet.new
        load
        @snippet.basename = File.basename(file, File.extname(file))
        @snippet.complete!
      end

      # Load the content of #file into #snippet
      def load
        raise NotImplementedError
      end

    end

    ##
    # TextMate format importer

    class PListReader < Importer

      def load
        snippet.file_format = :textmate
        p = read_plist(file)
        snippet.tab_trigger = p.delete('tabTrigger')
        snippet.name = p.delete('name')
        snippet.content = p.delete('content')
        snippet.scope = p.delete('scope')
        snippet.key_equivalent = p.delete('keyEquivalent')
        snippet.semantic_class = p.delete('semanticClass')
        snippet.uuid = p.delete('uuid')
        snippet.bundle_uuid = p.delete('bundleUUID')
        p.empty? or warn "unexpected keys in #{file}: #{p.inspect}"
      end

      def read_plist(file)
        text = File.read(file, encoding: 'utf-8')

        # replace forbidden control characters (given in keyEquivalent)
        h = {}
        text.gsub!(Tools::XML::FORBIDDEN_CHARS_RE) do |c|
          h[c] = Tools::XML::FORBIDDEN_CHARS_MAP[c]
        end
        h.each_pair do |c, rep|
          snippet.warnings << "illegal XML character #{c.inspect} replaced by '#{rep}'"
        end

        PList.load(text)
      end

    end

    ##
    # Sublime Text format importer

    class XMLReader < Importer

      def load
        snippet.file_format = :sublime_text

        doc = File.open(file, 'r:utf-8') { |f| Tools::XML.load(f) }
        # <snippet>
        #     <content><![CDATA[all? { |${1:e}| $0 }]]></content>
        #     <tabTrigger>all</tabTrigger>
        #     <scope>source.ruby</scope>
        #     <description>all? { |e| .. }</description>
        # </snippet>
        nodes = doc.children.reject { |n| n.comment? }
        root = nodes.first
        nodes.length == 1 && root.name == 'snippet' or
          raise Error, "#{file}: invalid root, expected <snippet>"

        root.children.each do |node|
          node.attributes.empty? or
            raise Error, "#{file}: unexpected attributes for #{node.name}: #{node.attributes.inspect}"
          next if node.children.empty?
          node.children.length == 1 && (node.children.first.text? || node.children.first.cdata?) or
            raise Error, "#{file}: unexpected children for #{node.name}: #{node.children.inspect}"
          if node.name == 'description'
            snippet.name = node.text
          else
            method = Snippet.to_snake_map[node.name]
            if method
              snippet.send "#{method}=", node.text
            else
              warn "snippet attribute '#{node.name}' ignored: " << file
            end
          end
        end

      end

    end

    ##
    # DSL reader for a collection of snippets.

    class DSLReader

      def initialize(file = nil)
        @snippets = []
        @default_scope = nil
        @file_format = nil
        @in_snippets = false
        instance_eval File.read(file, encoding: 'utf-8'), file if file
      end

      def _snippets
        @snippets
      end

      def snippets(&block)
        @in_snippets and raise Error, "'snippets' blocks cannot be nested"
        @in_snippets = true
        instance_eval(&block)
        @in_snippets = false
      end

      def method_missing(sym, *args, &block)
        raise Error, "'#{sym}' is not a snippet DSL statement"
      end

      def default_scope(scope)
        ensure_context __method__
        @default_scope = scope
      end

      def file_format(format)
        ensure_context __method__
        if format
          format = format.to_sym
          [:textmate, :sublime_text].include?(format) or
            raise Error, "invalid snippet file format: #{format.inspect}"
        end
        @file_format = format
      end

      def tab(tab_trigger, name, content, options = {})
        ensure_context __method__
        _snippets << new_snippet(:tab_trigger=, tab_trigger, name, content, options)
      end

      def key(key_equivalent, name, content, options = {})
        ensure_context __method__
        _snippets << new_snippet(:key_equivalent=, key_equivalent, name, content, options)
      end

    private

      def ensure_context(name)
        @in_snippets or raise Error, "'#{name}' is invalid outside of 'snippets' blocks"
      end

      def new_snippet(method, arg, name, content, options)
        snippet = Snippet.new
        snippet.send method, arg
        snippet.name = name
        snippet.content = content.sub(/\n\z/, '')
        snippet.scope = options.delete(:scope) || @default_scope
        snippet.file_format = @file_format
        if (k = options.delete(:key_equivalent))
          if snippet.key_equivalent && snippet.key_equivalent != k
            warn "key_equivalent option given for 'key' snippet: #{snippet}"
          else
            snippet.key_equivalent = k
          end
        end
        if (t = options.delete(:tab_trigger))
          if snippet.tab_trigger && snippet.tab_trigger != t
            warn "tab_trigger option given for 'tab' snippet: #{snippet}"
          else
            snippet.tab_trigger = t
          end
        end
        snippet.semantic_class = options.delete(:semantic_class)
        snippet.uuid = options.delete(:uuid)
        snippet.bundle_uuid = options.delete(:bundle_uuid)
        snippet.basename = options.delete(:file)

        options.empty? or warn "invalid snippet options: #{options.inspect}"
        snippet.complete!

        snippet
      end

    end

    ##
    # DSL writer for a collection of snippets.

    class DSLWriter

      attr_reader :snippets

      def initialize(snippets)
        @snippets = snippets
      end

      def write(file)
        return if snippets.empty?
        tm, st = snippets.partition { |s| s.file_format == :textmate }
        File.open(file, 'wb:utf-8') do |f|
          f.write dsl_header
          f.write dsl_block(tm)
          f.write dsl_block(st)
          f.write dsl_footer
        end
      end

    private

      def dsl_header
        <<-HEADER.dedent
          # encoding: utf-8

          snippets do

            default_scope #{default_scope.to_source}
        HEADER
      end

      def dsl_block(snippets)
        return '' if snippets.empty?
        dsl = ''
        dsl << "  file_format :textmate\n" if snippets.first.file_format == :textmate
        sort(snippets).each do |s|
          dsl << "\n#{s.to_dsl(default_scope)}"
        end

        dsl
      end

      def dsl_footer
        "\nend"
      end

      def default_scope
        @default_scope ||= most_frequent_scope
      end

      def most_frequent_scope
        scope = nil
        max_count = 0
        sort(self.snippets).group_by(&:scope).each_pair do |s,v|
          if s && v.length > max_count
            scope = s
            max_count = v.length
          end
        end

        scope
      end

      # Returns +snippets+ sorted by tab_trigger and name.
      def sort(snippets)
        snippets.sort_by { |s| [s.tab_trigger.to_s.downcase, s.name.to_s.downcase] }
      end

    end

  end

end
end
