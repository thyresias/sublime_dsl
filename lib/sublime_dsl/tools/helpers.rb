
module SublimeDSL
module Tools

  ##
  # Helper methods to include in DSL blocks as needed.

  module Helpers

    # Return an optimized regexp string matching a word in +words+. Example:
    #   include SublimeDSL::Tools::Helpers
    #   list = %w(abs addr addrlong airy allcomb allperm anyalnum anyalpha anycntrl)
    #   optimized_re(list)
    #     => 'a(bs|ddr(long)?|iry|ll(comb|perm)|ny(al(num|pha)|cntrl))'

    def optimized_re(words)
      root = Node.new('')
      root.add_children words
      root.reduce!
      root.to_re
    end

    module_function :optimized_re

  end

  ##
  # A node in the optimization of a Regexp matching a list of keywords.

  class Node

    # The start string.
    attr_reader :start

    # The child nodes.
    attr_reader :children

    # Creates a new node for the +start+ string, with an empty list of children.
    def initialize(start)
      @start = start
      @children = []
    end

    # The node representing the end of a string: an empty string with no child.
    NULL = self.new('')

    # Adds +words+ to the children of the current node:
    # the children of the current node are the unique initial letters of words,
    # and the following letters are recurisvely added as grandchildren:
    #   x = Node.new('')
    #   x.add_children %w(a abc abd abde)
    #   => tree:
    #      ""
    #        "a"
    #          ""
    #          "b"
    #            "c"
    #              ""
    #            "d"
    #              ""
    #              "e"
    #                ""

    def add_children(words)
      words.group_by { |w| w[0] }.each_pair do |letter, list|
        if letter.nil?
          self.children << Node::NULL
        else
          n = Node.new(letter.dup)
          self.children << n
          n.add_children list.map { |w| w[1..-1] }
        end
      end
    end

    # Reduce the current node:
    # - first reduce all children
    # - then if there is only one +child+ left:
    #   - append the child#start value to self#start
    #   - replace the children of +self+ by the children of +child+
    # Example:
    #   x = Node.new('')
    #   x.add_children %w(abs addr addrlong airy allcomb allperm anyalnum anyalpha anycntrl)
    #   x.reduce!
    #   => tree:
    #      "a"
    #        "bs"
    #        "ddr"
    #          ""
    #          "long"
    #        "iry"
    #        "ll"
    #          "comb"
    #          "perm"
    #        "ny"
    #          "al"
    #            "num"
    #            "pha"
    #          "cntrl"

    def reduce!
      children.each(&:reduce!)
      if children.length == 1
        child = children.first
        @start << child.start
        @children = child.children
      end
    end

    # Converts the current node to a regular expression string:
    #   x = Node.new('')
    #   x.add_children %w(abs addr addrlong airy allcomb allperm anyalnum anyalpha anycntrl)
    #   x.reduce!
    #   x.to_re
    #   => 'a(bs|ddr(long)?|iry|ll(comb|perm)|ny(al(num|pha)|cntrl))'

    def to_re
      t, list = children.partition { |c| c == NULL }
      t = t.first
      start + (
        case list.length
        when 0
          ''
        when 1
          r = list.first.to_re
          r.length == 1 ? r : '(' + r + ')'
        else
          r = list.map(&:to_re)
          if r.all? { |s| s.length == 1 }
            '[' + r.join + ']'
          else
            '(' + r.join('|') + ')'
          end
        end
      ) + (
        ( t ? '?' : '' )
      )
    end

    # The display tree for the current node.

    def display_tree(indent = '')
      return indent + start.inspect if children.empty?
      [ indent + start.inspect,
        children.map { |c| c.display_tree(indent+'  ') },
      ].join("\n")
    end

  end

end
end
