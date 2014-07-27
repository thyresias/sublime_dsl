# encoding: utf-8

language 'qmake Project file' => 'source.qmake', file: 'qmake Project' do
  file_types %w(pro pri)
  key_equivalent "^~Q"  # TextMate only
  uuid "3D54A8F9-17CA-422A-A1D6-DE5F98B9DEF4"  # TextMate only

  rule 'markup.other.template.qmake' do
    from %r/(TEMPLATE)\s*(=)/
    to %r/$\n?/
    both 1 => 'variable.language.qmake',
         2 => 'punctuation.separator.key-value.qmake'
    rule 'keyword.other.qmake' do
      match %r/\b(app|lib|subdirs|vcapp|vclib)\b/
    end
  end
  rule 'markup.other.config.qmake' do
    from %r/(CONFIG)\s*(\+|\-)?(=)/
    to %r/$\n?/
    both 1 => 'variable.language.qmake',
         3 => 'punctuation.separator.key-value.qmake'
    rule 'keyword.other.qmake' do
      match %r/\b(release|debug|warn_(on|off)|qt|opengl|thread|x11|windows|console|dll|staticlib|plugin|designer|uic3|no_lflags_merge|exceptions|rtti|stl|flat|app_bundle|no_batch|qtestlib|ppc|x86)\b/
    end
  end
  rule 'markup.other.qt.qmake' do
    from %r/(QT)\s*(\+|\-)?(=)/
    to %r/$\n?/
    both 1 => 'variable.language.qmake',
         3 => 'punctuation.separator.key-value.qmake'
    rule 'keyword.other.qmake' do
      match %r/\b(core|gui|network|opengl|sql|svg|xml|qt3support)\b/
    end
  end
  rule 'variable.language.qmake' do
    match %r/\b(R(C(C_DIR|_FILE)|E(S_FILE|QUIRES))|M(OC_DIR|AKE(_MAKEFILE|FILE(_GENERATOR)?))|S(RCMOC|OURCES|UBDIRS)|HEADERS|YACC(SOURCES|IMPLS|OBJECTS)|CONFIG|T(RANSLATIONS|ARGET(_(EXT|\d+(\.\d+\.\d+)?))?)|INCLUDEPATH|OBJ(MOC|ECTS(_DIR)?)|D(SP_TEMPLATE|ISTFILES|E(STDIR(_TARGET)?|PENDPATH|F(_FILE|INES))|LLDESTDIR)|UI(C(IMPLS|OBJECTS)|_(SOURCES_DIR|HEADERS_DIR|DIR))|P(RE(COMPILED_HEADER|_TARGETDEPS)|OST_TARGETDEPS)|V(PATH|ER(SION|_(M(IN|AJ)|PAT)))|Q(MAKE(SPEC|_(RUN_C(XX(_IMP)?|C(_IMP)?)|MOC_SRC|C(XXFLAGS_(RELEASE|MT(_D(BG|LL(DBG)?))?|SHLIB|THREAD|DEBUG|WARN_O(N|FF))|FLAGS_(RELEASE|MT(_D(BG|LL(DBG)?))?|SHLIB|THREAD|DEBUG|WARN_O(N|FF))|LEAN)|TARGET|IN(CDIR(_(X|THREAD|OPENGL|QT))?|FO_PLIST)|UIC|P(RE_LINK|OST_LINK)|EXT(_(MOC|H|CPP|YACC|OBJ|UI|PRL|LEX)|ENSION_SHLIB)|Q(MAKE|T_DLL)|F(ILETAGS|AILED_REQUIREMENTS)|L(N_SHLIB|I(B(S(_(RT(MT)?|X|CONSOLE|THREAD|OPENGL(_QT)?|QT(_(OPENGL|DLL))?|WINDOWS))?|_FLAG|DIR(_(X|OPENGL|QT|FLAGS))?)|NK_SHLIB_CMD)|FLAGS(_(RELEASE|S(H(LIB|APP)|ONAME)|CONSOLE(_DLL)?|THREAD|DEBUG|PLUGIN|QT_DLL|WINDOWS(_DLL)?))?)|A(R_CMD|PP_(OR_DLL|FLAG))))?|T_THREAD)|FORMS|L(IBS|EX(SOURCES|IMPLS|OBJECTS)))\b/
  end
  rule 'markup.other.assignment.qmake' do
    # FIXME: (warning) character class has duplicated range
    from %r/(\b([\w\d_]+\.[\w\d_]+|[A-Z_]+))?\s*(\+|\-)?(=)/
    to %r/$\n?/
    both 1 => 'variable.other.qmake',
         4 => 'punctuation.separator.key-value.qmake'
    rule 'variable.other.qmake' do
      # FIXME: (warning) character class has duplicated range
      match %r/(\$\$)([A-Z_]+|[\w\d_]+\.[\w\d_]+)|\$\([\w\d_]+\)/,
        1 => 'punctuation.definition.variable.qmake'
    end
    rule 'constant.other.filename.qmake' do
      # FIXME: (warning) character class has duplicated range
      match %r'[\w\d\/_\-\.\:]+'
    end
    rule 'string.quoted.double.qmake' do
      from %r/"/,
        0 => 'punctuation.definition.string.begin.qmake'
      to %r/"/,
        0 => 'punctuation.definition.string.end.qmake'
    end
    rule 'string.interpolated.qmake' do
      from %r/`/,
        0 => 'punctuation.definition.string.begin.qmake'
      to %r/`/,
        0 => 'punctuation.definition.string.end.qmake'
    end
    rule 'markup.other.assignment.continuation.qmake' do
      from %r/(\\)/
      to %r/^[^#]/
      both 1 => 'string.regexp.qmake'
      rule 'comment.line.number-sign.qmake' do
        match %r/(#).*$\n?/,
          1 => 'punctuation.definition.comment.qmake'
      end
    end
    rule do
      from %r/(^[ \t]+)?(?=#)/,
        1 => 'punctuation.whitespace.comment.leading.qmake'
      to %r/(?!\G)/
      rule 'comment.line.number-sign.qmake' do
        from %r/#/,
          0 => 'punctuation.definition.comment.qmake'
        to %r/\n/
      end
    end
  end
  rule do
    # entity.name.function.qmake
    content_scope "variable.parameter.qmake"
    from %r/\b(basename|CONFIG|contains|count|dirname|error|exists|find|for|include|infile|isEmpty|join|member|message|prompt|quote|sprintf|system|unique|warning)\s*(\()/,
      1 => 'entity.name.function.qmake',
      2 => 'punctuation.definition.parameters.qmake'
    to %r/(\))/,
      1 => 'punctuation.definition.parameters.qmake'
  end
  rule 'keyword.other.scope.qmake' do
    match %r/\b(unix|win32|mac|debug|release)\b/
  end
  rule do
    from %r/(^[ \t]+)?(?=#)/,
      1 => 'punctuation.whitespace.comment.leading.qmake'
    to %r/(?!\G)/
    rule 'comment.line.number-sign.qmake' do
      from %r/#/,
        0 => 'punctuation.definition.comment.qmake'
      to %r/\n/
    end
  end
end
