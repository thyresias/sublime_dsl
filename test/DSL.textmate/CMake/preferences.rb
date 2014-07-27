# encoding: utf-8

preferences 'Comments' => 'source.cmake' do
  shell_variable 'TM_COMMENT_START', '# '
  uuid "FCA85521-74FC-4A71-9ADE-DC055E63CAEE"
end

preferences 'Completions' => 'source.cmake' do
  completion_command '$TM_CMAKE --help-command-list | grep "^$TM_CURRENT_WORD" | tr "[a-z]" "[A-Z]"'
  completions %w(
    ADD_CUSTOM_COMMAND ADD_CUSTOM_TARGET ADD_DEFINITIONS ADD_DEPENDENCIES
    ADD_EXECUTABLE ADD_LIBRARY ADD_SUBDIRECTORY ADD_TEST AUX_SOURCE_DIRECTORY BREAK
    BUILD_COMMAND CMAKE_MINIMUM_REQUIRED CMAKE_POLICY CONFIGURE_FILE
    CREATE_TEST_SOURCELIST DEFINE_PROPERTY ELSE ELSEIF ENABLE_LANGUAGE
    ENABLE_TESTING ENDFOREACH ENDFUNCTION ENDIF ENDMACRO ENDWHILE EXECUTE_PROCESS
    EXPORT FILE FIND_FILE FIND_LIBRARY FIND_PACKAGE FIND_PATH FIND_PROGRAM
    FLTK_WRAP_UI FOREACH FUNCTION GET_CMAKE_PROPERTY GET_DIRECTORY_PROPERTY
    GET_FILENAME_COMPONENT GET_PROPERTY GET_SOURCE_FILE_PROPERTY GET_TARGET_PROPERTY
    GET_TEST_PROPERTY IF INCLUDE INCLUDE_DIRECTORIES INCLUDE_EXTERNAL_MSPROJECT
    INCLUDE_REGULAR_EXPRESSION INSTALL LINK_DIRECTORIES LIST LOAD_CACHE LOAD_COMMAND
    MACRO MARK_AS_ADVANCED MATH MESSAGE OPTION PROJECT QT_WRAP_CPP QT_WRAP_UI
    REMOVE_DEFINITIONS RETURN SEPARATE_ARGUMENTS SET SET_DIRECTORY_PROPERTIES
    SET_PROPERTY SET_SOURCE_FILES_PROPERTIES SET_TARGET_PROPERTIES
    SET_TESTS_PROPERTIES SITE_NAME SOURCE_GROUP STRING TARGET_LINK_LIBRARIES
    TRY_COMPILE TRY_RUN UNSET VARIABLE_WATCH WHILE BUILD_NAME EXEC_PROGRAM
    EXPORT_LIBRARY_DEPENDENCIES INSTALL_FILES INSTALL_PROGRAMS INSTALL_TARGETS
    LINK_LIBRARIES MAKE_DIRECTORY OUTPUT_REQUIRED_FILES REMOVE SUBDIR_DEPENDS
    SUBDIRS USE_MANGLED_MESA UTILITY_SOURCE VARIABLE_REQUIRES WRITE_FILE
    add_custom_command add_custom_target add_definitions add_dependencies
    add_executable add_library add_subdirectory add_test aux_source_directory break
    build_command cmake_minimum_required cmake_policy configure_file
    create_test_sourcelist define_property else elseif enable_language
    enable_testing endforeach endfunction endif endmacro endwhile execute_process
    export file find_file find_library find_package find_path find_program
    fltk_wrap_ui foreach function get_cmake_property get_directory_property
    get_filename_component get_property get_source_file_property get_target_property
    get_test_property if include include_directories include_external_msproject
    include_regular_expression install link_directories list load_cache load_command
    macro mark_as_advanced math message option project qt_wrap_cpp qt_wrap_ui
    remove_definitions return separate_arguments set set_directory_properties
    set_property set_source_files_properties set_target_properties
    set_tests_properties site_name source_group string target_link_libraries
    try_compile try_run unset variable_watch while build_name exec_program
    export_library_dependencies install_files install_programs install_targets
    link_libraries make_directory output_required_files remove subdir_depends
    subdirs use_mangled_mesa utility_source variable_requires write_file
  )
  uuid "E60C579C-BEE8-4C0F-8FA3-0F9E1A851154"
end

preferences 'Folding' => 'source.cmake' do
  folding_start_marker %r'/\*\*|\{\s*$'
  folding_stop_marker %r'\*\*/|^\s*\}'
  uuid "915B4629-A5AD-4BF9-A298-00D4F6B45B04"
end

preferences 'Indentation Rules' => 'source.cmake' do
  decrease_indent_pattern %r/(?xi)
      \b end(function|macro|if|foreach|while) \b
   |  \b else(if)? \b
   |  ^ [^(]* \) \s* $
  /
  increase_indent_pattern %r/(?xi)
      \b (function|macro|if|foreach|while) \b
   |  \b else(if)? \b
   |  \( [^)]* $
  /
  uuid "D58FED93-633B-4C26-89C1-53198843416A"
end

preferences 'Symbol List (Cache)' => 'variable.language.cache.cmake' do
  show_in_symbol_list true
  uuid "23091B8D-C047-4C6F-8E67-0A4430A33580"
end

preferences 'Symbol List' => 'meta.function-call.function.cmake' do
  show_in_symbol_list true
  symbol_transformation 's/^(\w+).*$/$1/'
  uuid "3C9C38E0-2EC5-4963-9FC1-BD2D04EC62F7"
end
