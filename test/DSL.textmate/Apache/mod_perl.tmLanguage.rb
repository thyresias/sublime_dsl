# encoding: utf-8

language 'mod_perl' => 'source.apache-config.mod_perl' do
  # FIXME: no file types
  key_equivalent "^~A"  # TextMate only
  uuid "6A616B03-1053-49BF-830F-0F4E63DB2447"  # TextMate only

  rule 'comment.block.documentation.apache-config.mod_perl' do
    from %r/^=/
    to %r/^=cut/
    both 0 => 'punctuation.definition.comment.mod_perl'
  end
  rule 'support.constant.apache-config.mod_perl' do
    match %r/\b(PerlAddVar|PerlConfigRequire|PerlLoadModule|PerlModule|PerlOptions|PerlPassEnv|PerlPostConfigRequire|PerlRequire|PerlSetEnv|PerlSetVar|PerlSwitches|SetHandler|PerlOpenLogsHandler|PerlPostConfigHandler|PerlChildInitHandler|PerlChildExitHandler|PerlPreConnectionHandler|PerlProcessConnectionHandler|PerlInputFilterHandler|PerlOutputFilterHandler|PerlSetInputFilter|PerlSetOutputFilter|PerlPostReadRequestHandler|PerlTransHandler|PerlMapToStorageHandler|PerlInitHandler|PerlHeaderParserHandler|PerlAccessHandler|PerlAuthenHandler|PerlAuthzHandler|PerlTypeHandler|PerlFixupHandler|PerlResponseHandler|PerlLogHandler|PerlCleanupHandler|PerlInterpStart|PerlInterpMax|PerlInterpMinSpare|PerlInterpMaxSpare|PerlInterpMaxRequests|PerlInterpScope|PerlTrace)\b/
  end
  rule 'support.constant.apache-config.mod_perl_1.mod_perl' do
    match %r/\b(PerlHandler|PerlScript|PerlSendHeader|PerlSetupEnv|PerlTaintCheck|PerlWarn|PerlFreshRestart)\b/
  end
  rule 'meta.perl-section.apache-config.mod_perl' do
    from %r/^\s*((<)(Perl)(>))/
    to %r'^\s*((</)(Perl)(>))'
    both 1 => 'meta.tag.apache-config',
         2 => 'punctuation.definition.tag.apache-config',
         3 => 'entity.name.tag.apache-config',
         4 => 'punctuation.definition.tag.apache-config'
    include "source.perl"
  end
  include "source.apache-config"
end
