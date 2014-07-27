# encoding: utf-8

language 'Processing' => 'source.processing' do
  # This grammar is based on the Java grammar (https://github.com/textmate/java.tmbundle)
  file_types %w(pde)
  key_equivalent "^~P"  # TextMate only
  uuid "EF0D256C-2FCB-4A87-9250-0F5F82A366B9"  # TextMate only

  rule 'meta.package.processing' do
    match %r/^\s*(package)\b(?:\s*([^ ;$]+)\s*(;)?)?/,
      1 => 'keyword.other.package.processing',
      2 => 'storage.modifier.package.processing',
      3 => 'punctuation.terminator.processing'
  end
  rule 'meta.import.static.processing' do
    match %r/^\s*(import static)\b(?:\s*([^ ;$]+)\s*(;)?)?/,
      1 => 'keyword.other.import.static.processing',
      2 => 'storage.modifier.import.processing',
      3 => 'punctuation.terminator.processing'
  end
  rule 'meta.import.processing' do
    match %r/^\s*(import)\b(?:\s*([^ ;$]+)\s*(;)?)?/,
      1 => 'keyword.other.import.processing',
      2 => 'storage.modifier.import.processing',
      3 => 'punctuation.terminator.processing'
  end
  # .pde preprocessing wrap the contents of a .pde file inside a class definition. Hence, the body of a .pde file is a Java class body
  include "#class-body"

  fragment :"all-types" do
    include "#primitive-arrays"
    include "#primitive-types"
    include "#object-types"
  end

  fragment :annotations do
    rule 'meta.declaration.annotation.processing' do
      from %r/(@[^ (]+)(\()/,
        1 => 'storage.type.annotation.processing',
        2 => 'punctuation.definition.annotation-arguments.begin.processing'
      to %r/(\))/,
        1 => 'punctuation.definition.annotation-arguments.end.processing'
      rule do
        match %r/(\w*)\s*(=)/,
          1 => 'constant.other.key.processing',
          2 => 'keyword.operator.assignment.processing'
      end
      include "#code"
      rule 'punctuation.seperator.property.processing' do
        match %r/,/
      end
    end
    rule 'storage.type.annotation.processing' do
      match %r/@\w*/
    end
  end

  fragment :"anonymous-classes-and-new" do
    rule do
      from %r/\bnew\b/,
        0 => 'keyword.control.new.processing'
      to %r/(?<=\)|\])(?!\s*{)|(?<=})|(?=;)/
      rule do
        from %r/(\w+)\s*(?=\[)/,
          1 => 'storage.type.processing'
        to %r/}|(?=\s*(?:;|\)))/
        rule do
          from %r/\[/
          to %r/\]/
          include "#code"
        end
        rule do
          from %r/{/
          to %r/(?=})/
          include "#code"
        end
      end
      rule do
        from %r/(?=\w.*\()/
        to %r/(?<=\))/
        include "#object-types"
        rule do
          from %r/\(/,
            1 => 'storage.type.processing'
          to %r/\)/
          include "#code"
        end
      end
      rule 'meta.inner-class.processing' do
        from %r/{/
        to %r/}/
        include "#class-body"
      end
    end
  end

  fragment :assertions do
    rule 'meta.declaration.assertion.processing' do
      from %r/\b(assert)\s/,
        1 => 'keyword.control.assert.processing'
      to %r/$/
      rule 'keyword.operator.assert.expression-seperator.processing' do
        match %r/:/
      end
      include "#code"
    end
  end

  fragment :class do
    rule 'meta.class.processing' do
      from %r/(?=\w?[\w\s]*(?:class|(?:@)?interface|enum)\s+\w+)/
      to %r/}/,
        0 => 'punctuation.section.class.end.processing'
      include "#storage-modifiers"
      include "#comments"
      rule 'meta.class.identifier.processing' do
        match %r/(class|(?:@)?interface|enum)\s+(\w+)/,
          1 => 'storage.modifier.processing',
          2 => 'entity.name.type.class.processing'
      end
      rule 'meta.definition.class.inherited.classes.processing' do
        from %r/extends/,
          0 => 'storage.modifier.extends.processing'
        to %r/(?={|implements)/
        include "#object-types-inherited"
        include "#comments"
      end
      rule 'meta.definition.class.implemented.interfaces.processing' do
        from %r/(implements)\s/,
          1 => 'storage.modifier.implements.processing'
        to %r/(?=\s*extends|\{)/
        include "#object-types-inherited"
        include "#comments"
      end
      rule 'meta.class.body.processing' do
        from %r/{/
        to %r/(?=})/
        include "#class-body"
      end
    end
  end

  fragment :"class-body" do
    include "#comments"
    include "#class"
    include "#enums"
    include "#methods"
    include "#annotations"
    include "#storage-modifiers"
    include "#code"
  end

  fragment :code do
    include "#comments"
    include "#class"
    rule do
      from %r/{/
      to %r/}/
      include "#code"
    end
    include "#assertions"
    include "#parens"
    include "#constants-and-special-vars"
    include "#anonymous-classes-and-new"
    include "#keywords"
    include "#storage-modifiers"
    include "#strings"
    include "#all-types"
    include "#processing-methods"
    include "#processing-classes"
  end

  fragment :comments do
    rule 'comment.block.empty.processing' do
      match %r'/\*\*/',
        0 => 'punctuation.definition.comment.processing'
    end
    include "#comments-javadoc"
    include "#comments-inline"
  end

  fragment :"comments-inline" do
    rule 'comment.block.processing' do
      from %r'/\*(?!\*)'
      to %r'\*/'
      both 0 => 'punctuation.definition.comment.processing'
    end
    rule do
      from %r'(^[ \t]+)?(?=//)',
        1 => 'punctuation.whitespace.comment.leading.processing'
      to %r/(?!\G)/
      rule 'comment.line.double-slash.processing' do
        from %r'//',
          0 => 'punctuation.definition.comment.processing'
        to %r/\n/
      end
    end
  end

  fragment :"comments-javadoc" do
    rule 'comment.block.documentation.processing' do
      from %r'/\*\*'
      to %r'\*/'
      both 0 => 'punctuation.definition.comment.processing'
      rule do
        match %r/\{\s*(@link)\s*([a-zA-Z_][a-zA-Z0-9_]+)\s*\}/,
          0 => 'keyword.other.documentation.inlinetag.processing',
          1 => 'keyword.other.documentation.tag.processing',
          2 => 'keyword.other.documentation.value.processing'
      end
      include "#comments-javadoc-tags"
    end
  end

  fragment :"comments-javadoc-tags" do
    rule do
      match %r/(@param)\s+([a-zA-Z_][a-zA-Z0-9_]+)\b/,
        1 => 'keyword.other.documentation.params.processing',
        2 => 'keyword.other.documentation.value.processing'
    end
    rule 'keyword.other.documentation.tag.processing' do
      match %r/@[a-zA-Z]+\b/
    end
  end

  fragment :"constants-and-special-vars" do
    include "#processing-variables-and-constants"
    rule 'constant.language.processing' do
      match %r/\b(true|false|null)\b/
    end
    rule 'variable.language.processing' do
      match %r/\b(this|super)\b/
    end
    rule 'constant.numeric.processing' do
      match %r/\b((0(x|X)[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)([LlFfUuDd]|UL|ul)?\b/
    end
    rule 'constant.other.processing' do
      match %r/(\.)?\b([A-Z][A-Z0-9_]+)(?!<|\.class|\s*\w+\s*=)\b/,
        1 => 'keyword.operator.dereference.processing'
    end
  end

  fragment :enums do
    rule do
      from %r/^(?=\s*[A-Z0-9_]+\s*({|\(|,))/
      to %r/(?=;|})/
      rule 'meta.enum.processing' do
        from %r/\w+/,
          0 => 'constant.other.enum.processing'
        to %r/(?=,|;|})/
        include "#parens"
        rule do
          from %r/{/
          to %r/}/
          include "#class-body"
        end
      end
    end
  end

  fragment :keywords do
    rule 'keyword.operator.assignment.bitwise.processing' do
      match %r/((&|\^|\||<<|>>>?)=)/
    end
    rule 'keyword.operator.bitwise.processing' do
      match %r/(<<|>>>?|~|\^)/
    end
    rule 'keyword.control.catch-exception.processing' do
      match %r/\b(try|catch|finally|throw)\b/
    end
    rule 'keyword.control.ternary.processing' do
      match %r/\?|:/
    end
    rule 'keyword.control.processing' do
      match %r/\b(return|break|case|continue|default|do|while|for|switch|if|else)\b/
    end
    rule 'keyword.operator.instanceof.processing' do
      match %r/\b(instanceof)\b/
    end
    rule 'keyword.operator.comparison.processing' do
      match %r/(===?|!=|<=|>=|<>|<|>)/
    end
    rule 'keyword.operator.assignment.arithmetic.processing' do
      match %r'([+*/%-]=)'
    end
    rule 'keyword.operator.assignment.processing' do
      match %r/(=)/
    end
    rule 'keyword.operator.increment-decrement.processing' do
      match %r/(\-\-|\+\+)/
    end
    rule 'keyword.operator.arithmetic.processing' do
      match %r'(\-|\+|\*|\/|%)'
    end
    rule 'keyword.operator.logical.processing' do
      match %r/(!|&&|\|\|)/
    end
    rule 'keyword.operator.bitwise.processing' do
      match %r/(\||&)/
    end
    rule 'keyword.operator.dereference.processing' do
      match %r/(?<=\S)\.(?=\S)/
    end
    rule 'punctuation.terminator.processing' do
      match %r/;/
    end
  end

  fragment :methods do
    rule 'meta.method.processing' do
      # Method defs have to look-ahead for the opening bracket to be distinguished from a method call
      from %r/(?!new)(?=\w.*\s+)(?=[^=]+\()(?=.+{)/
      to %r/}|(?=;)/
      include "#storage-modifiers"
      rule 'meta.method.identifier.processing' do
        from %r/(\w+)\s*\(/,
          1 => 'entity.name.function.processing'
        to %r/\)/
        include "#parameters"
      end
      rule 'meta.method.return-type.processing' do
        from %r/(?=\w.*\s+\w+\s*\()/
        to %r/(?=\w+\s*\()/
        include "#all-types"
      end
      include "#throws"
      rule 'meta.method.body.processing' do
        from %r/{/
        to %r/(?=})/
        include "#code"
      end
    end
  end

  fragment :"object-types" do
    include "#processing-classes"
    rule 'storage.type.generic.processing' do
      from %r/\b((?:[a-z]\w*\.)*[A-Z]+\w*)</
      to %r/>|[^\w\s,\?<\[\]]/
      include "#object-types"
      rule 'storage.type.generic.processing' do
        # This is just to support <>'s with no actual type prefix
        from %r/</
        to %r/>|[^\w\s,\[\]<]/
      end
    end
    rule 'storage.type.object.array.processing' do
      from %r/\b((?:[a-z]\w*\.)*[A-Z]+\w*)(?=\[)/
      to %r/(?=[^\]\s])/
      rule do
        from %r/\[/
        to %r/\]/
        include "#code"
      end
    end
    rule 'storage.type.processing' do
      match %r/\b(?:[a-z]\w*(\.))*[A-Z]+\w*\b/,
        1 => 'keyword.operator.dereference.processing'
    end
  end

  fragment :"object-types-inherited" do
    rule 'entity.other.inherited-class.processing' do
      from %r/\b((?:[a-z]\w*\.)*[A-Z]+\w*)</
      to %r/>|[^\w\s,<]/
      include "#object-types"
      rule 'storage.type.generic.processing' do
        # This is just to support <>'s with no actual type prefix
        from %r/</
        to %r/>|[^\w\s,<]/
      end
    end
    rule 'entity.other.inherited-class.processing' do
      match %r/\b(?:[a-z]\w*(\.))*[A-Z]+\w*/,
        1 => 'keyword.operator.dereference.processing'
    end
  end

  fragment :parameters do
    rule 'storage.modifier.processing' do
      match %r/final/
    end
    include "#primitive-arrays"
    include "#primitive-types"
    include "#object-types"
    rule 'variable.parameter.processing' do
      match %r/\w+/
    end
  end

  fragment :parens do
    rule do
      from %r/\(/
      to %r/\)/
      include "#code"
    end
  end

  fragment :"primitive-arrays" do
    rule 'storage.type.primitive.array.processing' do
      match %r/\b(?:void|boolean|byte|char|color|short|int|float|long|double)(?=(\[\s*\])+)\b/
    end
  end

  fragment :"primitive-types" do
    rule 'storage.type.primitive.processing' do
      # Most of, if not all, types have a casting method of the same name in Processing. Hence the negative lookahead to check for that
      match %r/\b(?:void|boolean|byte|char|color|short|int|float|long|double)(?!\s*\()\b/
    end
  end

  fragment :"processing-classes" do
    rule 'support.type.object.processing' do
      # Includes only Processing-supplied classes - not the standard Java classes (Array, String, etc.), though they're mentioned in the Processing reference
      match %r/\b(P(Applet|Constants|Font|Graphics|Graphics2D|Graphics3D|GraphicsJava2D|Image|Line|Matrix|Matrix2D|Matrix3D|Polygon|Shape|ShapeSVG|SmoothTriangle|Style|Triangle|Vector)|StdXML(Builder|Parser|Reader)|XML(Element|EntityResolver|Exception|ParseException|ValidationException|Validator|Writer))\b/
    end
  end

  fragment :"processing-methods" do
    rule 'support.function.processing' do
      # Note the neg. look-behind at the beginning and the look-ahead at the end. This distinguishes methods like array.size() from size(), and frameRate() from the frameRate variable, respectively
      match %r/\b(?<!\.)(abs|acos|alpha|ambient|ambientLight|append|applyMatrix|arc|arrayCopy|asin|atan|atan2|background|beginCamera|beginRaw|beginRecord|beginShape|bezier|bezierDetail|bezierPoint|bezierTangent|bezierVertex|binary|blend|blendColor|blue|boolean|box|brightness|byte|cache|camera|ceil|char|charAt|color|colorMode|concat|constrain|contract|copy|cos|createFont|createGraphics|createImage|createInput|createOutput|createReader|createWriter|cursor|curve|curveDetail|curvePoint|curveSegments|curveTangent|curveTightness|curveVertex|day|degrees|delay|directionalLight|dist|draw|duration|ellipse|ellipseMode|emissive|endCamera|endRaw|endRecord|endShape|equals|exit|exp|expand|fill|filter|float|floor|frameRate|frustum|get|green|hex|hint|hour|hue|image|imageMode|indexOf|int|join|keyPressed|keyReleased|keyTyped|length|lerp|lerpColor|lightFalloff|lights|lightSpecular|line|link|list|loadBytes|loadFont|loadImage|loadPixels|loadShape|loadSound|loadStrings|log|lookat|loop|mag|map|mask|match|matchAll|max|millis|min|minute|modelX|modelY|modelZ|month|mouseClicked|mouseDragged|mouseMoved|mousePressed|mouseReleased|nf|nfc|nfp|nfs|noCursor|noFill|noise|noiseDetail|noiseSeed|noLights|noLoop|norm|normal|noSmooth|noStroke|noTint|open|openStream|ortho|param|pause|perspective|play|point|pointLight|popMatrix|popStyle|pow|print|printCamera|println|printMatrix|printProjection|pushMatrix|pushStyle|quad|radians|random|randomSeed|rect|rectMode|red|redraw|requestImage|resetMatrix|reverse|rotate|rotateX|rotateY|rotateZ|round|saturation|save|saveBytes|saveFrame|saveStream|saveStrings|scale|screenX|screenY|screenZ|second|selectFolder|selectInput|selectOutput|set|setup|shape|shapeMode|shininess|shorten|sin|size|skewX|skewY|smooth|sort|specular|sphere|sphereDetail|splice|split|splitTokens|spotLight|sq|sqrt|status|stop|str|stroke|strokeCap|strokeJoin|strokeWeight|subset|substring|tan|text|textAlign|textAscent|textDescent|textFont|textLeading|textMode|textSize|texture|textureMode|textWidth|time|tint|toLowerCase|toUpperCase|translate|triangle|trim|unbinary|unhex|unHint|updatePixels|vertex|volume|year)(?=\s*\()/
    end
  end

  fragment :"processing-variables-and-constants" do
    rule 'variable.other.processing' do
      match %r/\b(focused|frameCount|frameRate|height|height|key|keyCode|keyPressed|mouseButton|mousePressed|mouseX|mouseY|online|pixels|pmouseX|pmouseY|screen|width)(?!\s*\()\b/
    end
    rule 'support.constant.processing' do
      match %r/\b(ADD|ALIGN_CENTER|ALIGN_LEFT|ALIGN_RIGHT|ALPHA|ALPHA_MASK|ALT|AMBIENT|ARGB|ARROW|BACKSPACE|BEVEL|BLEND|BLEND|BLUE_MASK|BLUR|CENTER|CENTER_RADIUS|CHATTER|CODED|COMPLAINT|COMPONENT|COMPOSITE|CONCAVE_POLYGON|CONTROL|CONVEX_POLYGON|CORNER|CORNERS|CROSS|CUSTOM|DARKEST|DEGREES|DEG_TO_RAD|DELETE|DIFFERENCE|DIFFUSE|DISABLED|DISABLE_TEXT_SMOOTH|DOWN|ENTER|EPSILON|ESC|GIF|GREEN_MASK|GREY|HALF|HALF_PI|HALF_PI|HAND|HARD_LIGHT|HSB|IMAGE|INVERT|JAVA2D|JPEG|LEFT|LIGHTEST|LINES|LINE_LOOP|LINE_STRIP|MAX_FLOAT|MITER|MODEL|MOVE|MULTIPLY|NORMALIZED|NO_DEPTH_TEST|NTSC|ONE|OPAQUE|OPENGL|ORTHOGRAPHIC|OVERLAY|P2D|P3D|PAL|PERSPECTIVE|PI|PI|PIXEL_CENTER|POINTS|POLYGON|POSTERIZE|PROBLEM|PROJECT|QUADS|QUAD_STRIP|QUARTER_PI|RADIANS|RAD_TO_DEG|RED_MASK|REPLACE|RETURN|RGB|RIGHT|ROUND|SCREEN|SECAM|SHIFT|SOFT_LIGHT|SPECULAR|SQUARE|SUBTRACT|SVIDEO|TAB|TARGA|TEXT|TFF|THIRD_PI|THRESHOLD|TIFF|TRIANGLES|TRIANGLE_FAN|TRIANGLE_STRIP|TUNER|TWO|TWO_PI|TWO_PI|UP|WAIT|WHITESPACE)\b/
    end
  end

  fragment :"storage-modifiers" do
    rule do
      match %r/\b(public|private|protected|static|final|native|synchronized|abstract|threadsafe|transient)\b/,
        1 => 'storage.modifier.processing'
    end
  end

  fragment :strings do
    rule 'string.quoted.double.processing' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.processing'
      to %r/"/,
        0 => 'punctuation.definition.string.end.processing'
      rule 'constant.character.escape.processing' do
        match %r/\\./
      end
    end
    rule 'string.quoted.single.processing' do
      from %r/'/,
        0 => 'punctuation.definition.string.begin.processing'
      to %r/'/,
        0 => 'punctuation.definition.string.end.processing'
      rule 'constant.character.escape.literal.processing' do
        match %r/\\([0-7]{3}|u[A-Fa-f0-9]{4})/
      end
      rule 'constant.character.escape.processing' do
        match %r/\\./
      end
    end
  end

  fragment :throws do
    rule 'meta.throwables.processing' do
      from %r/throws/,
        0 => 'storage.modifier.processing'
      to %r/(?={|;)/
      include "#object-types"
    end
  end

  # FIXME: this fragment is never referenced
  fragment :values do
    include "#strings"
    include "#object-types"
    include "#constants-and-special-vars"
  end
end
