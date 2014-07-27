# encoding: utf-8

language 'SWIG' => 'source.swig' do
  file_types %w(i swg)
  key_equivalent "^~S"  # TextMate only
  uuid "C781B0D0-BED9-11D9-A141-000393A143CC"  # TextMate only

  # SWIG files contain C or C++ code, so it's logical to derive from the C++ rules
  include "source.c++"
  rule 'keyword.other.directive.inlinecode.swig' do
    match %r/(%)(header|init|inline|native|runtime|wrapper)\b/,
      1 => 'punctuation.definition.keyword.swig'
  end
  rule 'keyword.other.function-parameter.swig' do
    match %r/(\$)([\*&]*[1-9]+(_name|_type|_ltype|_basetype|_mangle|_descriptor){0,1}|action|input|result|symname)\b/,
      1 => 'punctuation.definition.keyword.swig'
  end
  rule 'support.function.type.swig' do
    match %r/\b(in|out|typecheck|arginit|default|check|argout|freearg|newfree|memberin|varin|varout|throws|numinputs)\b/
  end
  rule 'keyword.other.directive.swig' do
    match %r/(%)(apply|callback|clear|constant|contract|define|enddef|extend|feature|ignore|insert|makedefault|module|nocallback|nodefault|rename|typemap|varargs|template)\b/,
      1 => 'punctuation.definition.keyword.swig'
  end
  rule 'meta.preprocessor.swig' do
    match %r/\(\s*(allegrocl|chicken|csharp|guile|java|modula3|mzscheme|ocaml|perl|php|pike|python|ruby|sexp|tcl|xml)\b/,
      1 => 'keyword.control.import.swig'
  end
  rule 'meta.preprocessor.swig' do
    from %r/^\s*(%)\s*(include|import)\b\s+("?[A-Za-z0-9\._]+"?)/
    to %r/$/
    both 1 => 'punctuation.definition.preprocessor.swig',
         2 => 'keyword.control.import.swig',
         3 => 'string.quoted.double.swig'
  end
  rule 'meta.preprocessor.macro.swig' do
    match %r/(%)([A-Za-z]+[A-Za-z0-9_]*)\b/,
      1 => 'punctuation.definition.preprocessor.swig'
  end
  rule 'storage.type.swig' do
    match %r/\bSWIG_TYPECHECK_(POINTER|VOIDPTR|BOOL|UINT8|INT8|UINT16|INT16|UINT32|INT32|UINT64|INT64|UINT128|INT128|INTEGER|FLOAT|DOUBLE|COMPLEX|UNICHAR|UNISTRING|CHAR|STRING|BOOL_ARRAY|INT8_ARRAY|INT16_ARRAY|INT32_ARRAY|INT64_ARRAY|INT128_ARRAY|FLOAT_ARRAY|DOUBLE_ARRAY|CHAR_ARRAY|STRING_ARRAY)\b/
  end
  rule 'source.swig.codeblock' do
    match %r/(%\{|%\})/,
      1 => 'punctuation.section.embedded.swig'
  end
end
