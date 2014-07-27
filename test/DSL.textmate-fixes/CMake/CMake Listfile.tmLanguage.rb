# encoding: utf-8

language 'CMake Listfile' => 'source.cmake' do
  file_types %w(CMakeLists.txt cmake)
  key_equivalent "^~C"  # TextMate only
  uuid "6E939107-5C78-455D-A7E6-1107ADC777C2"  # TextMate only

  rule 'meta.function-call.command.cmake' do
    content_scope "meta.function-call.function.cmake"
    from %r/(?i)^\s*(function|macro)\s*(\()/,
      1 => 'support.function.cmake',
      2 => 'punctuation.definition.parameters.begin.command.cmake'
    to %r/(\))/,
      1 => 'punctuation.definition.parameters.end.command.cmake'
    include "#argument-constants"
    include "#items"
  end
  rule 'meta.function-call.command.cmake' do
    # The command list is simply generated with:
    #         cmake --help-command-list | ruby /Library/Application\ Support/TextMate/Bundles/Objective-C.tmbundle/Support/list_to_regexp.rb | pbcopy
    from %r/(?ix)
      ^\s*  # Start of the line with optional preceding space
      (?:  # Either a control flow keyword
        ((?:end)?(?:(?:else)?if|while|foreach)|return|else)
        |  # Or a function
        (s(tring|ite_name|ource_group|ubdir(s|_depends)|e(t(_(source_files_properties|t(ests_properties|arget_properties)|directory_properties|property))?|parate_arguments))|c(onfigure_file|reate_test_sourcelist|make(_(policy|minimum_required)| version 2.8.7))|t(arget_link_libraries|ry_(compile|run))|i(n(stall(_(targets|programs|files))?|clude(_(directories|external_msproject|regular_expression))?)|f)|o(utput_required_files|ption)|define_property|u(se_mangled_mesa|nset|tility_source)|project|e(n(d(if|f(oreach|unction)|while|macro)|able_(testing|language))|lse(if)?|x(port(_library_dependencies)?|ec(_program|ute_process)))|variable_(watch|requires)|qt_wrap_(cpp|ui)|f(i(nd_(p(a(ckage|th)|rogram)|file|library)|le)|oreach|unction|ltk_wrap_ui)|w(hile|rite_file)|l(i(st|nk_(directories|libraries))|oad_c(ommand|ache))|a(dd_(subdirectory|custom_(command|target)|test|de(pendencies|finitions)|executable|library)|ux_source_directory)|re(turn|move(_definitions)?)|get_(source_file_property|cmake_property|t(est_property|arget_property)|directory_property|property|filename_component)|m(essage|a(cro|th|ke_directory|rk_as_advanced))|b(uild_(name|command)|reak))
        |  # Or some function we don’t know about
        (\w+)
      )
      \s*(\()  # Finally, the opening parenthesis for the argument list
      /,
      1 => 'keyword.control.cmake',
      2 => 'support.function.cmake',
      3 => 'punctuation.definition.parameters.begin.command.cmake'
    to %r/(\))/,
      1 => 'punctuation.definition.parameters.end.command.cmake'
    include "#argument-constants"
    include "#items"
  end
  include "#items"

  fragment :"argument-constants" do
    rule 'keyword.other.argument-separator.cmake' do
      # There is a script in bundle support for generating this list:
      #         ruby arg_separators.rb | /Library/Application\ Support/TextMate/Bundles/Objective-C.tmbundle/Support/list_to_regexp.rb | pbcopy
      match %r/\b(R(UN(_(RESULT_VAR|OUTPUT_VARIABLE)|TIME(_DIRECTORY)?)|E(G(ULAR_EXPRESSION|EX)|MOVE(_(RECURSE|ITEM|DUPLICATES|AT))?|S(OURCE|ULT_VAR(IABLE)?)|NAME|TURN_VALUE|PLACE|VERSE|QUIRED(_VARIABLE(1|2))?|LATIVE(_PATH)?|A(D(_WITH_PREFIX)?|LPATH))|AN(GE|DOM(_SEED)?))|G(R(OUP_(READ|EXECUTE)|EATER)|ET|LOB(_RECURSE|AL)?)|M(ODULE|D5|ESSAGE|A(COSX_BUNDLE|TCH(ES|ALL)?|IN_DEPENDENCY|KE_DIRECTORY))|B(RIEF_DOCS|UNDLE|EFORE)|S(H(OW_PROGRESS|A(RED|1|2(24|56)|384|512))|YSTEM|CRIPT|T(R(GREATER|I(NGS|P)|EQUAL|LESS)|AT(IC|US))|O(RT|URCE(S)?)|UBSTRING|E(ND_ERROR|T))|H(INTS|EX)|N(NNN|O(_(MODULE|S(YSTEM_ENVIRONMENT_PATH|OURCE_PERMISSIONS)|HEX_CONVERSION|CMAKE_(BUILDS_PATH|SYSTEM_PA(CKAGE_REGISTRY|TH)|PA(CKAGE_REGISTRY|TH)|ENVIRONMENT_PATH|FIND_ROOT_PATH)|DEFAULT_PATH|POLICY_SCOPE)|T(E(QUAL)?)?)|EW(LINE_(STYLE|CONSUME))?|AME(S(PACE)?|_WE|LINK_(SKIP|ONLY))?)|C(RLF|M(P(0017)?|AKE_(MODULE_PATH|CROSSCOMPILING|DISABLE_FIND_PACKAGE_|F(IND_ROOT_PATH_BOTH|LAGS)))?|O(M(M(ENT|AND(_NAME)?)|P(ILE_(RESULT_VAR|OUTPUT_VARIABLE|DEFINITIONS)|ONENT(S)?|ARE))|NFIG(S|UR(E(_FILE)?|ATION(S)?))|DE|PY(_FILE|ONLY)?)|VS|LEAR|ACHE(D_VARIABLE)?)|_(COMMAND|VERSION(_(M(INOR|AJOR)|COUNT|TWEAK|PATCH))?)|T(RUE|IMEOUT|O(_(NATIVE_PATH|CMAKE_PATH)|UPPER|LOWER)|EST(_VARIABLE)?|ARGET(S|_FILE)?)|I(MP(ORTED|LICIT_DEPENDS)|S_(SYMLINK|NEWER_THAN|DIRECTORY|ABSOLUTE)|N(S(TALL|ERT)|HERITED|CLUDE_(INTERNALS|DIRECTORIES)|PUT_FILE|ACTIVITY_TIMEOUT)?|TEMS|DE)|O(R|NLY(_CMAKE_FIND_ROOT_PATH)?|UTPUT(_(STRIP_TRAILING_WHITESPACE|DIRECTORY|VARIABLE|QUIET|FILE))?|PTIONAL|FF(SET)?|WNER_(READ|EXECUTE|WRITE)|LD)|D(BAR|IRECTORY(_PERMISSIONS)?|O(S|C|WNLOAD)|E(STINATION|PENDS|FIN(ITION|ED))|FOO)|U(SE_SOURCE_PERMISSIONS|N(IX|KNOWN)|PLOAD)|P(R(IVATE_HEADER|O(GRAM(S|_ARGS)?|JECT_NAME|PERT(Y|IES))|E(_(BUILD|LINK)|ORDER))|O(ST_BUILD|P|LICY)|U(BLIC_HEADER|SH)|ERMISSIONS|A(RENT_SCOPE|CKAGE(_(VERSION(_(COMPATIBLE|UNSUITABLE|EXACT))?|FIND_(NAME|VERSION(_(M(INOR|AJOR)|COUNT|TWEAK|PATCH))?)))?|T(H(S|_(SUFFIXES|TO_MESA))?|TERN)))|E(RROR_(STRIP_TRAILING_WHITESPACE|VARIABLE|QUIET|FILE)|X(CLUDE(_FROM_ALL)?|T(RA_INCLUDE)?|ISTS|P(R|ORT|ECTED_MD5)|ACT)|SCAPE_QUOTES|NV|QUAL)|V(S|ER(BATIM|SION(_(GREATER|EQUAL|LESS))?)|A(R(2|IABLE)?|LUE))|QUIET|F(RAMEWORK|I(ND|LE(S(_MATCHING)?|_PERMISSIONS)?)|O(RCE|LLOW_SYMLINKS)|U(NCTION|LL_DOCS)|ATAL_ERROR)|W(RITE|IN(32|DOWS)|ORKING_DIRECTORY|ARNING)|L(I(MIT(_(COUNT|INPUT|OUTPUT))?|BRARY|STS|NK_(INTERFACE_LIBRARIES|DIRECTORIES|P(RIVATE|UBLIC)|LIBRARIES))|OG|D_LIBRARY_PATH|E(SS|NGTH(_M(INIMUM|AXIMUM))?)|F)|A(R(G(S|_VAR)|CHIVE)|BSOLUTE|SCII|ND|UTHOR_WARNING|PPEND(_STRING)?|FTER|L(PHABET|L)))\b/
    end
  end

  fragment :comments do
    rule do
      from %r/(^[ \t]+)?(?=#)/,
        1 => 'punctuation.whitespace.comment.leading.cmake'
      to %r/(?!\G)/
      rule 'comment.line.number-sign.cmake' do
        from %r/#/,
          0 => 'punctuation.definition.comment.cmake'
        to %r/\n/
      end
    end
  end

  fragment :constants do
    rule 'constant.language.boolean.cmake' do
      match %r/(?i)\b(FALSE|OFF|NO|(\w+-)?NOTFOUND)\b/
    end
  end

  fragment :escapes do
    rule 'constant.character.escape.cmake' do
      # FIXME: (error) '#$' will be interpreted as interpolation: escape '#' as '\#'
      match %r/\\["()\#$^ \\]/
    end
  end

  fragment :items do
    include "#comments"
    include "#constants"
    include "#strings"
    include "#variables"
    include "#escapes"
  end

  fragment :strings do
    rule 'string.quoted.double.cmake' do
      match %r/(?i)"(FALSE|OFF|NO|(.+-)?NOTFOUND)"/,
        1 => 'constant.language.boolean.cmake'
    end
    rule 'string.quoted.double.cmake' do
      from %r/"/
      to %r/"/
      rule 'constant.character.escape.cmake' do
        match %r/\\./
      end
      include "#variables"
    end
  end

  fragment :variables do
    rule 'variable.cmake' do
      from %r/\$(ENV)?\{/,
        0 => 'punctuation.definition.variable.begin.cmake'
      to %r/\}/,
        0 => 'punctuation.definition.variable.end.cmake'
      include "#variables"
      rule do
        match %r/\w+/
      end
    end
  end
end
