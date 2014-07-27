# encoding: utf-8

language 'CMake Cache' => 'source.cache.cmake' do
  file_types %w(CMakeCache.txt)
  key_equivalent "^~C"  # TextMate only
  uuid "B4264EAE-087F-403D-A84B-C4B16EB885D3"  # TextMate only

  include "#comments"
  include "#assignation"

  fragment :assignation do
    rule 'variable.cmake' do
      # FIXME: (warning) character class has duplicated range
      match %r/([a-zA-Z0-9_\-\d]+)(:)(STRING|FILE|FILEPATH|BOOL|INTERNAL|STATIC)(\=)(.*)/,
        1 => 'variable.language.cache.cmake',
        2 => 'keyword.other.argument-separator.cmake',
        3 => 'constant.language.cache.cmake',
        4 => 'keyword.operator.cmake',
        5 => 'string.unquoted.cmake'
    end
  end

  fragment :comments do
    rule do
      from %r'(^[ \t]+)?(?=//|\#)',
        1 => 'punctuation.whitespace.comment.leading.cmake'
      to %r/(?!\G)/
      rule 'comment.line.double-slash.cmake' do
        from %r'//',
          0 => 'punctuation.definition.comment.cmake'
        to %r/\n/
      end
      rule 'comment.line.sign-line.cmake' do
        from %r/\#/,
          0 => 'punctuation.definition.comment.cmake'
        to %r/\n/
      end
    end
  end
end
