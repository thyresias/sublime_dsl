# encoding: utf-8

language 'Apache' => 'source.apache-config' do
  file_types %w(conf htaccess)
  key_equivalent "^~A"  # TextMate only
  uuid "023D670E-80F1-11D9-9BD1-00039398C572"  # TextMate only

  rule do
    from %r/(^[ \t]+)?(?=#)/,
      1 => 'punctuation.whitespace.comment.leading.apache-config'
    to %r/(?!\G)/
    rule 'comment.line.number-sign.apache-config' do
      from %r/#/,
        0 => 'punctuation.definition.comment.apache-config'
      to %r/\n/
    end
  end
  rule 'meta.tag.any.html' do
    match %r'^[ ]*(<)([a-zA-Z0-9:]+)[^>]*(>(<)/)(\2)(>)',
      1 => 'punctuation.definition.tag.apache-config',
      2 => 'entity.name.tag.apache-config',
      3 => 'punctuation.definition.tag.apache-config',
      4 => 'meta.scope.between-tag-pair.apache-config',
      5 => 'entity.name.tag.apache-config',
      6 => 'punctuation.definition.tag.apache-config'
  end
  rule 'meta.vhost.apache-config' do
    from %r/^[ ]*((<)(VirtualHost)(?:[ ]+([^>]+))?(>))/,
      1 => 'meta.tag.apache-config',
      2 => 'punctuation.definition.tag.apache-config',
      3 => 'entity.name.tag.apache-config',
      4 => 'meta.toc-list.virtual-host.apache-config',
      5 => 'punctuation.definition.tag.apache-config'
    to %r'^[ ]*((</)(VirtualHost)[^>]*(>))',
      1 => 'meta.tag.apache-config',
      2 => 'punctuation.definition.tag.apache-config',
      3 => 'entity.name.tag.apache-config',
      4 => 'punctuation.definition.tag.apache-config'
    include "$base"
  end
  rule 'meta.directory.apache-config' do
    from %r/^[ ]*((<)(Directory(?:Match)?)(?:[ ]+([^>]+))?(>))/,
      1 => 'meta.tag.apache-config',
      2 => 'punctuation.definition.tag.apache-config',
      3 => 'entity.name.tag.apache-config',
      4 => 'meta.toc-list.directory.apache-config',
      5 => 'punctuation.definition.tag.apache-config'
    to %r'^[ ]*((</)(Directory(?:Match)?)[^>]*(>))',
      1 => 'meta.tag.apache-config',
      2 => 'punctuation.definition.tag.apache-config',
      3 => 'entity.name.tag.apache-config',
      4 => 'punctuation.definition.tag.apache-config'
    include "$base"
  end
  rule 'meta.location.apache-config' do
    from %r/^[ ]*((<)(Location(?:Match)?)(?:[ ]+([^>]+))?(>))/,
      1 => 'meta.tag.apache-config',
      2 => 'punctuation.definition.tag.apache-config',
      3 => 'entity.name.tag.apache-config',
      4 => 'meta.toc-list.location.apache-config',
      5 => 'punctuation.definition.tag.apache-config'
    to %r'^[ ]*((</)(Location(?:Match)?)[^>]*(>))',
      1 => 'meta.tag.apache-config',
      2 => 'punctuation.definition.tag.apache-config',
      3 => 'entity.name.tag.apache-config',
      4 => 'punctuation.definition.tag.apache-config'
    include "$base"
  end
  rule 'source.include.apache-config' do
    from %r/(^Include)/,
      1 => 'support.constant.include.start.apache-config'
    to %r/(\n)/,
      1 => 'support.constant.include.end.apache-config'
    rule 'text.include.apache-config' do
      match %r/(.*)/
    end
  end
  rule do
    from %r/^[ ]*\b(RewriteCond)\b/
    to %r/$/
    both 1 => 'support.constant.rewritecond.apache-config'
    rule do
      from %r/[ ]+/
      to %r/$/
      include "#vars"
      rule 'string.regexp.rewrite-test.apache-config' do
        match %r/[^ %\n]+/
      end
      rule do
        from %r/[ ]+/
        to %r/$/
        rule 'string.other.rewrite-condition.apache-config' do
          match %r/[^ %\n]+/
        end
        rule do
          match %r/[ ]+(\[[^\]]+\])/,
            1 => 'string.regexp.rewrite-operator.apache-config'
        end
      end
    end
  end
  rule do
    from %r/^[ ]*\b(RewriteRule)\b/
    to %r/$/
    both 1 => 'support.constant.rewriterule.apache-config'
    rule do
      from %r/[ ]+/
      to %r/$/
      include "#vars"
      rule 'string.regexp.rewrite-pattern.apache-config' do
        match %r/[^ %]+/
      end
      rule do
        from %r/[ ]+/
        to %r/$/
        include "#vars"
        rule 'string.other.rewrite-substitution.apache-config' do
          match %r/[^ %\n]+/
        end
        rule do
          match %r/[ ]+(\[[^\]]+\])/,
            1 => 'string.regexp.rewrite-operator.apache-config'
        end
      end
    end
  end
  rule 'support.constant.apache-config' do
    match %r/\b(R(e(sourceConfig|direct(Match|Temp|Permanent)?|qu(ire|estHeader)|ferer(Ignore|Log)|write(Rule|Map|Base|Cond|Options|Engine|Lo(ck|g(Level)?))|admeName|move(Handler|Charset|Type|InputFilter|OutputFilter|Encoding|Language))|Limit(MEM|NPROC|CPU))|Group|XBitHack|M(MapFile|i(nSpare(Servers|Threads)|meMagicFile)|odMimeUsePathInfo|Cache(RemovalAlgorithm|M(inObjectSize|ax(StreamingBuffer|Object(Size|Count)))|Size)|ultiviewsMatch|eta(Suffix|Dir|Files)|ax(RequestsPer(Child|Thread)|MemFree|Spare(Servers|Threads)|Clients|Threads(PerChild)?|KeepAliveRequests))|B(indAddress|S2000Account|rowserMatch(NoCase)?)|S(hmemUIDisUser|c(oreBoardFile|ript(Sock|InterpreterSource|Log(Buffer|Length)?|Alias(Match)?)?)|tart(Servers|Threads)|S(I(StartTag|TimeFormat|UndefinedEcho|E(ndTag|rrorMsg))|L(R(equire(SSL)?|andomSeed)|Mutex|SessionCache(Timeout)?|C(ipherSuite|ertificate(ChainFile|KeyFile|File)|A(Revocation(Path|File)|Certificate(Path|File)))|Options|P(assPhraseDialog|ro(tocol|xy(MachineCertificate(Path|File)|C(ipherSuite|A(Revocation(Path|File)|Certificate(Path|File)))|Protocol|Engine|Verify(Depth)?)))|Engine|Verify(Client|Depth)))|uexecUserGroup|e(ndBufferSize|cureListen|t(Handler|InputFilter|OutputFilter|Env(If(NoCase)?)?)|rver(Root|Signature|Name|T(ype|okens)|Path|Limit|A(dmin|lias)))|atisfy)|H(ostnameLookups|eader(Name)?)|N(o(Cache|Proxy)|umServers|ameVirtualHost|WSSL(TrustedCerts|Upgradeable))|C(h(ildPerUserID|eckSpelling|arset(SourceEnc|Options|Default))|GI(MapExtension|CommandArgs)|o(ntentDigest|okie(Style|Name|Tracking|Domain|Prefix|Expires|Format|Log)|reDumpDirectory)|ustomLog|learModuleList|ache(Root|Gc(MemUsage|Clean|Interval|Daily|Unused)|M(inFileSize|ax(Expire|FileSize))|Size|NegotiatedDocs|TimeMargin|Ignore(NoLastMod|CacheControl)|D(i(sable|rLe(ngth|vels))|efaultExpire)|E(nable|xpiryCheck)|F(ile|orceCompletion)|LastModifiedFactor))|T(hread(sPerChild|StackSize|Limit)|ypesConfig|ime(out|Out)|ransferLog)|I(n(clude|dex(Ignore|O(ptions|rderDefault)))|SAPI(ReadAheadBuffer|CacheFile|FakeAsync|LogNotSupported|AppendLogTo(Errors|Query))|dentityCheck|f(Module|Define)|map(Menu|Base|Default))|O(ptions|rder)|D(irectory(Match|Slash|Index)?|ocumentRoot|e(ny|f(late(MemLevel|BufferSize|CompressionLevel|FilterNote|WindowSize)|ault(Type|Icon|Language)))|av(MinTimeout|DepthInfinity|LockDB)?)|U(se(CanonicalName|r(Dir)?)|nsetEnv)|P(idFile|ort|assEnv|ro(tocol(ReqCheck|Echo)|xy(Re(ceiveBufferSize|quests|mote(Match)?)|Ma(tch|xForwards)|B(lock|adHeader)|Timeout|IOBufferSize|Domain|P(ass(Reverse)?|reserveHost)|ErrorOverride|Via)?))|E(nable(MMAP|Sendfile|ExceptionHook)|BCDIC(Convert(ByType)?|Kludge)|rror(Header|Document|Log)|x(t(endedStatus|Filter(Options|Define))|pires(ByType|Default|Active)|ample))|Virtual(ScriptAlias(IP)?|Host|DocumentRoot(IP)?)|KeepAlive(Timeout)?|F(ile(s(Match)?|ETag)|or(ce(Type|LanguagePriority)|ensicLog)|ancyIndexing)|Win32DisableAcceptEx|L(i(sten(Back(log|Log))?|mit(Request(Body|Field(s(ize)?|Size)|Line)|XMLRequestBody|InternalRecursion|Except)?)|o(c(kFile|ation(Match)?)|ad(Module|File)|g(Format|Level))|DAP(SharedCache(Size|File)|Cache(TTL|Entries)|TrustedCA(Type)?|OpCache(TTL|Entries))|anguagePriority)|A(ssignUserID|nonymous(_(MustGiveEmail|NoUserID|VerifyEmail|LogEmail|Authoritative))?|c(ce(ss(Config|FileName)|pt(Mutex|PathInfo|Filter))|tion)|dd(Module(Info)?|Handler|Charset|Type|I(nputFilter|con(By(Type|Encoding))?)|OutputFilter(ByType)?|De(scription|faultCharset)|Encoding|Language|Alt(By(Type|Encoding))?)|uth(GroupFile|Name|Type|D(B(GroupFile|M(GroupFile|Type|UserFile|Authoritative)|UserFile|Authoritative)|igest(GroupFile|ShmemSize|N(cCheck|once(Format|Lifetime))|Domain|Qop|File|Algorithm))|UserFile|LDAP(RemoteUserIsDN|GroupAttribute(IsDN)?|Bind(DN|Password)|C(harsetConfig|ompareDNOnServer)|DereferenceAliases|Url|Enabled|FrontPageHack|Authoritative)|Authoritative)|l(ias(Match)?|low(CONNECT|Override|EncodedSlashes)?)|gentLog)|MIMEMagicFile|WSGI(.[^ ]+))\b/
  end
  rule 'support.class.apache-config' do
    match %r/\b(access_module|actions_module|action_module|alias_module|anon_auth_module|asis_module|authn_alias_module|authn_anon_module|authn_dbd_module|authn_dbm_module|authn_default_module|authn_file_module|authnz_ldap_module|authz_dbm_module|authz_default_module|authz_groupfile_module|authz_host_module|authz_owner_module|authz_user_module|auth_basic_module|auth_digest_module|auth_module|autoindex_module|bonjour_module|cache_module|cern_meta_module|cgi_module|config_log_module|dav_fs_module|dav_module|dbd_module|dbm_auth_module|deflate_module|digest_module|dir_module|disk_cache_module|dumpio_module|env_module|expires_module|ext_filter_module|fastcgi_module|filter_module|foo_module|headers_module|hfs_apple_module|ident_module|imagemap_module|imap_module|includes_module|include_module|info_module|jk_module|ldap_module|logio_module|log_config_module|log_forensic_module|mem_cache_module|mime_magic_module|mime_module|negotiation_module|perl_module|php4_module|php5_module|proxy_ajp_module|proxy_balancer_module|proxy_connect_module|proxy_ftp_module|proxy_http_module|proxy_module|rendezvous_apple_module|rendezvous_module|rewrite_module|setenvif_module|speling_module|ssl_module|status_module|suexec_module|substitute_module|unique_id_module|userdir_module|usertrack_module|version_module|vhost_alias_module|wsgi_module)\b/
  end
  rule 'string.quoted.double.apache-config' do
    from %r/"/,
      0 => 'punctuation.definition.string.begin.apache-config'
    to %r/"(?!")/,
      0 => 'punctuation.definition.string.end.apache-config'
    rule 'constant.character.escape.apostrophe.apache' do
      match %r/""/
    end
  end
  rule 'meta.tag.apache-config' do
    from %r'(</?)([a-zA-Z]+)'
    to %r'(/?>)'
    both 1 => 'punctuation.definition.tag.apache-config',
         2 => 'entity.name.tag.apache-config'
  end

  fragment :vars do
    rule 'support.variable.apache-config' do
      match %r/(%\{)(?:HTTP_(?:USER_AGENT|REFERER|COOKIE|FORWARDED|HOST|PROXY_CONNECTION|ACCEPT)|REMOTE_(?:ADDR|HOST|USER|IDENT)|REQUEST_(?:METHOD|URI|FILENAME)|SCRIPT_FILENAME|PATH_INFO|QUERY_STRING|AUTH_TYPE|DOCUMENT_ROOT|SERVER_(?:ADMIN|NAME|ADDR|PORT|PROTOCOL|SOFTWARE)|TIME_(?:YEAR|MON|DAY|HOUR|MIN|SEC|WDAY)|TIME|API_VERSION|THE_REQUEST|IS_SUBREQ|(?:ENV|LA-U|LA-F|HTTP|SSL):[^\}]+)(\})/,
        1 => 'punctuation.definition.variable.apache-config',
        3 => 'punctuation.definition.variable.apache-config'
    end
    rule 'invalid.illegal.bad-var.apache-config' do
      match %r/%\{[^\}]+\}/
    end
  end
end
