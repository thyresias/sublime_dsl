# encoding: utf-8

language 'HTML (Tcl)' => 'text.html.tcl' do
  file_types %w(tcl adp inc)
  key_equivalent "^~T"  # TextMate only
  uuid "42F00A35-6D17-44B8-8C9B-438F9FE9E241"  # TextMate only

  rule 'meta.embedded.line.tcl' do
    content_scope "source.tcl"
    from %r/<%/,
      0 => 'punctuation.section.embedded.begin.tcl'
    to %r/(%)>/,
      0 => 'punctuation.section.embedded.end.tcl',
      1 => 'source.tcl'
    rule 'keyword.other.tcl.aolserver' do
      match %r/(env|ns_adp_argc|ns_adp_argv|ns_adp_bind_args|ns_adp_break|ns_adp_debug|ns_adp_dir|ns_adp_dump|ns_adp_eval|ns_adp_exception|ns_adp_include|ns_adp_parse|ns_adp_puts|ns_adp_registertag|ns_adp_return|ns_adp_stream|ns_adp_tell|ns_adp_trunc|ns_atclose|ns_atexit|ns_atshutdown|ns_atsignal|ns_cache_flush|ns_cache_names|ns_cache_size|ns_cache_stats|ns_checkurl|ns_chmod|ns_cond|ns_config|ns_configsection|ns_configsections|ns_conn|ns_conncptofp|ns_connsendfp|ns_cp|ns_cpfp|ns_critsec|ns_crypt|ns_db|ns_dbconfigpath|ns_dberror|ns_dbformvalue|ns_dbformvalueput|ns_dbquotename|ns_dbquotevalue|ns_deleterow|ns_eval|ns_event|ns_ext|ns_findrowbyid|ns_fmttime|ns_ftruncate|ns_getcsv|ns_getform|ns_get_multipart_formdata|ns_geturl|ns_gifsize|ns_gmtime|ns_guesstype|ns_hostbyaddr|ns_hrefs|ns_httpget|ns_httpopen|ns_httptime|ns_info|ns_insertrow|ns_jpegsize|ns_kill|ns_library|ns_link|ns_localsqltimestamp|ns_localtime|ns_log|ns_logroll|ns_markfordelete|ns_mkdir|ns_mktemp|ns_modulepath|ns_mutex|ns_normalizepath|ns_param|ns_parseheader|ns_parsehttptime|ns_parsequery|ns_passwordcheck|ns_perm|ns_permpasswd|ns_pooldescription|ns_puts|ns_queryexists|ns_queryget|ns_querygetall|ns_quotehtml|ns_rand|ns_register_adptag|ns_register_filter|ns_register_proc|ns_register_trace|ns_rename|ns_requestauthorize|ns_respond|ns_return|ns_returnredirect|ns_rmdir|ns_rollfile|ns_rwlock|ns_schedule_daily|ns_schedule_proc|ns_schedule_weekly|ns_section|ns_sema|ns_sendmail|ns_server|ns_set|ns_setexpires|ns_set_precision|ns_share|ns_shutdown|ns_sleep|ns_sockaccept|ns_sockblocking|ns_sockcallback|ns_sockcheck|ns_socketpair|ns_socklistencallback|ns_socknonblocking|ns_socknread|ns_sockopen|ns_sockselect|ns_striphtml|ns_symlink|ns_thread|ns_time|ns_tmpnam|ns_truncate|ns_unlink|ns_unschedule_proc|ns_url2file|ns_urldecode|ns_urlencode|ns_uudecode|ns_uuencode|ns_write|ns_writecontent|ns_writefp|nsv_incr)\b/
    end
    include "source.tcl"
  end
  include "text.html.basic"
end
