# encoding: utf-8

language 'SSH Config' => 'source.ssh-config', file: 'SSH-Config' do
  file_types %w(ssh_config .ssh/config sshd_config)
  uuid "B273855C-59D3-4DF3-9B7C-E68E0057D315"  # TextMate only

  rule 'keyword.other.ssh-config' do
    match %r/\b(AddressFamily|B(atchMode|indAddress)|C(hallengeResponseAuthentication|heckHostIP|iphers?|learAllForwardings|ompression(Level)?|onnect(Timeout|ionAttempts)|ontrolMaster|ontrolPath)|DynamicForward|E(nableSSHKeysign|scapeChar)|Forward(Agent|X11(Trusted)?)|G(SSAPI(Authentication|DelegateCredentials|CleanupCredentials)|atewayPorts|lobalKnownHostsFile)|Host(KeyAlgorithms|KeyAlias|Name|basedAuthentication)|Identit(iesOnly|yFile)|L(ocalForward|ogLevel)|MACs|N(oHostAuthenticationForLocalhost|umberOfPasswordPrompts)|P(asswordAuthentication|ort|referredAuthentications|rotocol|roxyCommand|ubkeyAuthentication)|R(SAAuthentication|emoteForward|hostsRSAAuthentication)|S(erverAliveCountMax|erverAliveInterval|martcardDevice|trictHostKeyChecking)|TCPKeepAlive|U(sePrivilegedPort|ser(KnownHostsFile)?)|VerifyHostKeyDNS|XAuthLocation)|AcceptEnv|UsePAM|X11Forwarding|Subsystem|SyslogFacility|LogLevel|(Kerberos(Authentication|OrLocalPasswd|TicketCleanup|GetAFSToken))\b/
  end
  rule do
    from %r/(^[ \t]+)?(?=#)/,
      1 => 'punctuation.whitespace.comment.leading.ssh-config'
    to %r/(?!\G)/
    rule 'comment.line.number-sign.ssh-config' do
      from %r/#/,
        0 => 'punctuation.definition.comment.ssh-config'
      to %r/\n/
    end
  end
  rule do
    from %r'(^[ \t]+)?(?=//)',
      1 => 'punctuation.whitespace.comment.leading.ssh-config'
    to %r/(?!\G)/
    rule 'comment.line.double-slash.ssh-config' do
      from %r'//',
        0 => 'punctuation.definition.comment.ssh-config'
      to %r/\n/
    end
  end
  rule do
    match %r/(?:^| |\t)(Host)\s+((.*))$/,
      1 => 'storage.type.ssh-config',
      2 => 'entity.name.section.ssh-config',
      3 => 'meta.toc-list.ssh-config'
  end
  rule 'constant.numeric.ssh-config' do
    match %r/\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/
  end
  rule 'constant.numeric.ssh-config' do
    match %r/\b[0-9]+\b/
  end
  rule 'constant.language.ssh-config' do
    match %r/\b(yes|no)\b/
  end
  rule 'constant.language.ssh-config' do
    match %r/\b[A-Z_]+\b/
  end
end
