# encoding: utf-8

language 'Lua' => 'source.lua' do
  # Lua Syntax: version 0.8
  file_types %w(lua)
  first_line_match %r/\A#!.*?\blua\b/
  key_equivalent "^~L"  # TextMate only
  uuid "93E017CC-6F27-11D9-90EB-000D93589AF7"  # TextMate only

  rule 'meta.function.lua' do
    match %r/\b(function)(?:\s+([a-zA-Z_.:]+[.:])?([a-zA-Z_]\w*)\s*)?(\()([^)]*)(\))/,
      1 => 'keyword.control.lua',
      2 => 'entity.name.function.scope.lua',
      3 => 'entity.name.function.lua',
      4 => 'punctuation.definition.parameters.begin.lua',
      5 => 'variable.parameter.function.lua',
      6 => 'punctuation.definition.parameters.end.lua'
  end
  rule 'constant.numeric.lua' do
    match %r/(?<![\d.])\s0x[a-fA-F\d]+|\b\d+(\.\d+)?([eE]-?\d+)?|\.\d+([eE]-?\d+)?/
  end
  rule 'string.quoted.single.lua' do
    from %r/'/,
      0 => 'punctuation.definition.string.begin.lua'
    to %r/'/,
      0 => 'punctuation.definition.string.end.lua'
    rule 'constant.character.escape.lua' do
      match %r/\\./
    end
  end
  rule 'string.quoted.double.lua' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.lua'
    to %r/"/,
      0 => 'punctuation.definition.string.end.lua'
    rule 'constant.character.escape.lua' do
      match %r/\\./
    end
  end
  rule do
    content_scope "meta.embedded.lua"
    from %r/(?<=\.cdef)\s*(\[(=*)\[)/,
      0 => 'string.quoted.other.multiline.lua',
      1 => 'punctuation.definition.string.begin.lua'
    to %r/(\]§2\])/,
      0 => 'string.quoted.other.multiline.lua',
      1 => 'punctuation.definition.string.end.lua'
    include "source.c"
  end
  rule 'string.quoted.other.multiline.lua' do
    from %r/(?<!--)\[(=*)\[/,
      0 => 'punctuation.definition.string.begin.lua'
    to %r/\]§1\]/,
      0 => 'punctuation.definition.string.end.lua'
  end
  rule 'comment.block.lua' do
    from %r/--\[(=*)\[/
    to %r/\]§1\]/
    both 0 => 'punctuation.definition.comment.lua'
  end
  rule do
    from %r/(^[ \t]+)?(?=--(?!\[\[))/,
      1 => 'punctuation.whitespace.comment.leading.lua'
    to %r/(?!\G)/
    rule 'comment.line.double-dash.lua' do
      from %r/--/,
        0 => 'punctuation.definition.comment.lua'
      to %r/\n/
    end
  end
  rule 'keyword.control.lua' do
    match %r/\b(break|do|else|for|if|elseif|return|then|repeat|while|until|end|function|local|in)\b/
  end
  rule 'constant.language.lua' do
    match %r/(?<![^.]\.|:)\b(false|nil|true|_G|_VERSION|math\.(pi|huge))\b|(?<![.])\.{3}(?!\.)/
  end
  rule 'variable.language.self.lua' do
    match %r/(?<![^.]\.|:)\b(self)\b/
  end
  rule 'support.function.lua' do
    match %r/(?<![^.]\.|:)\b(assert|collectgarbage|dofile|error|getfenv|getmetatable|ipairs|loadfile|loadstring|module|next|pairs|pcall|print|rawequal|rawget|rawset|require|select|setfenv|setmetatable|tonumber|tostring|type|unpack|xpcall)\b(?=\s*(?:[({"']|\[\[))/
  end
  rule 'support.function.library.lua' do
    match %r/(?<![^.]\.|:)\b(coroutine\.(create|resume|running|status|wrap|yield)|string\.(byte|char|dump|find|format|gmatch|gsub|len|lower|match|rep|reverse|sub|upper)|table\.(concat|insert|maxn|remove|sort)|math\.(abs|acos|asin|atan2?|ceil|cosh?|deg|exp|floor|fmod|frexp|ldexp|log|log10|max|min|modf|pow|rad|random|randomseed|sinh?|sqrt|tanh?)|io\.(close|flush|input|lines|open|output|popen|read|tmpfile|type|write)|os\.(clock|date|difftime|execute|exit|getenv|remove|rename|setlocale|time|tmpname)|package\.(cpath|loaded|loadlib|path|preload|seeall)|debug\.(debug|[gs]etfenv|[gs]ethook|getinfo|[gs]etlocal|[gs]etmetatable|getregistry|[gs]etupvalue|traceback))\b(?=\s*(?:[({"']|\[\[))/
  end
  rule 'keyword.operator.lua' do
    match %r/\b(and|or|not)\b/
  end
  rule 'support.function.any-method.lua' do
    match %r/\b([A-Za-z_]\w*)\b(?=\s*(?:[({"']|\[\[))/
  end
  rule 'variable.other.lua' do
    match %r/(?<=[^.]\.|:)\b([A-Za-z_]\w*)/
  end
  rule 'keyword.operator.lua' do
    match %r'\+|-|%|#|\*|\/|\^|==?|~=|<=?|>=?|(?<!\.)\.{2}(?!\.)'
  end
end
