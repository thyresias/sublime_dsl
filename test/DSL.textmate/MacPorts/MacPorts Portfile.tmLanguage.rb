# encoding: utf-8

language 'MacPorts Portfile' => 'source.tcl.macports' do
  file_types %w(Portfile)
  uuid "33EC56FE-2BD4-4B73-A6CD-73395F4E5E58"  # TextMate only

  rule do
    # special case for github PortGroup
    from %r/^\s*(PortGroup)\s+github(?!\S)/,
      1 => 'keyword.other.tcl.macports'
    to %r/$.^/
    include "$base"
    rule 'keyword.other.tcl.macports' do
      match %r/^\s*github\.(author|project|version|tag_prefix|livecheck_type|homepage|raw|master_sites|tarball_from|setup|handle_tarball_from)(?!\S)/
    end
  end
  rule do
    # special case for ruby PortGroup
    from %r/^\s*(PortGroup)\s+ruby(?!\S)/,
      1 => 'keyword.other.tcl.macports'
    to %r/$.^/
    include "$base"
    rule 'keyword.other.tcl.macports' do
      match %r/^\s*ruby\.setup(?!\S)/
    end
  end
  rule do
    # special case for the perl5 PortGroup
    from %r/^\s*(PortGroup)\s+perl5(?!\S)/,
      1 => 'keyword.other.tcl.macports'
    to %r/$.^/
    include "$base"
    rule 'keyword.other.tcl.macports' do
      match %r/^\s*perl5\.setup(?!\S)/
    end
  end
  rule do
    # Base commands
    match %r/^\s*(PortSystem|PortGroup)(?!\S)/,
      1 => 'keyword.other.tcl.macports'
  end
  rule do
    # Procs defined with the `commands` keyword (ignore use_option-{delete,append} as it is useless)
    match %r/^\s*(use_(?:configure|build|automake|autoconf|xmkmf|libtool|destroot|extract|cvs|svn|patch|test)|(?:configure|build|automake|autoconf|xmkmf|libtool|destroot|extract|cvs|svn|patch|test)\.(?:dir|(?:pre_|post_)?args|env|type|cmd)(?:-(?:delete|append))?)(?!\S)/,
      1 => 'keyword.other.tcl.macports'
  end
  rule do
    # Procs defined with the `target_provides` keyword
    match %r/^\s*((?:(?:pre|post)-)?(?:activate|build|checksum|clean|configure|destroot|distcheck|extract|fetch|install|livecheck|main|mirror|patch|pkg|mpkg|submit|test))(?!\S)/,
      1 => 'keyword.other.tcl.macports'
  end
  rule do
    # Procs defined with the `options` keyword
    match %r/^\s*((?:build\.target|categories|checksum\.skip|checksums|configure\.(?:(?:c|cpp|cxx|objc|ld|f|f90|fc)flags|libs|classpath|perl|python|ruby|install)|cvs\.(?:date|module|password|root|tag)|default_variants|depends_(?:build|lib|run)|destroot\.(?:clean|destdir|keepdirs|target|umask|violate_mtree)|dist_subdir|distcheck\.check|distfiles|distname|distpath|epoch|extract\.(?:only|suffix)|fetch\.(?:password|type|use_epsv|user)|filesdir|gnustep\.domain|homepage|install\.(?:group|user)|libpath|livecheck\.(?:check|md5|name|distname|regex|type|url|version)|license|maintainers|(?:master|patch)_sites(?:\.mirror_subdir)?|name|os\.(?:arch|endian|platform|version)|patchfiles|platforms|portdbpath|portname|prefix|revision|sources_conf|startupitem\.(?:create|executable|init|logevents|logfile|name|pidfile|requires|restart|start|stop|type)|svn\.(?:tag|url)|test\.(?:run|target)|use_bzip2|use_zip|version|workdir|worksrcdir|xcode\.(?:build\.settings|configuration|destroot\.(?:path|settings|type)|project|target)|zope\.need_subdir|macosx_deployment_target)(?:-(?:delete|append))?)(?!\S)/,
      1 => 'keyword.other.tcl.macports'
  end
  rule do
    match %r/^\s*(universal_variant)(?!\S)/,
      1 => 'keyword.other.tcl.macports'
  end
  rule do
    # special-case description and long_description for backslash-newline escapes and string scoping
    content_scope "string.unquoted.tcl.macports"
    from %r/^\s*((?:long_)?description)(?!\S)/,
      1 => 'keyword.other.tcl.macports'
    to %r/[\n;]/
    include "#escape"
    include "#string"
    include "#braces"
    include "#embedded"
    include "#variable"
  end
  rule 'meta.variant.tcl.macports' do
    from %r/^(variant)(?!\S)/
    to %r/\n/
    both 1 => 'keyword.other.variant.tcl.macports'
    rule 'keyword.other.variant.tcl.macports' do
      match %r/(?<=\s)(?:provides|requires|conflicts|description)(?!\S)/
    end
    rule 'entity.name.function.variant.tcl.macports' do
      match %r/(?<=\s)([\w-]+)/
    end
    include "#string"
    rule do
      from %r/(\{)/,
        1 => 'punctuation.section.variant.tcl.macports'
      to %r/(\})/,
        1 => 'punctuation.terminator.variant.tcl.macports'
      include "source.tcl.macports"
    end
  end
  rule 'meta.variant.platform.tcl.macports' do
    from %r/^(platform)(?:\s+(\S+))?(?:\s+(\S+))?(?:\s+(\S+))?\s+(\{)/,
      1 => 'keyword.other.variant.platform.tcl.macports',
      2 => 'entity.name.function.variant.platform.tcl.macports',
      5 => 'punctuation.section.variant.platform.tcl.macports'
    to %r/(\})/,
      1 => 'punctuation.terminator.variant.platform.tcl.macports'
    include "source.tcl.macports"
  end
  rule 'keyword.other.tcl.macports' do
    match %r/(?<=^|[\[{;])\s*(adduser|addgroup|dirSize|binaryInPath|archiveTypeIsSupported|variant_isset|xinstall|system|reinplace|flock|readdir|strsed|mkstemp|mktemp|existsuser|existsgroup|nextuid|nextgid|md5|find|filemap|rpm-vercomp|rmd160|sha1|compat|umask|sudo|mkfifo|unixsocketpair|mkchannelfromfd|pipe|curl|readline|rl_history|getuid|geteuid|setuid|seteuid|name_to_uid|uid_to_name|ldelete|delete|include)\b/
  end
  include "source.tcl"

  fragment :"bare-string" do
    rule do
      # imported from Tcl grammar
      from %r/(?:^|(?<=\s))"/
      to %r/"(\S*)/,
        1 => 'invalid.illegal.tcl'
      include "#escape"
      include "#variable"
    end
  end

  fragment :braces do
    rule do
      # imported from Tcl grammar
      from %r/(?:^|(?<=\s))\{/
      to %r/\}(\S*)/,
        1 => 'invalid.illegal.tcl'
      rule 'constant.character.escape.tcl' do
        match %r/\\[{}\n]/
      end
      include "#inner-braces"
    end
  end

  fragment :embedded do
    rule 'source.tcl.embedded' do
      # imported from Tcl grammar
      from %r/\[/,
        0 => 'punctuation.section.embedded.begin.tcl'
      to %r/\]/,
        0 => 'punctuation.section.embedded.end.tcl'
      include "source.tcl.macports"
    end
  end

  fragment :escape do
    rule 'constant.character.escape.tcl' do
      # imported from Tcl grammar
      match %r/\\(\d{1,3}|x[a-fA-F0-9]+|u[a-fA-F0-9]{1,4}|.|\n)/
    end
  end

  fragment :"inner-braces" do
    rule do
      # imported from Tcl grammar
      from %r/\{/
      to %r/\}/
      rule 'constant.character.escape.tcl' do
        match %r/\\[{}\n]/
      end
      include "#inner-braces"
    end
  end

  fragment :string do
    rule 'string.quoted.double.tcl' do
      # imported from Tcl grammar
      from %r/(?:^|(?<=\s))(?=")/
      to %r//
      to_last true
      include "#bare-string"
    end
  end

  fragment :variable do
    rule 'variable.other.tcl' do
      # imported from Tcl grammar
      match %r/(\$)([a-zA-Z0-9_:]+(\([^\)]+\))?|\{[^\}]*\})/,
        1 => 'punctuation.definition.variable.tcl'
    end
  end
end
