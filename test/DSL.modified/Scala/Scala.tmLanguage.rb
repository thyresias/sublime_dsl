# encoding: utf-8

language 'Scala' => 'source.scala' do
  file_types %w(scala)
  folding_start_marker %r'/\*\*|\{\s*$'
  folding_stop_marker %r'\*\*/|^\s*\}'
  key_equivalent "^~S"  # TextMate only
  uuid "158C0929-299A-40C8-8D89-316BE0C446E8"  # TextMate only
  bundle_uuid "452017E8-0065-49EF-AB9D-7849B27D9367"  # TextMate only

  include "#storage-modifiers"
  include "#keywords"
  include "#declarations"
  include "#inheritance"
  include "#imports"
  include "#comments"
  include "#block-comments"
  include "#strings"
  include "#initialization"
  include "#constants"
  include "#char-literal"
  include "#scala-symbol"
  include "#empty-parentheses"
  include "#parameter-list"
  include "#qualifiedClassName"
  include "#xml-literal"

  fragment :"block-comments" do
    rule 'comment.block.scala' do
      from %r'/\*'
      to %r'\*/'
      include "#block-comments"
      rule do
        match %r'(?x)
      (?! /\*)
      (?! \*/)
      '
      end
    end
  end

  fragment :"char-literal" do
    rule 'constant.character.literal.scala' do
      match %r/'\\?.'/
    end
  end

  fragment :comments do
    rule 'comment.line.double-slash.scala' do
      match %r'(//).*$\n?',
        1 => 'punctuation.definition.comment.scala'
    end
    rule 'comment.block.empty.scala' do
      match %r'/\*\*/',
        0 => 'punctuation.definition.comment.scala'
    end
    rule 'comment.block.documentation.scala' do
      from %r'(^\s*)?/\*\*'
      to %r'\*/(\s*\n)?'
      both 0 => 'punctuation.definition.comment.scala'
      rule 'keyword.other.documentation.scaladoc.scala' do
        match %r/(@\w+\s)/
      end
      rule 'keyword.other.documentation.scaladoc.link.scala' do
        match %r/\{@link\s+[^\}]*\}/
      end
    end
  end

  fragment :constants do
    rule 'constant.language.scala' do
      match %r/\b(false|null|true|Nil|None)\b/
    end
    rule 'constant.numeric.scala' do
      match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)([LlFfUuDd]|UL|ul)?\b/
    end
    rule 'variable.language.scala' do
      match %r/\b(this|super|self)\b/
    end
    rule 'storage.type.primitive.scala' do
      match %r/\b(Unit|Boolean|Byte|Char|Short|Int|Float|Long|Double)\b/
    end
  end

  fragment :declarations do
    rule do
      match %r/(?x)
            \b(def)\s+
            (([a-zA-Z$_][a-zA-Z0-9$_]*(_[^a-zA-Z0-9\s]+)?)|`.*`|[^\w\[\(\:\s]+)/,
        1 => 'keyword.declaration.scala',
        2 => 'entity.name.function.declaration'
    end
    rule do
      match %r/(case)?\b(class|trait|object)\s+([^\s\{\(\[]+)/,
        1 => 'keyword.declaration.scala',
        2 => 'keyword.declaration.scala',
        3 => 'entity.name.class.declaration'
    end
    rule do
      match %r/\b(type)\s+(([a-zA-Z$_][a-zA-Z0-9$_]*(_[^a-zA-Z0-9\s]+)?)|`.*`)/,
        1 => 'keyword.declaration.scala',
        2 => 'entity.name.type.declaration'
    end
    rule do
      match %r/\b(?:(val)|(var))\s+(([a-zA-Z$_][a-zA-Z0-9$_]*(_[^a-zA-Z0-9\s]+)?)|`.*`)?/,
        1 => 'keyword.declaration.stable.scala',
        2 => 'keyword.declaration.volatile.scala',
        3 => 'entity.name.val.declaration'
    end
    rule do
      match %r/\b(package object)\s+([^\s\{\(\[]+)/,
        1 => 'keyword.declaration.scala',
        2 => 'entity.name.class.declaration'
    end
    rule 'meta.package.scala' do
      match %r/\b(package)\s+([\w\.]+)/,
        1 => 'keyword.other.scoping.scala',
        2 => 'entity.name.package.scala'
    end
  end

  fragment :"empty-parentheses" do
    rule 'meta.parentheses.scala' do
      match %r/\(\)/
    end
  end

  fragment :imports do
    rule 'meta.import.scala' do
      from %r/\b(import)\s+/,
        1 => 'keyword.other.import.scala'
      to %r/(?<=[\n;])/
      include "#comments"
      rule 'variable.package.scala' do
        match %r/([^\s{;.]+)\s*\.\s*/
      end
      rule 'variable.import.scala' do
        match %r/([^\s{;.]+)\s*/
      end
      rule 'meta.import.selector.scala' do
        from %r/{/
        to %r/}/
        rule do
          match %r/(?x) \s*
        ([^\s.,}]+) \s*
        (=>) \s*
        ([^\s.,}]+) \s*
        /,
            1 => 'variable.import.renamed-from.scala',
            2 => 'keyword.other.arrow.scala',
            3 => 'variable.import.renamed-to.scala'
        end
        rule 'variable.import.scala' do
          match %r/([^\s.,}]+)/
        end
      end
    end
  end

  fragment :inheritance do
    rule do
      match %r/(extends|with)\s+([^\s\{\(\[\]]+)/,
        1 => 'keyword.declaration.scala',
        2 => 'entity.other.inherited-class.scala'
    end
  end

  fragment :initialization do
    rule do
      match %r/\b(new)\s+([^\s\{\(\[]+)/,
        1 => 'keyword',
        2 => 'entity.name.class'
    end
  end

  fragment :keywords do
    rule 'keyword.control.flow.jump.scala' do
      match %r/\b(return|throw)\b/
    end
    rule 'keyword.control.flow.scala' do
      match %r/\b(else|if|do|while|for|yield|match|case)\b/
    end
    rule 'keyword.control.exception.scala' do
      match %r/\b(catch|finally|try)\b/
    end
  end

  fragment :"parameter-list" do
    rule do
      match %r/([a-zA-Z$_][a-zA-Z0-9$_]*)\s*:\s*([A-Za-z0-9][\w|?\.]*)?,?/,
        1 => 'variable.parameter',
        2 => 'entity.name.class'
    end
  end

  fragment :qualifiedClassName do
    rule do
      match %r/(\b([A-Z][\w]*))/,
        1 => 'entity.name.class'
    end
  end

  fragment :"scala-symbol" do
    rule do
      match %r/('\w+)/,
        1 => 'entity.name.symbol'
    end
  end

  fragment :"storage-modifiers" do
    rule 'storage.modifier.access' do
      match %r/\b(private\[\S+\]|protected\[\S+\]|private|protected)\b/
    end
    rule 'storage.modifier.other' do
      match %r/\b(synchronized|@volatile|abstract|final|lazy|sealed|implicit|override|@transient|@native)\b/
    end
  end

  fragment :strings do
    rule 'string.quoted.triple.scala' do
      from %r/"""/
      to %r/"""/
    end
    rule 'string.quoted.double.scala' do
      from %r/(?<!\\)"/
      to %r/"/
      rule 'invalid.string.newline' do
        match %r/\n/
      end
      rule 'constant.character.escape.scala' do
        match %r/\\./
      end
    end
  end

  fragment :"xml-attribute" do
    rule do
      match %r/(\w+)=("[^"]*")/,
        1 => 'entity.other.attribute-name',
        2 => 'string.quoted.double'
    end
  end

  fragment :"xml-literal" do
    rule 'text.xml' do
      from %r'</?([a-zA-Z0-9]+)',
        1 => 'entity.name.tag'
      to %r'/?>'
      include "#xml-literal"
      include "#xml-attribute"
    end
  end
end
