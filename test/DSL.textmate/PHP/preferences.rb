# encoding: utf-8

preferences 'Add goto labels to symbol list' => 'entity.name.goto-label.php' do
  show_in_symbol_list true
  symbol_transformation "s/$/:/a"
  uuid "998BFB01-C049-4A24-A88E-86173C967748"
end

preferences 'Add Magic Methods to the Symbol List' => 'support.function.magic.php' do
  show_in_symbol_list true
  uuid "77F2D17D-A48A-4E19-B2A4-B2FBCBD1264D"
end

preferences 'Comments' => 'source.php' do
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '# '
  shell_variable 'TM_COMMENT_START_3', '/*'
  shell_variable 'TM_COMMENT_END_3', '*/'
  uuid "06276449-AA4E-424F-A2B6-9F4138416E50"
end

preferences 'Completions' => 'source.php' do
  completions %w(
    AMQPChannel AMQPConnection AMQPEnvelope AMQPExchange AMQPQueue APCIterator
    AppendIterator ArrayAccess ArrayIterator ArrayObject BadFunctionCallException
    BadMethodCallException CachingIterator CallbackFilterIterator Collator Cond
    Countable DOMAttr DOMCdataSection DOMCharacterData DOMComment DOMDocument
    DOMDocumentFragment DOMElement DOMEntityReference DOMImplementation
    DOMNamedNodeMap DOMNode DOMNodelist DOMProcessingInstruction DOMText DOMXPath
    DateInterval DatePeriod DateTime DateTimeZone Directory DirectoryIterator
    DomainException EmptyIterator ErrorException Ev EvCheck EvChild EvEmbed EvFork
    EvIdle EvIo EvLoop EvPeriodic EvPrepare EvSignal EvStat EvTimer EvWatcher
    Exception FilesystemIterator FilterIterator FrenchToJD Gender\Gender
    GlobIterator Gmagick GmagickDraw GmagickPixel GregorianToJD HaruAnnotation
    HaruDestination HaruDoc HaruEncoder HaruFont HaruImage HaruOutline HaruPage
    HttpDeflateStream HttpInflateStream HttpMessage HttpQueryString HttpRequest
    HttpRequestPool HttpResponse Imagick ImagickDraw ImagickPixel
    ImagickPixelIterator InfiniteIterator IntlDateFormatter InvalidArgumentException
    Iterator IteratorAggregate IteratorIterator JDDayOfWeek JDMonthName JDToFrench
    JDToGregorian JDToJulian JewishToJD JsonSerializable JulianToJD
    KTaglib_ID3v2_AttachedPictureFrame KTaglib_ID3v2_Frame KTaglib_ID3v2_Tag
    KTaglib_MPEG_AudioProperties KTaglib_MPEG_File KTaglib_Tag Lapack
    LengthException LimitIterator Locale LogicException Lua LuaClosure Memcache
    Memcached MessageFormatter Mongo MongoBinData MongoClient MongoCode
    MongoCollection MongoCursor MongoCursorException MongoDB MongoDBRef MongoDate
    MongoGridFS MongoGridFSCursor MongoGridFSFile MongoGridfsFile MongoId MongoInt32
    MongoInt64 MongoLog MongoPool MongoRegex MongoResultException MongoTimestamp
    MultipleIterator Mutex MysqlndUhConnection MysqlndUhPreparedStatement
    NoRewindIterator Normalizer NumberFormatter OCI-Collection OCI-Lob
    OutOfBoundsException OutOfRangeException OuterIterator OverflowException PDO
    PDOStatement ParentIterator Phar PharData PharFileInfo QuickHashIntHash
    QuickHashIntSet QuickHashIntStringHash QuickHashStringIntHash RRDCreator
    RRDGraph RRDUpdater RangeException RecursiveArrayIterator
    RecursiveCachingIterator RecursiveCallbackFilterIterator
    RecursiveDirectoryIterator RecursiveFilterIterator RecursiveIterator
    RecursiveIteratorIterator RecursiveRegexIterator RecursiveTreeIterator
    Reflection ReflectionClass ReflectionExtension ReflectionFunction
    ReflectionFunctionAbstract ReflectionMethod ReflectionObject ReflectionParameter
    ReflectionProperty ReflectionZendExtension Reflector RegexIterator
    ResourceBundle RuntimeException SAMConnection SAMMessage SCA SCA_LocalProxy
    SCA_SoapProxy SDO_DAS_ChangeSummary SDO_DAS_DataFactory SDO_DAS_DataObject
    SDO_DAS_Relational SDO_DAS_Setting SDO_DAS_XML SDO_DAS_XML_Document
    SDO_DataFactory SDO_DataObject SDO_Exception SDO_List SDO_Model_Property
    SDO_Model_ReflectionDataObject SDO_Model_Type SDO_Sequence SNMP SQLite3
    SQLite3Result SQLite3Stmt SQLiteDatabase SQLiteResult SQLiteUnbuffered SVM
    SVMModel SeekableIterator Serializable SessionHandler SessionHandlerInterface
    SimpleXMLElement SimpleXMLIterator SoapClient SoapFault SoapHeader SoapParam
    SoapServer SoapVar SphinxClient SplDoublyLinkedList SplEnum SplFileInfo
    SplFileObject SplFixedArray SplHeap SplMaxHeap SplMinHeap SplObjectStorage
    SplObserver SplPriorityQueue SplQueue SplStack SplSubject SplTempFileObject
    SplType Spoofchecker Stackable Swish SwishResult SwishResults SwishSearch Thread
    TokyoTyrant TokyoTyrantIterator TokyoTyrantQuery TokyoTyrantTable Transliterator
    Traversable UnderflowException UnexpectedValueException V8Js V8JsException
    VarnishAdmin VarnishLog VarnishStat WeakMap Weakref Worker XMLReader XMLWriter
    XSLTProcessor XsltProcessor Yaf_Action_Abstract Yaf_Application
    Yaf_Config_Abstract Yaf_Config_Ini Yaf_Config_Simple Yaf_Controller_Abstract
    Yaf_Dispatcher Yaf_Exception Yaf_Loader Yaf_Plugin_Abstract Yaf_Registry
    Yaf_Request_Abstract Yaf_Request_Http Yaf_Request_Simple Yaf_Response_Abstract
    Yaf_Route_Interface Yaf_Route_Map Yaf_Route_Regex Yaf_Route_Rewrite
    Yaf_Route_Simple Yaf_Route_Static Yaf_Route_Supervar Yaf_Router Yaf_Session
    Yaf_View_Interface Yaf_View_Simple ZipArchive __autoload __halt_compiler abs
    acos acosh addcslashes addslashes aggregate aggregate_info aggregate_methods
    aggregate_methods_by_list aggregate_methods_by_regexp aggregate_properties
    aggregate_properties_by_list aggregate_properties_by_regexp aggregation_info
    apache_child_terminate apache_get_modules apache_get_version apache_getenv
    apache_lookup_uri apache_note apache_request_headers apache_reset_timeout
    apache_response_headers apache_setenv apc_add apc_bin_dump apc_bin_dumpfile
    apc_bin_load apc_bin_loadfile apc_cache_info apc_cas apc_clear_cache
    apc_compile_file apc_dec apc_define_constants apc_delete apc_delete_file
    apc_exists apc_fetch apc_inc apc_load_constants apc_sma_info apc_store array
    array_change_key_case array_chunk array_combine array_count_values array_diff
    array_diff_assoc array_diff_key array_diff_uassoc array_diff_ukey array_fill
    array_fill_keys array_filter array_flip array_intersect array_intersect_assoc
    array_intersect_key array_intersect_uassoc array_intersect_ukey array_key_exists
    array_keys array_map array_merge array_merge_recursive array_multisort array_pad
    array_pop array_product array_push array_rand array_reduce array_replace
    array_replace_recursive array_reverse array_search array_shift array_slice
    array_splice array_sum array_udiff array_udiff_assoc array_udiff_uassoc
    array_uintersect array_uintersect_assoc array_uintersect_uassoc array_unique
    array_unshift array_values array_walk array_walk_recursive arsort asin asinh
    asort assert assert_options atan atan2 atanh base64_decode base64_encode
    base_convert basename bcadd bccomp bcdiv bcmod bcmul bcpow bcpowmod bcscale
    bcsqrt bcsub bin2hex bind_textdomain_codeset bindec bindtextdomain boolval
    bson_decode bson_encode bzclose bzcompress bzdecompress bzerrno bzerror bzerrstr
    bzflush bzopen bzread bzwrite cal_days_in_month cal_from_jd cal_info cal_to_jd
    call_user_func call_user_func_array call_user_method call_user_method_array ceil
    chdir checkdate checkdnsrr chgrp chmod chop chown chr chroot chunk_split
    class_alias class_exists class_implements class_parents class_uses
    clearstatcache closedir closelog collator_asort collator_compare collator_create
    collator_get_attribute collator_get_error_code collator_get_error_message
    collator_get_locale collator_get_sort_key collator_get_strength
    collator_set_attribute collator_set_strength collator_sort
    collator_sort_with_sort_keys com_addref com_create_guid com_event_sink com_get
    com_get_active_object com_invoke com_isenum com_load com_load_typelib
    com_message_pump com_print_typeinfo com_propget com_propput com_propset
    com_release com_set compact connection_aborted connection_status
    connection_timeout constant convert_cyr_string convert_uudecode convert_uuencode
    copy cos cosh count count_chars crc32 create_function crypt ctype_alnum
    ctype_alpha ctype_cntrl ctype_digit ctype_graph ctype_lower ctype_print
    ctype_punct ctype_space ctype_upper ctype_xdigit curl_close curl_copy_handle
    curl_errno curl_error curl_exec curl_getinfo curl_init curl_multi_add_handle
    curl_multi_close curl_multi_exec curl_multi_getcontent curl_multi_info_read
    curl_multi_init curl_multi_remove_handle curl_multi_select curl_setopt
    curl_setopt_array curl_version current date date_add date_create
    date_create_from_format date_date_set date_default_timezone_get
    date_default_timezone_set date_diff date_format date_get_last_errors
    date_interval_create_from_date_string date_interval_format date_isodate_set
    date_modify date_offset_get date_parse date_parse_from_format date_sub
    date_sun_info date_sunrise date_sunset date_time_set date_timestamp_get
    date_timestamp_set date_timezone_get date_timezone_set datefmt_create
    datefmt_format datefmt_format_object datefmt_get_calendar
    datefmt_get_calendar_object datefmt_get_datetype datefmt_get_error_code
    datefmt_get_error_message datefmt_get_locale datefmt_get_pattern
    datefmt_get_timetype datefmt_get_timezone datefmt_get_timezone_id
    datefmt_is_lenient datefmt_localtime datefmt_parse datefmt_set_calendar
    datefmt_set_lenient datefmt_set_pattern datefmt_set_timezone
    datefmt_set_timezone_id dba_close dba_delete dba_exists dba_fetch dba_firstkey
    dba_handlers dba_insert dba_key_split dba_list dba_nextkey dba_open dba_optimize
    dba_popen dba_replace dba_sync dbx_close dbx_compare dbx_connect dbx_error
    dbx_escape_string dbx_fetch_row dbx_query dbx_sort dcgettext dcngettext
    deaggregate debug_backtrace debug_print_backtrace debug_zval_dump decbin dechex
    decoct define define_syslog_variables defined deg2rad delete dgettext die dir
    dirname disk_free_space disk_total_space diskfreespace dl dngettext
    dns_check_record dns_get_mx dns_get_record dom_import_simplexml dotnet_load
    doubleval each easter_date easter_days echo eio_busy eio_cancel eio_chmod
    eio_chown eio_close eio_custom eio_dup2 eio_event_loop eio_fallocate eio_fchmod
    eio_fchown eio_fdatasync eio_fstat eio_fstatvfs eio_fsync eio_ftruncate
    eio_futime eio_get_event_stream eio_get_last_error eio_grp eio_grp_add
    eio_grp_cancel eio_grp_limit eio_init eio_link eio_lstat eio_mkdir eio_mknod
    eio_nop eio_npending eio_nready eio_nreqs eio_nthreads eio_open eio_poll
    eio_read eio_readahead eio_readdir eio_readlink eio_realpath eio_rename
    eio_rmdir eio_seek eio_sendfile eio_set_max_idle eio_set_max_parallel
    eio_set_max_poll_reqs eio_set_max_poll_time eio_set_min_parallel eio_stat
    eio_statvfs eio_symlink eio_sync eio_sync_file_range eio_syncfs eio_truncate
    eio_unlink eio_utime eio_write empty enchant_broker_describe
    enchant_broker_dict_exists enchant_broker_free enchant_broker_free_dict
    enchant_broker_get_error enchant_broker_init enchant_broker_list_dicts
    enchant_broker_request_dict enchant_broker_request_pwl_dict
    enchant_broker_set_ordering enchant_dict_add_to_personal
    enchant_dict_add_to_session enchant_dict_check enchant_dict_describe
    enchant_dict_get_error enchant_dict_is_in_session enchant_dict_quick_check
    enchant_dict_store_replacement enchant_dict_suggest end ereg ereg_replace eregi
    eregi_replace error_get_last error_log error_reporting escapeshellarg
    escapeshellcmd eval exec exif_imagetype exif_read_data exif_tagname
    exif_thumbnail exit exp explode expm1 extension_loaded extract ezmlm_hash fclose
    feof fflush fgetc fgetcsv fgets fgetss file file_exists file_get_contents
    file_put_contents fileatime filectime filegroup fileinode filemtime fileowner
    fileperms filesize filetype filter_has_var filter_id filter_input
    filter_input_array filter_list filter_var filter_var_array finfo finfo_buffer
    finfo_close finfo_file finfo_open finfo_set_flags floatval flock floor flush
    fmod fnmatch fopen forward_static_call forward_static_call_array fpassthru
    fprintf fputcsv fputs fread fscanf fseek fsockopen fstat ftell ftok ftp_alloc
    ftp_cdup ftp_chdir ftp_chmod ftp_close ftp_connect ftp_delete ftp_exec ftp_fget
    ftp_fput ftp_get ftp_get_option ftp_login ftp_mdtm ftp_mkdir ftp_nb_continue
    ftp_nb_fget ftp_nb_fput ftp_nb_get ftp_nb_put ftp_nlist ftp_pasv ftp_put ftp_pwd
    ftp_quit ftp_raw ftp_rawlist ftp_rename ftp_rmdir ftp_set_option ftp_site
    ftp_size ftp_ssl_connect ftp_systype ftruncate func_get_arg func_get_args
    func_num_args function_exists fwrite gc_collect_cycles gc_disable gc_enable
    gc_enabled gd_info get_browser get_called_class get_cfg_var get_class
    get_class_methods get_class_vars get_current_user get_declared_classes
    get_declared_interfaces get_declared_traits get_defined_constants
    get_defined_functions get_defined_vars get_extension_funcs get_headers
    get_html_translation_table get_include_path get_included_files
    get_loaded_extensions get_magic_quotes_gpc get_magic_quotes_runtime
    get_meta_tags get_object_vars get_parent_class get_required_files
    get_resource_type getallheaders getcwd getdate getenv gethostbyaddr
    gethostbyname gethostbynamel gethostname getimagesize getimagesizefromstring
    getlastmod getmxrr getmygid getmyinode getmypid getmyuid getopt getprotobyname
    getprotobynumber getrandmax getrusage getservbyname getservbyport gettext
    gettimeofday gettype glob gmdate gmmktime gmp_abs gmp_add gmp_and gmp_clrbit
    gmp_cmp gmp_com gmp_div gmp_div_q gmp_div_qr gmp_div_r gmp_divexact gmp_fact
    gmp_gcd gmp_gcdext gmp_hamdist gmp_init gmp_intval gmp_invert gmp_jacobi
    gmp_legendre gmp_mod gmp_mul gmp_neg gmp_nextprime gmp_or gmp_perfect_square
    gmp_popcount gmp_pow gmp_powm gmp_prob_prime gmp_random gmp_scan0 gmp_scan1
    gmp_setbit gmp_sign gmp_sqrt gmp_sqrtrem gmp_strval gmp_sub gmp_testbit gmp_xor
    gmstrftime grapheme_extract grapheme_stripos grapheme_stristr grapheme_strlen
    grapheme_strpos grapheme_strripos grapheme_strrpos grapheme_strstr
    grapheme_substr gzclose gzcompress gzdecode gzdeflate gzencode gzeof gzfile
    gzgetc gzgets gzgetss gzinflate gzopen gzpassthru gzputs gzread gzrewind gzseek
    gztell gzuncompress gzwrite hash hash_algos hash_copy hash_file hash_final
    hash_hmac hash_hmac_file hash_init hash_pbkdf2 hash_update hash_update_file
    hash_update_stream header header_register_callback header_remove headers_list
    headers_sent hebrev hebrevc hex2bin hexdec highlight_file highlight_string
    html_entity_decode htmlentities htmlspecialchars htmlspecialchars_decode
    http_build_cookie http_build_query http_build_str http_build_url http_cache_etag
    http_cache_last_modified http_chunked_decode http_date http_deflate http_get
    http_get_request_body http_get_request_body_stream http_get_request_headers
    http_head http_inflate http_match_etag http_match_modified
    http_match_request_header http_negotiate_charset http_negotiate_content_type
    http_negotiate_language http_parse_cookie http_parse_headers http_parse_message
    http_parse_params http_persistent_handles_clean http_persistent_handles_count
    http_persistent_handles_ident http_post_data http_post_fields http_put_data
    http_put_file http_put_stream http_redirect http_request
    http_request_body_encode http_request_method_exists http_request_method_name
    http_request_method_register http_request_method_unregister http_response_code
    http_send_content_disposition http_send_content_type http_send_data
    http_send_file http_send_last_modified http_send_status http_send_stream
    http_support http_throttle hypot ibase_add_user ibase_affected_rows ibase_backup
    ibase_blob_add ibase_blob_cancel ibase_blob_close ibase_blob_create
    ibase_blob_echo ibase_blob_get ibase_blob_import ibase_blob_info ibase_blob_open
    ibase_close ibase_commit ibase_commit_ret ibase_connect ibase_db_info
    ibase_delete_user ibase_drop_db ibase_errcode ibase_errmsg ibase_execute
    ibase_fetch_assoc ibase_fetch_object ibase_fetch_row ibase_field_info
    ibase_free_event_handler ibase_free_query ibase_free_result ibase_gen_id
    ibase_maintain_db ibase_modify_user ibase_name_result ibase_num_fields
    ibase_num_params ibase_param_info ibase_pconnect ibase_prepare ibase_query
    ibase_restore ibase_rollback ibase_rollback_ret ibase_server_info
    ibase_service_attach ibase_service_detach ibase_set_event_handler ibase_trans
    ibase_wait_event iconv iconv_get_encoding iconv_mime_decode
    iconv_mime_decode_headers iconv_mime_encode iconv_set_encoding iconv_strlen
    iconv_strpos iconv_strrpos iconv_substr idate idn_to_ascii idn_to_unicode
    idn_to_utf8 ignore_user_abort iis_add_server iis_get_dir_security
    iis_get_script_map iis_get_server_by_comment iis_get_server_by_path
    iis_get_server_rights iis_get_service_state iis_remove_server
    iis_set_app_settings iis_set_dir_security iis_set_script_map
    iis_set_server_rights iis_start_server iis_start_service iis_stop_server
    iis_stop_service image2wbmp image_type_to_extension image_type_to_mime_type
    imagealphablending imageantialias imagearc imagechar imagecharup
    imagecolorallocate imagecolorallocatealpha imagecolorat imagecolorclosest
    imagecolorclosestalpha imagecolorclosesthwb imagecolordeallocate imagecolorexact
    imagecolorexactalpha imagecolormatch imagecolorresolve imagecolorresolvealpha
    imagecolorset imagecolorsforindex imagecolorstotal imagecolortransparent
    imageconvolution imagecopy imagecopymerge imagecopymergegray imagecopyresampled
    imagecopyresized imagecreate imagecreatefromgd imagecreatefromgd2
    imagecreatefromgd2part imagecreatefromgif imagecreatefromjpeg imagecreatefrompng
    imagecreatefromstring imagecreatefromwbmp imagecreatefromxbm imagecreatefromxpm
    imagecreatetruecolor imagedashedline imagedestroy imageellipse imagefill
    imagefilledarc imagefilledellipse imagefilledpolygon imagefilledrectangle
    imagefilltoborder imagefilter imagefontheight imagefontwidth imageftbbox
    imagefttext imagegammacorrect imagegd imagegd2 imagegif imagegrabscreen
    imagegrabwindow imageinterlace imageistruecolor imagejpeg imagelayereffect
    imageline imageloadfont imagepalettecopy imagepng imagepolygon imagepsbbox
    imagepsencodefont imagepsextendfont imagepsfreefont imagepsloadfont
    imagepsslantfont imagepstext imagerectangle imagerotate imagesavealpha
    imagesetbrush imagesetpixel imagesetstyle imagesetthickness imagesettile
    imagestring imagestringup imagesx imagesy imagetruecolortopalette imagettfbbox
    imagettftext imagetypes imagewbmp imagexbm imap_8bit imap_alerts imap_append
    imap_base64 imap_binary imap_body imap_bodystruct imap_check imap_clearflag_full
    imap_close imap_create imap_createmailbox imap_delete imap_deletemailbox
    imap_errors imap_expunge imap_fetch_overview imap_fetchbody imap_fetchheader
    imap_fetchmime imap_fetchstructure imap_fetchtext imap_gc imap_get_quota
    imap_get_quotaroot imap_getacl imap_getmailboxes imap_getsubscribed imap_header
    imap_headerinfo imap_headers imap_last_error imap_list imap_listmailbox
    imap_listscan imap_listsubscribed imap_lsub imap_mail imap_mail_compose
    imap_mail_copy imap_mail_move imap_mailboxmsginfo imap_mime_header_decode
    imap_msgno imap_num_msg imap_num_recent imap_open imap_ping imap_qprint
    imap_rename imap_renamemailbox imap_reopen imap_rfc822_parse_adrlist
    imap_rfc822_parse_headers imap_rfc822_write_address imap_savebody imap_scan
    imap_scanmailbox imap_search imap_set_quota imap_setacl imap_setflag_full
    imap_sort imap_status imap_subscribe imap_thread imap_timeout imap_uid
    imap_undelete imap_unsubscribe imap_utf7_decode imap_utf7_encode imap_utf8
    implode import_request_variables in_array include include_once inet_ntop
    inet_pton ini_alter ini_get ini_get_all ini_restore ini_set interface_exists
    intl_error_name intl_get_error_code intl_get_error_message intl_is_failure
    intval ip2long iptcembed iptcparse is_a is_array is_bool is_callable is_dir
    is_double is_executable is_file is_finite is_float is_infinite is_int is_integer
    is_link is_long is_nan is_null is_numeric is_object is_readable is_real
    is_resource is_scalar is_soap_fault is_string is_subclass_of is_tainted
    is_uploaded_file is_writable is_writeable isset iterator_apply iterator_count
    iterator_to_array jdtojewish jdtounix join jpeg2wbmp json_decode json_encode
    json_last_error key krsort ksort lcfirst lcg_value lchgrp lchown
    ldap_8859_to_t61 ldap_add ldap_bind ldap_close ldap_compare ldap_connect
    ldap_control_paged_result ldap_control_paged_result_response ldap_count_entries
    ldap_delete ldap_dn2ufn ldap_err2str ldap_errno ldap_error ldap_explode_dn
    ldap_first_attribute ldap_first_entry ldap_first_reference ldap_free_result
    ldap_get_attributes ldap_get_dn ldap_get_entries ldap_get_option ldap_get_values
    ldap_get_values_len ldap_list ldap_mod_add ldap_mod_del ldap_mod_replace
    ldap_modify ldap_next_attribute ldap_next_entry ldap_next_reference
    ldap_parse_reference ldap_parse_result ldap_read ldap_rename ldap_sasl_bind
    ldap_search ldap_set_option ldap_set_rebind_proc ldap_sort ldap_start_tls
    ldap_t61_to_8859 ldap_unbind levenshtein libxml_clear_errors
    libxml_disable_entity_loader libxml_get_errors libxml_get_last_error
    libxml_set_external_entity_loader libxml_set_streams_context
    libxml_use_internal_errors link linkinfo list locale_accept_from_http
    locale_compose locale_filter_matches locale_get_all_variants locale_get_default
    locale_get_display_language locale_get_display_name locale_get_display_region
    locale_get_display_script locale_get_display_variant locale_get_keywords
    locale_get_primary_language locale_get_region locale_get_script locale_lookup
    locale_parse locale_set_default localeconv localtime log log10 log1p long2ip
    lstat ltrim magic_quotes_runtime mail main max mb_check_encoding mb_convert_case
    mb_convert_encoding mb_convert_kana mb_convert_variables mb_decode_mimeheader
    mb_decode_numericentity mb_detect_encoding mb_detect_order mb_encode_mimeheader
    mb_encode_numericentity mb_encoding_aliases mb_ereg mb_ereg_match
    mb_ereg_replace mb_ereg_replace_callback mb_ereg_search mb_ereg_search_getpos
    mb_ereg_search_getregs mb_ereg_search_init mb_ereg_search_pos
    mb_ereg_search_regs mb_ereg_search_setpos mb_eregi mb_eregi_replace mb_get_info
    mb_http_input mb_http_output mb_internal_encoding mb_language mb_list_encodings
    mb_output_handler mb_parse_str mb_preferred_mime_name mb_regex_encoding
    mb_regex_set_options mb_send_mail mb_split mb_strcut mb_strimwidth mb_stripos
    mb_stristr mb_strlen mb_strpos mb_strrchr mb_strrichr mb_strripos mb_strrpos
    mb_strstr mb_strtolower mb_strtoupper mb_strwidth mb_substitute_character
    mb_substr mb_substr_count mcrypt_cbc mcrypt_cfb mcrypt_create_iv mcrypt_decrypt
    mcrypt_ecb mcrypt_enc_get_algorithms_name mcrypt_enc_get_block_size
    mcrypt_enc_get_iv_size mcrypt_enc_get_key_size mcrypt_enc_get_modes_name
    mcrypt_enc_get_supported_key_sizes mcrypt_enc_is_block_algorithm
    mcrypt_enc_is_block_algorithm_mode mcrypt_enc_is_block_mode mcrypt_enc_self_test
    mcrypt_encrypt mcrypt_generic mcrypt_generic_deinit mcrypt_generic_end
    mcrypt_generic_init mcrypt_get_block_size mcrypt_get_cipher_name
    mcrypt_get_iv_size mcrypt_get_key_size mcrypt_list_algorithms mcrypt_list_modes
    mcrypt_module_close mcrypt_module_get_algo_block_size
    mcrypt_module_get_algo_key_size mcrypt_module_get_supported_key_sizes
    mcrypt_module_is_block_algorithm mcrypt_module_is_block_algorithm_mode
    mcrypt_module_is_block_mode mcrypt_module_open mcrypt_module_self_test
    mcrypt_ofb md5 md5_file mdecrypt_generic memcache_debug memory_get_peak_usage
    memory_get_usage metaphone method_exists mhash mhash_count mhash_get_block_size
    mhash_get_hash_name mhash_keygen_s2k microtime mime_content_type min mkdir
    mktime money_format move_uploaded_file msg_get_queue msg_queue_exists
    msg_receive msg_remove_queue msg_send msg_set_queue msg_stat_queue msgfmt_create
    msgfmt_format msgfmt_format_message msgfmt_get_error_code
    msgfmt_get_error_message msgfmt_get_locale msgfmt_get_pattern msgfmt_parse
    msgfmt_parse_message msgfmt_set_pattern mssql_bind mssql_close mssql_connect
    mssql_data_seek mssql_execute mssql_fetch_array mssql_fetch_assoc
    mssql_fetch_batch mssql_fetch_field mssql_fetch_object mssql_fetch_row
    mssql_field_length mssql_field_name mssql_field_seek mssql_field_type
    mssql_free_result mssql_free_statement mssql_get_last_message mssql_guid_string
    mssql_init mssql_min_error_severity mssql_min_message_severity mssql_next_result
    mssql_num_fields mssql_num_rows mssql_pconnect mssql_query mssql_result
    mssql_rows_affected mssql_select_db mt_getrandmax mt_rand mt_srand
    mysql_affected_rows mysql_client_encoding mysql_close mysql_connect
    mysql_create_db mysql_data_seek mysql_db_name mysql_db_query mysql_drop_db
    mysql_errno mysql_error mysql_escape_string mysql_fetch_array mysql_fetch_assoc
    mysql_fetch_field mysql_fetch_lengths mysql_fetch_object mysql_fetch_row
    mysql_field_flags mysql_field_len mysql_field_name mysql_field_seek
    mysql_field_table mysql_field_type mysql_free_result mysql_get_client_info
    mysql_get_host_info mysql_get_proto_info mysql_get_server_info mysql_info
    mysql_insert_id mysql_list_dbs mysql_list_fields mysql_list_processes
    mysql_list_tables mysql_num_fields mysql_num_rows mysql_pconnect mysql_ping
    mysql_query mysql_real_escape_string mysql_result mysql_select_db
    mysql_set_charset mysql_stat mysql_tablename mysql_thread_id
    mysql_unbuffered_query mysqli mysqli_autocommit mysqli_bind_param
    mysqli_bind_result mysqli_change_user mysqli_character_set_name
    mysqli_client_encoding mysqli_close mysqli_commit mysqli_connect
    mysqli_data_seek mysqli_debug mysqli_disable_reads_from_master
    mysqli_disable_rpl_parse mysqli_driver mysqli_dump_debug_info
    mysqli_embedded_server_end mysqli_embedded_server_start
    mysqli_enable_reads_from_master mysqli_enable_rpl_parse mysqli_escape_string
    mysqli_execute mysqli_fetch mysqli_fetch_all mysqli_fetch_array
    mysqli_fetch_assoc mysqli_fetch_field mysqli_fetch_field_direct
    mysqli_fetch_fields mysqli_fetch_object mysqli_fetch_row mysqli_field_seek
    mysqli_free_result mysqli_get_cache_stats mysqli_get_charset
    mysqli_get_client_info mysqli_get_client_stats mysqli_get_client_version
    mysqli_get_connection_stats mysqli_get_metadata mysqli_get_warnings mysqli_init
    mysqli_kill mysqli_master_query mysqli_more_results mysqli_multi_query
    mysqli_next_result mysqli_options mysqli_param_count mysqli_ping mysqli_poll
    mysqli_prepare mysqli_query mysqli_real_connect mysqli_real_escape_string
    mysqli_real_query mysqli_reap_async_query mysqli_refresh mysqli_report
    mysqli_result mysqli_rollback mysqli_rpl_parse_enabled mysqli_rpl_probe
    mysqli_rpl_query_type mysqli_select_db mysqli_send_long_data mysqli_send_query
    mysqli_set_charset mysqli_set_local_infile_default
    mysqli_set_local_infile_handler mysqli_set_opt mysqli_slave_query mysqli_ssl_set
    mysqli_stat mysqli_stmt mysqli_stmt_attr_get mysqli_stmt_attr_set
    mysqli_stmt_bind_param mysqli_stmt_bind_result mysqli_stmt_close
    mysqli_stmt_data_seek mysqli_stmt_execute mysqli_stmt_fetch
    mysqli_stmt_free_result mysqli_stmt_get_result mysqli_stmt_get_warnings
    mysqli_stmt_init mysqli_stmt_more_results mysqli_stmt_next_result
    mysqli_stmt_prepare mysqli_stmt_reset mysqli_stmt_result_metadata
    mysqli_stmt_send_long_data mysqli_stmt_store_result mysqli_store_result
    mysqli_thread_safe mysqli_use_result mysqli_warning mysqlnd_memcache_get_config
    mysqlnd_memcache_set mysqlnd_ms_get_last_gtid
    mysqlnd_ms_get_last_used_connection mysqlnd_ms_get_stats mysqlnd_ms_match_wild
    mysqlnd_ms_query_is_select mysqlnd_ms_set_qos mysqlnd_ms_set_user_pick_server
    mysqlnd_qc_clear_cache mysqlnd_qc_get_available_handlers
    mysqlnd_qc_get_cache_info mysqlnd_qc_get_core_stats
    mysqlnd_qc_get_normalized_query_trace_log mysqlnd_qc_get_query_trace_log
    mysqlnd_qc_set_cache_condition mysqlnd_qc_set_is_select
    mysqlnd_qc_set_storage_handler mysqlnd_qc_set_user_handlers
    mysqlnd_uh_convert_to_mysqlnd mysqlnd_uh_set_connection_proxy
    mysqlnd_uh_set_statement_proxy natcasesort natsort next ngettext nl2br
    nl_langinfo normalizer_is_normalized normalizer_normalize nsapi_request_headers
    nsapi_response_headers nsapi_virtual number_format numfmt_create numfmt_format
    numfmt_format_currency numfmt_get_attribute numfmt_get_error_code
    numfmt_get_error_message numfmt_get_locale numfmt_get_pattern numfmt_get_symbol
    numfmt_get_text_attribute numfmt_parse numfmt_parse_currency
    numfmt_set_attribute numfmt_set_pattern numfmt_set_symbol
    numfmt_set_text_attribute ob_clean ob_deflatehandler ob_end_clean ob_end_flush
    ob_etaghandler ob_flush ob_get_clean ob_get_contents ob_get_flush ob_get_length
    ob_get_level ob_get_status ob_gzhandler ob_iconv_handler ob_implicit_flush
    ob_inflatehandler ob_list_handlers ob_start ob_tidyhandler
    oci_bind_array_by_name oci_bind_by_name oci_cancel oci_client_version oci_close
    oci_commit oci_connect oci_define_by_name oci_error oci_execute oci_fetch
    oci_fetch_all oci_fetch_array oci_fetch_assoc oci_fetch_object oci_fetch_row
    oci_field_is_null oci_field_name oci_field_precision oci_field_scale
    oci_field_size oci_field_type oci_field_type_raw oci_free_descriptor
    oci_free_statement oci_internal_debug oci_lob_copy oci_lob_is_equal
    oci_new_collection oci_new_connect oci_new_cursor oci_new_descriptor
    oci_num_fields oci_num_rows oci_parse oci_password_change oci_pconnect
    oci_result oci_rollback oci_server_version oci_set_action
    oci_set_client_identifier oci_set_client_info oci_set_edition
    oci_set_module_name oci_set_prefetch oci_statement_type ocibindbyname ocicancel
    ocicloselob ocicollappend ocicollassign ocicollassignelem ocicollgetelem
    ocicollmax ocicollsize ocicolltrim ocicolumnisnull ocicolumnname
    ocicolumnprecision ocicolumnscale ocicolumnsize ocicolumntype ocicolumntyperaw
    ocicommit ocidefinebyname ocierror ociexecute ocifetch ocifetchinto
    ocifetchstatement ocifreecollection ocifreecursor ocifreedesc ocifreestatement
    ociinternaldebug ociloadlob ocilogoff ocilogon ocinewcollection ocinewcursor
    ocinewdescriptor ocinlogon ocinumcols ociparse ociplogon ociresult ocirollback
    ocirowcount ocisavelob ocisavelobfile ociserverversion ocisetprefetch
    ocistatementtype ociwritelobtofile ociwritetemporarylob octdec odbc_autocommit
    odbc_binmode odbc_close odbc_close_all odbc_columnprivileges odbc_columns
    odbc_commit odbc_connect odbc_cursor odbc_data_source odbc_do odbc_error
    odbc_errormsg odbc_exec odbc_execute odbc_fetch_array odbc_fetch_into
    odbc_fetch_object odbc_fetch_row odbc_field_len odbc_field_name odbc_field_num
    odbc_field_precision odbc_field_scale odbc_field_type odbc_foreignkeys
    odbc_free_result odbc_gettypeinfo odbc_longreadlen odbc_next_result
    odbc_num_fields odbc_num_rows odbc_pconnect odbc_prepare odbc_primarykeys
    odbc_procedurecolumns odbc_procedures odbc_result odbc_result_all odbc_rollback
    odbc_setoption odbc_specialcolumns odbc_statistics odbc_tableprivileges
    odbc_tables opendir openlog openssl_cipher_iv_length openssl_csr_export
    openssl_csr_export_to_file openssl_csr_get_public_key openssl_csr_get_subject
    openssl_csr_new openssl_csr_sign openssl_decrypt openssl_dh_compute_key
    openssl_digest openssl_encrypt openssl_error_string openssl_free_key
    openssl_get_cipher_methods openssl_get_md_methods openssl_get_privatekey
    openssl_get_publickey openssl_open openssl_pkcs12_export
    openssl_pkcs12_export_to_file openssl_pkcs12_read openssl_pkcs7_decrypt
    openssl_pkcs7_encrypt openssl_pkcs7_sign openssl_pkcs7_verify
    openssl_pkey_export openssl_pkey_export_to_file openssl_pkey_free
    openssl_pkey_get_details openssl_pkey_get_private openssl_pkey_get_public
    openssl_pkey_new openssl_private_decrypt openssl_private_encrypt
    openssl_public_decrypt openssl_public_encrypt openssl_random_pseudo_bytes
    openssl_seal openssl_sign openssl_verify openssl_x509_check_private_key
    openssl_x509_checkpurpose openssl_x509_export openssl_x509_export_to_file
    openssl_x509_free openssl_x509_parse openssl_x509_read ord
    output_add_rewrite_var output_reset_rewrite_vars pack parse_ini_file
    parse_ini_string parse_str parse_url passthru password_get_info password_hash
    password_needs_rehash password_verify pathinfo pclose pcntl_alarm pcntl_exec
    pcntl_fork pcntl_getpriority pcntl_setpriority pcntl_signal
    pcntl_signal_dispatch pcntl_sigprocmask pcntl_sigtimedwait pcntl_sigwaitinfo
    pcntl_wait pcntl_waitpid pcntl_wexitstatus pcntl_wifexited pcntl_wifsignaled
    pcntl_wifstopped pcntl_wstopsig pcntl_wtermsig pfsockopen pg_affected_rows
    pg_cancel_query pg_client_encoding pg_close pg_connect pg_connection_busy
    pg_connection_reset pg_connection_status pg_convert pg_copy_from pg_copy_to
    pg_dbname pg_delete pg_end_copy pg_escape_bytea pg_escape_identifier
    pg_escape_literal pg_escape_string pg_execute pg_fetch_all pg_fetch_all_columns
    pg_fetch_array pg_fetch_assoc pg_fetch_object pg_fetch_result pg_fetch_row
    pg_field_is_null pg_field_name pg_field_num pg_field_prtlen pg_field_size
    pg_field_table pg_field_type pg_field_type_oid pg_free_result pg_get_notify
    pg_get_pid pg_get_result pg_host pg_insert pg_last_error pg_last_notice
    pg_last_oid pg_lo_close pg_lo_create pg_lo_export pg_lo_import pg_lo_open
    pg_lo_read pg_lo_read_all pg_lo_seek pg_lo_tell pg_lo_unlink pg_lo_write
    pg_meta_data pg_num_fields pg_num_rows pg_options pg_parameter_status
    pg_pconnect pg_ping pg_port pg_prepare pg_put_line pg_query pg_query_params
    pg_result_error pg_result_error_field pg_result_seek pg_result_status pg_select
    pg_send_execute pg_send_prepare pg_send_query pg_send_query_params
    pg_set_client_encoding pg_set_error_verbosity pg_trace pg_transaction_status
    pg_tty pg_unescape_bytea pg_untrace pg_update pg_version php_check_syntax
    php_ini_loaded_file php_ini_scanned_files php_logo_guid php_sapi_name
    php_strip_whitespace php_uname php_user_filter phpcredits phpinfo phpversion pi
    png2wbmp popen pos posix_access posix_ctermid posix_errno posix_get_last_error
    posix_getcwd posix_getegid posix_geteuid posix_getgid posix_getgrgid
    posix_getgrnam posix_getgroups posix_getlogin posix_getpgid posix_getpgrp
    posix_getpid posix_getppid posix_getpwnam posix_getpwuid posix_getrlimit
    posix_getsid posix_getuid posix_initgroups posix_isatty posix_kill posix_mkfifo
    posix_mknod posix_setegid posix_seteuid posix_setgid posix_setpgid posix_setsid
    posix_setuid posix_strerror posix_times posix_ttyname posix_uname pow
    preg_filter preg_grep preg_last_error preg_match preg_match_all preg_quote
    preg_replace preg_replace_callback preg_split prev print print_r printf
    proc_close proc_get_status proc_nice proc_open proc_terminate property_exists
    pspell_add_to_personal pspell_add_to_session pspell_check pspell_clear_session
    pspell_config_create pspell_config_data_dir pspell_config_dict_dir
    pspell_config_ignore pspell_config_mode pspell_config_personal
    pspell_config_repl pspell_config_runtogether pspell_config_save_repl pspell_new
    pspell_new_config pspell_new_personal pspell_save_wordlist
    pspell_store_replacement pspell_suggest putenv quoted_printable_decode
    quoted_printable_encode quotemeta rad2deg rand range rawurldecode rawurlencode
    read_exif_data readdir readfile readgzfile readline readline_add_history
    readline_callback_handler_install readline_callback_handler_remove
    readline_callback_read_char readline_clear_history readline_completion_function
    readline_info readline_list_history readline_on_new_line readline_read_history
    readline_redisplay readline_write_history readlink realpath realpath_cache_get
    realpath_cache_size recode recode_file recode_string register_shutdown_function
    register_tick_function rename require require_once reset resourcebundle_count
    resourcebundle_create resourcebundle_get resourcebundle_get_error_code
    resourcebundle_get_error_message resourcebundle_locales restore_error_handler
    restore_exception_handler restore_include_path rewind rewinddir rmdir round
    rrd_create rrd_error rrd_fetch rrd_first rrd_graph rrd_info rrd_last
    rrd_lastupdate rrd_restore rrd_tune rrd_update rrd_version rrd_xport rsort rtrim
    scandir sem_acquire sem_get sem_release sem_remove serialize
    session_cache_expire session_cache_limiter session_commit session_decode
    session_destroy session_encode session_get_cookie_params session_id
    session_is_registered session_module_name session_name session_regenerate_id
    session_register session_register_shutdown session_save_path
    session_set_cookie_params session_set_save_handler session_start session_status
    session_unregister session_unset session_write_close set_error_handler
    set_exception_handler set_file_buffer set_include_path set_magic_quotes_runtime
    set_socket_blocking set_time_limit setcookie setlocale setproctitle setrawcookie
    setthreadtitle settype sha1 sha1_file shell_exec shm_attach shm_detach
    shm_get_var shm_has_var shm_put_var shm_remove shm_remove_var shmop_close
    shmop_delete shmop_open shmop_read shmop_size shmop_write show_source shuffle
    similar_text simplexml_import_dom simplexml_load_file simplexml_load_string sin
    sinh sizeof sleep snmp2_get snmp2_getnext snmp2_real_walk snmp2_set snmp2_walk
    snmp3_get snmp3_getnext snmp3_real_walk snmp3_set snmp3_walk
    snmp_get_quick_print snmp_get_valueretrieval snmp_read_mib snmp_set_enum_print
    snmp_set_oid_numeric_print snmp_set_oid_output_format snmp_set_quick_print
    snmp_set_valueretrieval snmpget snmpgetnext snmprealwalk snmpset snmpwalk
    snmpwalkoid socket_accept socket_bind socket_clear_error socket_close
    socket_connect socket_create socket_create_listen socket_create_pair
    socket_get_option socket_get_status socket_getpeername socket_getsockname
    socket_import_stream socket_last_error socket_listen socket_read socket_recv
    socket_recvfrom socket_select socket_send socket_sendto socket_set_block
    socket_set_blocking socket_set_nonblock socket_set_option socket_set_timeout
    socket_shutdown socket_strerror socket_write sort soundex spl_autoload
    spl_autoload_call spl_autoload_extensions spl_autoload_functions
    spl_autoload_register spl_autoload_unregister spl_classes spl_object_hash split
    spliti sprintf sql_regcase sqlite_array_query sqlite_busy_timeout sqlite_changes
    sqlite_close sqlite_column sqlite_create_aggregate sqlite_create_function
    sqlite_current sqlite_error_string sqlite_escape_string sqlite_exec
    sqlite_factory sqlite_fetch_all sqlite_fetch_array sqlite_fetch_column_types
    sqlite_fetch_object sqlite_fetch_single sqlite_fetch_string sqlite_field_name
    sqlite_has_more sqlite_has_prev sqlite_key sqlite_last_error
    sqlite_last_insert_rowid sqlite_libencoding sqlite_libversion sqlite_next
    sqlite_num_fields sqlite_num_rows sqlite_open sqlite_popen sqlite_prev
    sqlite_query sqlite_rewind sqlite_seek sqlite_single_query
    sqlite_udf_decode_binary sqlite_udf_encode_binary sqlite_unbuffered_query
    sqlite_valid sqlsrv_begin_transaction sqlsrv_cancel sqlsrv_client_info
    sqlsrv_close sqlsrv_commit sqlsrv_configure sqlsrv_connect sqlsrv_errors
    sqlsrv_execute sqlsrv_fetch sqlsrv_fetch_array sqlsrv_fetch_object
    sqlsrv_field_metadata sqlsrv_free_stmt sqlsrv_get_config sqlsrv_get_field
    sqlsrv_has_rows sqlsrv_next_result sqlsrv_num_fields sqlsrv_num_rows
    sqlsrv_prepare sqlsrv_query sqlsrv_rollback sqlsrv_rows_affected
    sqlsrv_send_stream_data sqlsrv_server_info sqrt srand sscanf stat
    stats_absolute_deviation stats_cdf_beta stats_cdf_binomial stats_cdf_cauchy
    stats_cdf_chisquare stats_cdf_exponential stats_cdf_f stats_cdf_gamma
    stats_cdf_laplace stats_cdf_logistic stats_cdf_negative_binomial
    stats_cdf_noncentral_chisquare stats_cdf_noncentral_f stats_cdf_poisson
    stats_cdf_t stats_cdf_uniform stats_cdf_weibull stats_covariance
    stats_den_uniform stats_dens_beta stats_dens_cauchy stats_dens_chisquare
    stats_dens_exponential stats_dens_f stats_dens_gamma stats_dens_laplace
    stats_dens_logistic stats_dens_negative_binomial stats_dens_normal
    stats_dens_pmf_binomial stats_dens_pmf_hypergeometric stats_dens_pmf_poisson
    stats_dens_t stats_dens_weibull stats_harmonic_mean stats_kurtosis
    stats_rand_gen_beta stats_rand_gen_chisquare stats_rand_gen_exponential
    stats_rand_gen_f stats_rand_gen_funiform stats_rand_gen_gamma
    stats_rand_gen_ibinomial stats_rand_gen_ibinomial_negative stats_rand_gen_int
    stats_rand_gen_ipoisson stats_rand_gen_iuniform
    stats_rand_gen_noncenral_chisquare stats_rand_gen_noncentral_f
    stats_rand_gen_noncentral_t stats_rand_gen_normal stats_rand_gen_t
    stats_rand_get_seeds stats_rand_phrase_to_seeds stats_rand_ranf
    stats_rand_setall stats_skew stats_standard_deviation stats_stat_binomial_coef
    stats_stat_correlation stats_stat_gennch stats_stat_independent_t
    stats_stat_innerproduct stats_stat_noncentral_t stats_stat_paired_t
    stats_stat_percentile stats_stat_powersum stats_variance stdClass str_getcsv
    str_ireplace str_pad str_repeat str_replace str_rot13 str_shuffle str_split
    str_word_count strcasecmp strchr strcmp strcoll strcspn streamWrapper
    stream_bucket_append stream_bucket_make_writeable stream_bucket_new
    stream_bucket_prepend stream_context_create stream_context_get_default
    stream_context_get_options stream_context_get_params stream_context_set_default
    stream_context_set_option stream_context_set_params stream_copy_to_stream
    stream_encoding stream_filter_append stream_filter_prepend
    stream_filter_register stream_filter_remove stream_get_contents
    stream_get_filters stream_get_line stream_get_meta_data stream_get_transports
    stream_get_wrappers stream_is_local stream_notification_callback
    stream_register_wrapper stream_resolve_include_path stream_select
    stream_set_blocking stream_set_chunk_size stream_set_read_buffer
    stream_set_timeout stream_set_write_buffer stream_socket_accept
    stream_socket_client stream_socket_enable_crypto stream_socket_get_name
    stream_socket_pair stream_socket_recvfrom stream_socket_sendto
    stream_socket_server stream_socket_shutdown stream_supports_lock
    stream_wrapper_register stream_wrapper_restore stream_wrapper_unregister
    strftime strip_tags stripcslashes stripos stripslashes stristr strlen
    strnatcasecmp strnatcmp strncasecmp strncmp strpbrk strpos strptime strrchr
    strrev strripos strrpos strspn strstr strtok strtolower strtotime strtoupper
    strtr strval substr substr_compare substr_count substr_replace
    sybase_affected_rows sybase_close sybase_connect sybase_data_seek
    sybase_deadlock_retry_count sybase_fetch_array sybase_fetch_assoc
    sybase_fetch_field sybase_fetch_object sybase_fetch_row sybase_field_seek
    sybase_free_result sybase_get_last_message sybase_min_client_severity
    sybase_min_error_severity sybase_min_message_severity sybase_min_server_severity
    sybase_num_fields sybase_num_rows sybase_pconnect sybase_query sybase_result
    sybase_select_db sybase_set_message_handler sybase_unbuffered_query symlink
    sys_get_temp_dir sys_getloadavg syslog system taint tan tanh tempnam textdomain
    tidy tidyNode tidy_access_count tidy_clean_repair tidy_config_count
    tidy_diagnose tidy_error_count tidy_get_body tidy_get_config tidy_get_head
    tidy_get_html tidy_get_html_ver tidy_get_opt_doc tidy_get_output
    tidy_get_release tidy_get_root tidy_get_status tidy_getopt tidy_is_xhtml
    tidy_is_xml tidy_load_config tidy_parse_file tidy_parse_string tidy_repair_file
    tidy_repair_string tidy_reset_config tidy_save_config tidy_set_encoding
    tidy_setopt tidy_warning_count time time_nanosleep time_sleep_until
    timezone_abbreviations_list timezone_identifiers_list timezone_location_get
    timezone_name_from_abbr timezone_name_get timezone_offset_get timezone_open
    timezone_transitions_get timezone_version_get tmpfile token_get_all token_name
    touch trader_acos trader_ad trader_add trader_adosc trader_adx trader_adxr
    trader_apo trader_aroon trader_aroonosc trader_asin trader_atan trader_atr
    trader_avgprice trader_bbands trader_beta trader_bop trader_cci trader_cdl2crows
    trader_cdl3blackcrows trader_cdl3inside trader_cdl3linestrike trader_cdl3outside
    trader_cdl3starsinsouth trader_cdl3whitesoldiers trader_cdlabandonedbaby
    trader_cdladvanceblock trader_cdlbelthold trader_cdlbreakaway
    trader_cdlclosingmarubozu trader_cdlconcealbabyswall trader_cdlcounterattack
    trader_cdldarkcloudcover trader_cdldoji trader_cdldojistar
    trader_cdldragonflydoji trader_cdlengulfing trader_cdleveningdojistar
    trader_cdleveningstar trader_cdlgapsidesidewhite trader_cdlgravestonedoji
    trader_cdlhammer trader_cdlhangingman trader_cdlharami trader_cdlharamicross
    trader_cdlhighwave trader_cdlhikkake trader_cdlhikkakemod trader_cdlhomingpigeon
    trader_cdlidentical3crows trader_cdlinneck trader_cdlinvertedhammer
    trader_cdlkicking trader_cdlkickingbylength trader_cdlladderbottom
    trader_cdllongleggeddoji trader_cdllongline trader_cdlmarubozu
    trader_cdlmatchinglow trader_cdlmathold trader_cdlmorningdojistar
    trader_cdlmorningstar trader_cdlonneck trader_cdlpiercing trader_cdlrickshawman
    trader_cdlrisefall3methods trader_cdlseparatinglines trader_cdlshootingstar
    trader_cdlshortline trader_cdlspinningtop trader_cdlstalledpattern
    trader_cdlsticksandwich trader_cdltakuri trader_cdltasukigap trader_cdlthrusting
    trader_cdltristar trader_cdlunique3river trader_cdlupsidegap2crows
    trader_cdlxsidegap3methods trader_ceil trader_cmo trader_correl trader_cos
    trader_cosh trader_dema trader_div trader_dx trader_ema trader_errno trader_exp
    trader_floor trader_get_compat trader_get_unstable_period trader_ht_dcperiod
    trader_ht_dcphase trader_ht_phasor trader_ht_sine trader_ht_trendline
    trader_ht_trendmode trader_kama trader_linearreg trader_linearreg_angle
    trader_linearreg_intercept trader_linearreg_slope trader_ln trader_log10
    trader_ma trader_macd trader_macdext trader_macdfix trader_mama trader_mavp
    trader_max trader_maxindex trader_medprice trader_mfi trader_midpoint
    trader_midprice trader_min trader_minindex trader_minmax trader_minmaxindex
    trader_minus_di trader_minus_dm trader_mom trader_mult trader_natr trader_obv
    trader_plus_di trader_plus_dm trader_ppo trader_roc trader_rocp trader_rocr
    trader_rocr100 trader_rsi trader_sar trader_sarext trader_set_compat
    trader_set_unstable_period trader_sin trader_sinh trader_sma trader_sqrt
    trader_stddev trader_stoch trader_stochf trader_stochrsi trader_sub trader_sum
    trader_t3 trader_tan trader_tanh trader_tema trader_trange trader_trima
    trader_trix trader_tsf trader_typprice trader_ultosc trader_var trader_wclprice
    trader_willr trader_wma trait_exists transliterator_create
    transliterator_create_from_rules transliterator_create_inverse
    transliterator_get_error_code transliterator_get_error_message
    transliterator_list_ids transliterator_transliterate trigger_error trim uasort
    ucfirst ucwords uksort umask uniqid unixtojd unlink unpack
    unregister_tick_function unserialize unset untaint urldecode urlencode
    use_soap_error_handler user_error usleep usort utf8_decode utf8_encode var_dump
    var_export variant_abs variant_add variant_and variant_cast variant_cat
    variant_cmp variant_date_from_timestamp variant_date_to_timestamp variant_div
    variant_eqv variant_fix variant_get_type variant_idiv variant_imp variant_int
    variant_mod variant_mul variant_neg variant_not variant_or variant_pow
    variant_round variant_set variant_set_type variant_sub variant_xor
    version_compare vfprintf virtual vprintf vsprintf wddx_add_vars wddx_deserialize
    wddx_packet_end wddx_packet_start wddx_serialize_value wddx_serialize_vars
    wordwrap xhprof_disable xhprof_enable xhprof_sample_disable xhprof_sample_enable
    xml_error_string xml_get_current_byte_index xml_get_current_column_number
    xml_get_current_line_number xml_get_error_code xml_parse xml_parse_into_struct
    xml_parser_create xml_parser_create_ns xml_parser_free xml_parser_get_option
    xml_parser_set_option xml_set_character_data_handler xml_set_default_handler
    xml_set_element_handler xml_set_end_namespace_decl_handler
    xml_set_external_entity_ref_handler xml_set_notation_decl_handler xml_set_object
    xml_set_processing_instruction_handler xml_set_start_namespace_decl_handler
    xml_set_unparsed_entity_decl_handler xmlrpc_decode xmlrpc_decode_request
    xmlrpc_encode xmlrpc_encode_request xmlrpc_get_type xmlrpc_is_fault
    xmlrpc_parse_method_descriptions xmlrpc_server_add_introspection_data
    xmlrpc_server_call_method xmlrpc_server_create xmlrpc_server_destroy
    xmlrpc_server_register_introspection_callback xmlrpc_server_register_method
    xmlrpc_set_type xmlwriter_end_attribute xmlwriter_end_cdata
    xmlwriter_end_comment xmlwriter_end_document xmlwriter_end_dtd
    xmlwriter_end_dtd_attlist xmlwriter_end_dtd_element xmlwriter_end_dtd_entity
    xmlwriter_end_element xmlwriter_end_pi xmlwriter_flush
    xmlwriter_full_end_element xmlwriter_open_memory xmlwriter_open_uri
    xmlwriter_output_memory xmlwriter_set_indent xmlwriter_set_indent_string
    xmlwriter_start_attribute xmlwriter_start_attribute_ns xmlwriter_start_cdata
    xmlwriter_start_comment xmlwriter_start_document xmlwriter_start_dtd
    xmlwriter_start_dtd_attlist xmlwriter_start_dtd_element
    xmlwriter_start_dtd_entity xmlwriter_start_element xmlwriter_start_element_ns
    xmlwriter_start_pi xmlwriter_text xmlwriter_write_attribute
    xmlwriter_write_attribute_ns xmlwriter_write_cdata xmlwriter_write_comment
    xmlwriter_write_dtd xmlwriter_write_dtd_attlist xmlwriter_write_dtd_element
    xmlwriter_write_dtd_entity xmlwriter_write_element xmlwriter_write_element_ns
    xmlwriter_write_pi xmlwriter_write_raw xslt_backend_info xslt_backend_name
    xslt_backend_version xslt_create xslt_errno xslt_error xslt_free xslt_getopt
    xslt_process xslt_set_base xslt_set_encoding xslt_set_error_handler xslt_set_log
    xslt_set_object xslt_set_sax_handler xslt_set_sax_handlers
    xslt_set_scheme_handler xslt_set_scheme_handlers xslt_setopt zend_logo_guid
    zend_thread_id zend_version zip_close zip_entry_close zip_entry_compressedsize
    zip_entry_compressionmethod zip_entry_filesize zip_entry_name zip_entry_open
    zip_entry_read zip_open zip_read zlib_decode zlib_encode zlib_get_coding_type
  )
  uuid "2543E52B-D5CF-4BBE-B792-51F1574EA05F"
end

preferences 'Completion: includes' => 'meta.include.php string.quoted' do
  completion_command <<-'TXT'
    /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby <<-'RUBY'
    path = ENV["TM_CURRENT_LINE"].to_s[0..ENV["TM_COLUMN_NUMBER"].to_i-1].to_s[/['"]([^'"]+)['"]/,1].to_s + "*"
    Dir::chdir(File.dirname(ENV["TM_FILEPATH"])) if ENV["TM_FILEPATH"]
    include_paths = ENV["PHP_INCLUDE_PATH"] ? ENV["PHP_INCLUDE_PATH"].split(":") : ["."]
    matches = include_paths.inject([]) do |res, include_path|
      include_path << "/" unless include_path[-1] == ?/
      res + Dir.glob(include_path + path).map {|file| 
      file[include_path.size..-1][/[^\/]+$/] + (File.directory?(file) ? "/" : "")
      }
    end
    puts matches.sort.uniq.join("\n")
    RUBY
  TXT
  disable_default_completion true
  uuid "CBE2288F-76FC-4813-B69B-B90FFAE3391C"
end

preferences 'Disable spellcheck in require' => 'meta.include.php string.quoted' do
  spell_checking false
  uuid "FD4397A8-415F-47BC-9F8D-E0F0EC364286"
end

preferences 'Enable Spellchecking for Docblocks' => 'comment.block.documentation.phpdoc.php' do
  spell_checking true
  uuid "E2D08D2E-A99C-4F3A-9B1D-05A75D37A819"
end

preferences 'Indentation: Arrays' => 'source.php meta.array.php', file: 'Indentation Arrays' do
  decrease_indent_pattern %r'(?x)
      ^ (.* \*/)? \s*
      (\)+)
  '
  uuid "58096C41-EA70-488D-A163-8CD4C687B301"
end

preferences 'Indentation Rules' => 'source.php -string' do
  decrease_indent_pattern %r'(?x)
      ^ (.* \*/)? \s*
      (
          (\})         |
          (\)+[;,])    |
          (\][;,])     |
          (else:)      |
          ((end(if|for(each)?|while|switch));)
      )
  '
  increase_indent_pattern %r'(?x)
      (   \{ (?! .+ \} ) .*
      |   array\(
      |   (\[)
      |   ((else)?if|else|for(each)?|while|switch) .* :
      )   \s* (/[/*] .*)? $'
  indent_next_line_pattern %r'(?x)^
    (?! .*? (<\?|\?>) )
    (?! \s* ($|//|/\*|\#))
    (?! .* [;:{}(,] \s* ((//|/\*|\#).*)? $)
  '
  un_indented_line_pattern %r/^\s*$/
  uuid "CA15DF69-E80D-46DA-BD45-E88C68E92117"
end

preferences 'Miscellaneous' => 'source.php' do
  highlight_pairs "() {} [] “”"
  uuid "F15B444C-13E3-4A3C-83E1-4A6E0C1A84F3"
end

preferences 'Symbols List: Indent Functions' => 'entity.name.function.php, support.function.magic.php', file: 'Symbols List˸ functions' do
  symbol_transformation "s/^/ /;  # pad"
  uuid "5157F71C-2801-4385-92EA-3D0B72AEE7C5"
end
