# encoding: utf-8

language 'FXScript' => 'source.fxscript' do
  file_types %w(fxscript)
  key_equivalent "^~F"  # TextMate only
  uuid "43751327-3FD1-4BE7-AD05-136FC552BABA"  # TextMate only

  rule 'meta.function.fxscript' do
    from %r/(^|(?<=;)[ \t]*)on[ \t]+(\w+)[ \t]*(?=\([^\)]*\))/
    to %r'end(;|;?[ \t]*\n|;?[ \t]*//.*[ \t]*\n)'
    both 2 => 'entity.name.function.fxscript'
    rule do
      from %r/\((?=(?i:clip|color|float|image|point|string|value|point3d))/
      to %r/\)/
      rule do
        match %r/((?i:clip|color|float|image|point|string|value|point3d))[ \t]+([^,)]+)/,
          1 => 'support.type.fxscript',
          2 => 'variable.parameter.function.fxscript'
      end
    end
    include "$self"
  end
  rule 'keyword.other.input-control.fxscript' do
    # Input Controls
    from %r/(^|(?<=;)[ \t]*)input[ \t]*/
    to %r/\n/
    include "$self"
    rule do
      match %r/\b(\w+),[ \t]+("[^"]+"),[ \t]+(?i:Angle|CheckBox|Clip|Color|FontList|Label|Point|Popup|RadioGroup|Slider|Text),?/,
        1 => 'variable.other.global.fxscript',
        2 => 'string.quoted.double.fxscript',
        3 => 'support.type.fxscript'
    end
  end
  rule 'storage.type.fxscript' do
    # Data Types
    match %r/(?i:float|image|point|point3d|region|string|value|YUVcolor)\b/
  end
  rule 'keyword.control.fxscrpt' do
    match %r/\b(?i:if|(end|else)( if)?|for|next|return|repeat( While| With (Counter|List)))\b/
  end
  rule 'keyword.other.definition-statements.fxscript' do
    match %r'/b(?i:AlphaType|EffectID|FullFrame|Group|InformationFlag|InvalEntireItem|KeyType|ProducesAlpha|QTEffect|RenderEachFrameWhenStill|WipeCode)/b'
  end
  rule 'keyword.operator.arithmetic.fxscrpt' do
    match %r'!|\$|%|&|\*|\-\-|\-|\+\+|\+|~|==|=|!=|!==|<=|>=|<|>|!|&&|\|\||\?\:|\*=|/=|%=|\+=|\-=|&=|\^='
  end
  rule do
    from %r'(^[ \t]+)?(?=//)',
      1 => 'punctuation.whitespace.comment.leading.fxscript'
    to %r/(?!\G)/
    rule 'comment.line.double-slash.fxscript' do
      from %r'//',
        0 => 'punctuation.definition.comment.fxscript'
      to %r/\n/
    end
  end
  rule 'support.constant.colorspace.fxscript' do
    match %r/(?i:kFormatRGB219|kFormatRGB255|kFormatYUV219)/
  end
  rule 'constant.numeric.fxscript' do
    match %r/\b[0-9]+(\.[0-9]*)?\b/
  end
  rule 'constant.numeric.hex.fxscript' do
    match %r/\b0x([a-fA-F0-9]*)?\b/
  end
  rule 'support.constant.color.fxscript' do
    match %r/(?i:kBlack|kBlue|kCyan|kGray|kGreen|kMagenta|kRed|kWhite|kYellow)/
  end
  rule 'support.constant.formatting.fxscript' do
    match %r/(?i:k16mm|k24fps|k25fps|k30df|k30fps|k35mm|k60df|k60fps|kFloat2|kFloat4|kFloat6|kInteger|kSize)/
  end
  rule 'support.constant.general.fxscript' do
    match %r/(?i:false|kAlpha|kNone|kUndefined|true)\b/
  end
  rule 'support.constant.key.fxscript' do
    match %r/(?i:kKeyAdd|kKeyDarken|kKeyDifference|kKeyHardLight|kKeyLighten|kKeyMultiply|kKeyNormal|kKeyOverlay|kKeyScreen|kKeySoftLight|kKeySubtract)/
  end
  rule 'support.constant.formatting.fxscript' do
    match %r/(?i:k16mm|k24fps|k25fps|k30df|k30fps|k35mm|k60df|k60fps|kFloat2|kFloat4|kFloat6|kInteger|kSize)/
  end
  rule 'support.variable.predeclared.fxscript' do
    match %r/\b(?i:clip1|clip2|dest|duration|exposedBackground|fieldNumber|fieldprocessing|fps|frame|linearRamp|previewing|ratio|renderRes|RGBtoYUV|src1|src2|srcIsGap1|srcIsGap2|srcType1|srcType2|topfield|YUVtoRGB)\b/
  end
  rule 'support.constant.text.fxscript' do
    match %r/(?i:kbold|kbolditalic|kcenterjustify|kitalic|kleftjustify|kplain|krightjustify)/
  end
  rule 'support.constant.shapes.fxscript' do
    match %r/(?i:kDiamond|kRound|kSquare)/
  end
  rule do
    match %r/\b\w+\.(?i:(a)|(r)|(g)|(b)|(y)|(u)|(v))\b/,
      1 => 'entity.name.function.color.alpha.fxscript',
      2 => 'entity.name.function.color.red.fxscript',
      3 => 'entity.name.function.color.green.fxscript',
      4 => 'entity.name.function.color.blue.fxscript',
      5 => 'entity.name.function.color.luma.fxscript',
      6 => 'entity.name.function.color.chroma-u.fxscript',
      7 => 'entity.name.function.color.chroma-v.fxscript'
  end
  rule 'string.quoted.double.fxscript' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.fxscript'
    to %r/"/,
      0 => 'punctuation.definition.string.end.fxscript'
    rule 'constant.character.escape.fxscript' do
      match %r/\\./
    end
  end
  rule 'support.function.composite.fxscript' do
    match %r/\b(?i:Add|AddOffset|Darken|Difference|ImageAnd|ImageOr|ImageXor|Invert|InvertChannel|Lighten|Matte|Multiply|Overlay|Screen|Subtract|UnMultiply)\b/
  end
  rule 'support.function.blit.fxscript' do
    match %r/\b(?i:Blit|BlitRect|MaskCopy|MeshBlit|MeshBlit3D|PagePeel|RegionCopy)\b/
  end
  rule 'support.function.clip.fxscript' do
    match %r/\b(?i:GetLimits|GetReelName|GetTimeCode|GetVideo)/
  end
  rule 'support.function.distort.fxscript' do
    match %r/\b(?i:BumpMap|Cylinder|Displace|Fisheye|OffsetPixels|PondRipple|Ripple|Wave|Whirlpool)\b/
  end
  rule 'support.function.external.fxscript' do
    match %r/\b(?i:Filter|Generator|Transition)\b/
  end
  rule 'support.function.geometry.fxscript' do
    match %r/\b(?i:AngleTo|AspectOf|BoundsOf|CenterOf|Convert2dto3d|convert3dto2d|DimensionsOf|DistTo|Grid|Interpolate|Mesh)\b/
  end
  rule 'support.function.key.fxscript' do
    match %r/\b(?i:BGDiff|BlueScreen|GreenScreen|RGBColorKey|YUVColorKey)\b/
  end
  rule 'support.function.math.fxscript' do
    match %r/\b(?i:Abs|Integer|Sign|Sqrt|Power)\b/
  end
  rule 'support.function.parser.fxscript' do
    match %r/\b(?i:BezToLevelMap|ChromaAngleKey)/
  end
  rule 'support.function.process.fxscript' do
    match %r/\b(?i:Blend|Blur|BlurChannel|Channel(Copy|Fill|Multiply)|ColorTransform|Convolve|Desaturate|Diffuse|DiffuseOffset|LevelMap|MotionBlur|RadialBlur)\b/
  end
  rule 'support.function.shapes.process.fxscript' do
    match %r/\b(?i:CurveTo|DrawSoftDot|FillArc|FillOval|FillPoly|FillRegion|FrameArc|FrameOval|FramePoly|FrameRegion|Line|MakeRect|MakeRegion|OvalRegion|RegionIsEmpty)\b/
  end
  rule 'support.function.string.fxscript' do
    match %r/\b(?i:ASCIIOf|ASCIIToSTring|CharsOf|CountTextLines|FindString|getTextLine|GetTimecodeStringFromClip|Length|NumToString|StringToNum)/
  end
  rule 'support.function.text.fxscript' do
    match %r/\b(?i:DrawString|DrawStringPlain|MeasureString|MeasureStringPlain|ResetText|SetTextFont|SetTextJustify|SetTextSize|SetTextStyle)/
  end
  rule 'support.function.transform.fxscript' do
    match %r/\b(?i:Offset|Offset3d|Outset3d|Rotate|Rotate3d|Scale|Scale3d)\b/
  end
  rule 'support.function.undocumented.fxscript' do
    match %r/\b(?i:getNativeAspect|getNativeSize|FilteredBlitRect|BlurChannel_alt)\b/
  end
  rule 'support.function.debug.fxscript' do
    match %r/\b(?i:debugtext)\b/
  end
  rule 'support.function.utility.fxscript' do
    match %r/\b(?i:Assert|CircleLight|ColorOf|ConvertImage|GetConversionMatrix|GetPixelFormat|Highlight|MatrixConcat|PointTrack|Random(Noise|Seed|Table)?|SetPixelFormat|SysTime|Truncate)\b/
  end
  rule 'support.function.joe.fxscript' do
    # Joe Maller’s personal FXScript Functions, these will be appearing on the FXScript Reference site someday.
    match %r/\b((?i:absNoInt|ArrayFloatAbs|ArrayFloatAverage|ArrayFloatCount|ArrayFloatCountAll|ArrayFloatFlatten|ArrayFloatIndexExists|ArrayFloatInsertionSort|ArrayFloatMax|ArrayFloatMin|ArrayFloatNormalize|ArrayFloatPrint_r|ArrayFloatQuickSort|ArrayFloatSum|ArrayPointCount|ArrayPointReverse|ArrayPointWrap|BlurChannelInPlace|BoundsOfPoly|ceil|CenterOfPoly|ChannelCopyFit|ChannelMultiplyYUV|ChannelScreen|ChannelView|ColorRampImage|ColorReporter|DeInterlace|DeInterlaceFast|DeInterlaceInterpolate|DifferenceMask|DimensionsOfPoly|DrawGridFrames|ease|easeIn|easeMiddle|easeOut|easeS|ErrorReporter|factorial|factorialabsNoInt|FastRotate|FieldDouble|fitPoly|fitRange|fitRect|floor|gcd|getField|indexExistsPt|isFloatArray|isIndexFloat|isIndexFloatArray|makeLevelMapBez|makeThresholdMapBez|max|min|mirrorRect|NumReporter|PlaceFrame|PointInPoly|pt3dReporter|PtReporter|RandomNoiseScaled|RandomSeedFPS|RGBtoYUVcolor|round|scaleToFit|sumNaturals|T_borderFade|whattype|YUVtoRGBcolor))\b/
  end
end
