# encoding: utf-8

language 'Bison' => 'source.bison' do
  file_types %w(y)
  uuid "1AA6D027-D1AF-4868-951D-1634BD88D910"  # TextMate only

  rule 'meta.prologue.bison' do
    content_scope "source.c"
    from %r/^%\{/
    to %r/%\}/
    include "source.c"
  end
  rule 'meta.declarations.bison' do
    from %r/^(?!%%$)/
    to %r/^(?=%%$)/
  end
  rule do
    from %r/^%%$/
    to %r/$.^/
    rule do
      content_scope "meta.rules.bison"
      from %r/^(?!%%$)/
      to %r/^(?=%%$)/
      include "source.c"
    end
    rule do
      content_scope "meta.epilogue.bison"
      from %r/^%%$/
      to %r/$.^/
      rule 'source.c' do
        from %r/^/
        to %r/$.^/
        include "source.c"
      end
    end
  end
end
