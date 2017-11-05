# encoding: utf-8

module SublimeDSL
module TextMate

  ##
  # Tools to read and write hashes in PList format.

  module PList

    class << self

      # Returns a Hash read from +file+. See ::load.
      def import(file)
        File.open(file, 'r:utf-8') { |f| load(f) }
      end

      # Writes the Hash +hash+ to +file+ in PList format.
      def export(hash, file)
        File.open(file, 'wb:utf-8') { |f| f.write dump(hash) }
      end

      # Returns a Hash corresponding to the root +dict+ of the PList.
      def load(string_or_io)
        doc = Tools::XML.load(string_or_io)
        # Document name="document" children = [
        #   DTD
        #   Element name="plist" children = [
        #     Element name="dict" children = [
        #       Element name="key" children = [ Text "author" ]
        #       Element name="string" children = [ Text "Z comme Zorglub" ]
        #       Element name = "key"  children = [ Text "name" ]
        #       Element name = "string" children = [ Text "Zorgléoptère" ]
        #       ...
        #     ]
        #   ]
        # ]
        root_node = doc.children.last.children.first
        load_node(root_node)
      end

      # Returns a String containing the PList XML for +hash+.
      def dump(hash)
        <<-XML.dedent << dump_hash(hash, '') << '</plist>'
          <?xml version="1.0" encoding="UTF-8"?>
          <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
          <plist version="1.0">
        XML
      end

    private

      def load_node(node)
        if node.comment?
          # warn 'plist: comment node ignored'
          return nil
        end
        case node.name
        when 'dict'
          load_dict(node)
        when 'string'
          node.text
        when 'integer'
          node.text.to_i
        when 'array'
          node.children.map { |n| load_node n }.compact
        when 'true'
          true
        when 'false'
          false
        else
          raise Error, "unexpected: #{node.name.inspect}"
        end
      end

      def load_dict(node)
        h = {}
        # comments, list = node.children.partition(&:comment?)
        # warn 'plist: comment node(s) ignored in dict' unless comments.empty?
        list = node.children.reject(&:comment?)
        n = list.length / 2
        (0...n).each do |i|
          i = i * 2
          k = list[i]
          v = list[i+1]
          k.name == 'key' or raise Error, "expected 'key': #{k.name.inspect}"
          v = load_node(v)
          v.nil? and raise Error, "comment as value for key '#{k.text}'"
          h[k.text] = v
        end
        h
      end

      def dump_object(object, indent)
        case object
        when String then      dump_string(object, indent)
        when Integer then     dump_integer(object, indent)
        when Hash then        dump_hash(object, indent)
        when Array then       dump_array(object, indent)
        when TrueClass then   "#{indent}<true/>\n"
        when FalseClass then  "#{indent}<false/>\n"
        else raise Error, "unexpected type: #{object.class.name}"
        end
      end

      def dump_string(str, indent)
        "#{indent}<string>" << h(str) << "</string>\n"
      end

      def dump_integer(num, indent)
        "#{indent}<integer>#{num}</integer>\n"
      end

      def dump_hash(hash, indent)
        return "#{indent}<dict/>\n" if hash.empty?
        result = "#{indent}<dict>\n"
        i = indent + "\t"
        hash.keys.sort.each do |key|
          result << "#{i}<key>#{key}</key>\n" << dump_object(hash[key], i)
        end
        result << "#{indent}</dict>\n"
      end

      def dump_array(array, indent)
        return "#{indent}<array/>\n" if array.empty?
        result = "#{indent}<array>\n"
        i = indent + "\t"
        array.each { |o| result << dump_object(o, i) }
        result << "#{indent}</array>\n"
      end

      def h(text)
        text.html_escape(false)
      end

    end

  end

end
end
