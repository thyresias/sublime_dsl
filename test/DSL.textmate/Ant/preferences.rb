# encoding: utf-8

preferences 'Completions' => 'text.xml.ant', file: 'Autocompletions' do
  completions %w(
    add ant antcall antfile antlr antstructure append apply apt arg args attrib
    author available base basedir basename bootclasspath bootclasspathref bottom
    buildnumber cab casesensitive catalogpath changelog charset checksum chgrp chmod
    chown classname classpath classpathref command common compiler compress concat
    condition conditions copy copydir copyfile cr cvs cvspass cvsRoot cvstagdiff
    cvsversion debug debuglevel default defaultexcludes delete deleteonexit deltree
    depend depends dependset deprecation description dest destDir destdir destfile
    diagnostics dir dirname dirset docencoding doctitle dtd duplicate ear echo
    echoproperties echoxml enamblemultiplemappings encoding entity entry eof error
    errorproperty exclude excludes excludesfile exec executable expand ext extdirs
    extension factory fail failonerror file filelist filepath fileset filesonly
    filter filtering filterset fixcrlf flatten followsymlinks footer force fork
    format ftp genkey get globmapper granularity group gunzip gzip header helpfile
    ID id if ignore ignoresystemclasses image implementation import in include
    includeAntRuntime includeEmptyDirs includeemptydirs includeJavaRuntime includes
    includesfile inheritAll inheritRefs input inputstring items jar jarfile
    jarlib-available jarlib-display jarlib-manifest jarlib-resolve java javac javacc
    javadoc javadoc2 javah jdepend jjdoc jjtree jlink jspc junit junitreport jvm
    jvmargs keepcompression keys keysubst length link linkoffline listfiles loadfile
    loadproperties loadresource locale location logError macrodef mail makeurl
    manifest manifestclasspath maxmemory memoryInitialSize memoryMaximumSize message
    mimemail mkdir move name native2ascii netrexxc newenvironment nice
    nodedeprecated nodedeprecatedlist nohelp noindex nonavbar notree nowarn offset
    old optimize os out output outputencoding outputproperty overview overwrite pack
    package packagenames parallel param patch path pathconvert pathelement pathref
    pattern patternset perm prefix preservelastmodified presetdef private processor
    project property propertyfile protected public publicId pvcs pvcsproject quiet
    recorder reference refid reloadstylesheet remove rename renameext replace
    replaceregexp resource resourcecount resultproperty reverse rexec rmic roundup
    scale scanincludeddirectories schemavalidate scp script scriptdef sep sequential
    serialwarn serverdeploy setproxy signjar sleep sound source sourcefiles
    sourcepath spawn splash splitindex sql src srcdir sshexec style stylebook
    stylesheetfile subant symlink sync tab tag tar tarfile target taskdef telnet
    tempdir tempfile timeout timezone todir tofile token torefid touch translate
    tstamp type typedef unit unless unpack untar unzip update uptodate use value
    verbose version waitfor war warfile webxml whichresource windowtitle wljspc
    xmlcatalog xmlproperty xmlvalidate xslt zip zipfile
  )
  uuid "AE288C48-081B-4615-A8B6-03041B92652B"
end

preferences 'Folding' => 'text.xml.ant' do
  folding_start_marker %r'^\s*(<[^!?%/](?!.+?(/>|</.+?>))|<[!%]--(?!.+?--%?>)|<%[!]?(?!.+?%>))'
  folding_stop_marker %r'^\s*(</[^>]+>|[/%]>|-->)\s*$'
  uuid "938741E0-56D1-481B-8EC3-881AEA9652A2"
end

preferences 'Symbol List: Macro' => 'meta.tag.macrodef.xml.ant', file: 'Symbol List Macro' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/.*name="([\w-]+)".*/$1/g;		# Keep macro name only.
    s/^/macro: /;				# Add macro prefix.
  TXT
  uuid "250EA0F3-362B-406D-8FDD-D1EF8C3F2D88"
end

preferences 'Symbol List: Target' => 'meta.tag.target.xml.ant', file: 'Symbol List Target' do
  show_in_symbol_list true
  symbol_transformation <<-'TXT'
    s/.*name="([\w\.:-]+)".*/$1/g;		# Keep target name only.
    s/^/target: /;				# Add target prefix.
  TXT
  uuid "6078A7B7-1947-4A1A-9669-F9448479FA65"
end
