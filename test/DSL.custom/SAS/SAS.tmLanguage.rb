# encoding: utf-8

# --------------------------------------------------------------------------------------------------
#   keyword lists
# --------------------------------------------------------------------------------------------------

module SASKeywords

  include Tools::Helpers

  # data step functions

  def data_functions_re

    data = <<-DATA
      anyxdigit

      # Arithmetic
      divide

      # Array
      dim hbound lbound

      # Bitwise Logical Operations
      band blshift bnot bor brshift bxor

      # Character String Matching
      prxchange prxmatch prxparen prxparse prxposn

      # Character
      anyalnum anyalpha anycntrl anydigit anyfirst anygraph anylower anyname anyprint anypunct
      anyspace anyupper anyxdigit byte cat catq cats catt catx char choosec choosen coalescec collate
      compare compbl compged complev compress count countc countw dequote find findc findw first ifc
      index indexc indexw left length lengthc lengthm lengthn lowcase md5 missing nliteral notalnum
      notalpha notcntrl notdigit notfirst notgraph notlower notname notprint notpunct notspace
      notupper notxdigit nvalid propcase quote rank repeat reverse right scan soundex spedis strip
      subpad substr substrn translate transtrn tranwrd trim trimn upcase verify

      # Combinatorial
      allcomb allperm comb graycode lcomb lexcomb lexcombi lexperk lexperm lfact lperm perm

      # Date and Time
      datdif date datejul datepart datetime day dhms hms holiday hour intcindex intck intcycle intfit
      intfmt intget intindex intnx intseas intshift inttest juldate juldate7 mdy minute month nwkdom
      qtr second time timepart today week weekday year yrdif yyq

      # Descriptive Statistics
      cmiss css cv euclid geomean geomeanz harmean harmeanz iqr kurtosis largest lpnorm mad max mean
      median min missing n nmiss ordinal pctl range rms skewness smallest std stderr sum sumabs uss
      var

      # Distance
      geodist zipcitydistance

      # External Files
      dclose dcreate dinfo dnum dopen doptname doptnum dread dropnote fappend fclose fcol fdelete
      fexist fget fileexist filename fileref finfo fnote fopen foptname foptnum fpoint fpos fput fread
      frewind frlen fsep fwrite mopen pathname rename sysmsg sysrc

      # External Routines
      modulec modulen

      # Financial
      blackclprc blackptprc blkshclprc blkshptprc compound convx convxp daccdb daccdbsl daccsl daccsyd
      dacctab depdb depdbsl depsl depsyd deptab dur durp finance garkhclprc garkhptprc intrr irr
      margrclprc margrptprc mort netpv npv pvp saving yieldp

      # Hyperbolic
      arcosh arsinh artanh cosh sinh tanh

      # Macro
      resolve symexist symget symglobl symlocal

      # Mathematical
      abs airy beta cnonct coalesce constant dairy deviance digamma erf erfc exp fact fnonct gamma gcd
      ibessel jbessel lcm lgamma log log1px log10 log2 logbeta mod modz msplint sign sqrt tnonct
      trigamma

      # Numeric
      ifn

      # Probability
      cdf logcdf logpdf logsdf pdf poisson probbeta probbnml probbnrm probchi probf probgam probhypr
      probmc probnegb probnorm probt sdf

      # Quantile
      betainv cinv finv gaminv probit quantile tinv

      # Random Number
      normal ranbin rancau rand ranexp rangam rannor ranpoi rantbl rantri ranuni uniform

      # SAS File I/O
      attrc attrn cexist close curobs dropnote dsname envlen exist fetch fetchobs getvarc getvarn
      iorcmsg libname libref note open pathname point rename rewind sysmsg sysrc varfmt varinfmt
      varlabel varlen varname varnum vartype

      # search
      whichc whichn

      # Special
      addr addrlong dif getoption input inputc inputn lag peek peekc peekclong peeklong ptrlongadd put
      putc putn sleep sysget sysparm sysprocessid sysprocessname sysprod system uuidgen

      # State and Zip Code
      fipname fipnamel fipstate stfips stname stnamel zipcity zipcitydistance zipfips zipname zipnamel
      zipstate

      # Trigonometric
      arcos arsin atan atan2 cos sin tan

      # Truncation
      ceil ceilz floor floorz fuzz int intz round rounde roundz trunc

      # Variable Information
      varray varrayx vformat vformatd vformatdx vformatn vformatnx vformatw vformatwx vformatx
      vinarray vinarrayx vinformat vinformatd vinformatdx vinformatn vinformatnx vinformatw
      vinformatwx vinformatx vlabel vlabelx vlength vlengthx vname vnamex vtype vtypex vvalue vvaluex

      # Web Tools
      htmldecode htmlencode urldecode urlencode
    DATA

    lines = data.lines.reject { |l| l.strip!; l.empty? || l[0] == '#' }
    words = lines.map(&:strip).join(' ').split(/\s+/).sort.uniq

    optimized_re(words)
  end

  # data step call routines

  def call_routines_re

    data = <<-DATA
      # RegExp
      prxchange prxdebug prxfree prxnext prxposn prxsubstr

      # Character
      cats catt catx compcost missing scan

      # Combinatorial
      allcomb allcombi allperm graycode lexcomb lexcombi lexperk lexperm ranperk ranperm

      # Date/time --  External Routine -- Macro
      is8601_convert  module              execute symput symputx

      # Mathematical
      logistic softmax stdize tanh

      # Random Number
      ranbin rancau ranexp rangam rannor ranpoi rantbl rantri ranuni streaminit

      # Sort --    Special --                  Variable Control -- Variable Info
      sortc sortn  poke pokelong sleep system  label set vname     vnext
    DATA

    lines = data.lines.reject { |l| l.strip!; l.empty? || l[0] == '#' }
    words = lines.map(&:strip).join(' ').split(/\s+/).sort.uniq

    optimized_re(words)
  end

  # proc sql keywords

  def sql_keywords_re

    data = <<-DATA
      alter table add drop constraint primary foreign key modify
      connect to as
      create unique index on
      create table like as

        character|varchar integer|smallint decimal|numeric|float real|double precision  date
        check distinct not null primary key references on delete update unique
        cascade restrict set null constraint message= msgtype=
        check distinct foreign key not null primary key unique

      create view as order by using

      delete from as where

      describe table view constraints
      disconnect from
      drop table view index from
      execute by
      insert into set values
      reset
      select distinct into separated by notrim from where group by having order by

        connection to
        not between contains exists in is like and or

      update set where

      validate

        btrim from calculated case when then else end
        coalesce
        informat= format= label= length= transcode=yes|no
        not contains exists in is null missing
        as inner join left right full join on
        cross union join
        natural inner full outer left outer right join
        not like escape

        lower()
        upper()
        substring( from for )

        intersect outer union except corresponding all
        distinct all
        avg|mean count|freq|n css cv max min nmiss prt range std stderr sum sumwgt t uss var

      select distinct from where group by having
    DATA

    lines = data.lines.reject { |l| l.strip.empty? }
    lines = lines.map { |l| l.strip.gsub(/[^ a-z]/, ' ') }
    words = lines.join(' ').split(/\s+/).sort.uniq

    optimized_re(words)
  end

end

# --------------------------------------------------------------------------------------------------
#   grammar
# --------------------------------------------------------------------------------------------------

language 'SAS' => 'source.sas' do

  # Statement start is matched as:
  #   (beginning of line | semicolon) spaces*
  # Not perfect, but should work most of the time.

  file_types %w(sas)
  folding_start_marker %r/^\s*(?i:proc|data|%macro).*;$/
  folding_stop_marker %r/(?i:run|quit|%mend);/
  uuid "3057B953-CCE9-4A59-8D7C-7B6C0979BBEB"  # TextMate only

  include "#comment"
  include "#strings"
  include "#macro_open_code"
  include "#macro_keyword_invalid"
  include "#macro_def"
  include "#data_proc"
  include "#macro_call_open"
  include "#macro_variable"

  # --- reused patterns, shortcuts ---

  include SASKeywords

  def sas_name
    '[_a-z][_a-z0-9]*'
  end

  def to_semicolon
    to %r/;/, 0 => 'punctuation.general.sas'
  end

  # --- repository ---

  fragment :comment do
    include "#comment_block"
    include "#comment_star"
  end

  # /* ... */
  fragment :comment_block do
    rule 'comment.block.sas' do
      from %r'/\*'
      to %r'\*/'
      both 0 => 'punctuation.definition.comment.sas'
    end
  end

  # %* ...; or * ...;
  fragment :comment_star do
    rule do
      # NOTE: cannot capture '*' and ';' inside 'comment.star.sas'
      # (should be punctuation.definition.comment.sas)
      content_scope 'comment.star.sas'
      from %r/(?xi) (?<=^|;) \s* (?:(#{sas_name})\s*:)? \s* (%?\*)/,
        1 => 'entity.name.section.label.sas',
        2 => 'comment.star.sas'   # the leading '*'
      to %r/;/,
        0 => 'comment.star.sas'   # the semi-colon
    end
  end

  # function call inside a data step: name(...)

  fragment :data_function do
    rule do
      from %r/(?ix) \b (?<!%) (#{data_functions_re}) \s* \(/,
        1 => 'support.function.data.sas'
      to %r/\)/
      include "#comment_block"
      include "#strings"
      include "#macro_variable"
      include "#macro_call"
      include "#data_function"
      include "#parens"
    end
  end

  # open code: data or proc step

  fragment :data_proc do

    # general statements without argument

    rule 'meta.general.d-no-arg.sas' do
      from %r/(?ix) (?<=^|;) \s* (page|run|endsas|quit)\b/, 1 => 'keyword.control.general.sas'
      to_semicolon
      include "#comment_block"
      rule 'invalid.illegal.argument.sas' do match %r/[^;\s]+/ end
    end

    # general statements with argument(s)

    rule 'meta.general.d-with-arg.sas' do
      from %r/(?ix) (?<=^|;) \s* (
            options|ods|
            catname|filename|libname|sasfile|
            x|skip|footnote([1-9]|10)?|title([1-9]|10)?|
            checkpoint|dm|lock|sysecho|systask|waitfor
          )\b/,
        1 => 'keyword.control.general.sas'
      to_semicolon
      include "#comment_block"
      include "#strings"
      include "#macro_call"
    end

    # data statement

    rule 'meta.general.d-data.sas' do
      from %r/(?ix) (?<=^|;) \s* (data)\b(?!\s*=)/, 1 => 'keyword.control.general.sas'
      to_semicolon
      include "#comment_block"
      include '#macro_call'
      include "#dataset_list"
    end

    # executable: set, merge, etc.

    rule 'meta.statement.data.d-exec-set-merge.sas' do
      from %r/(?ix) (?: (?<=^|;) \s* (?:(#{sas_name})\s*:)? | \b(then|else)\b ) \s* (set|merge|update|modify)\b/,
        1 => 'entity.name.section.label.sas',
        2 => 'keyword.control.sas',
        3 => 'keyword.control.data.sas'
      to_semicolon
      include "#comment_block"
      include '#macro_call'
      include "#dataset_list"
      # do not match statement options as dataset names:
      #   merge:  end
      #   set:    end key indsname nobs open point
      #   modify: end nobs updatemode key open point
      #   update: end updatemode
      rule do
        match %r/(?ix) (?: (end|key|indsname|nobs|open|point|updatemode)|([a-z]+) ) \s* = ([^=;]+)/,
          1 => 'support.type.set-merge-option.sas',
          2 => 'invalid.illegal.set-merge-option.sas'
      end
    end

    # where statement (nested parentheses)

    rule 'meta.statement.d-where.sas' do
      from %r/(?ix) (?<=^|;) \s* (where)\b(?!\s*=)/,
        1 => 'keyword.control.sas'
      to_semicolon
      include "#comment_block"
      include "#logical_op"
      include "#comment_block"
      include "#strings"
      include "#macro_variable"
      include "#macro_call"
      include "#parens"
    end

    # declarative data step statements (with arguments)

    rule 'meta.statement.data.d-decl-with-arg.sas' do
      from %r/(?ix) (?<=^|;) \s* (
            by|file|infile|
            array|drop|format|informat|keep|label|length|missing|rename|retain|
            window|display
          )\b/,
        1 => 'keyword.control.sas'
      to_semicolon
      include "#comment_block"
      include "#strings"
      include "#macro_variable"
      include "#macro_call"
    end

    # attrib

    rule 'meta.statement.data.d-attrib.sas' do
      from %r/(?ix) (?<=^|;) \s* (attrib)\b/,
        1 => 'keyword.control.sas'
      to_semicolon
      include "#comment_block"
      include "#strings"
      include "#macro_variable"
      include "#macro_call"
      rule 'meta.statement.attrib.sas' do
        match %r/(?ix) \b(length|label|format) \s* =/,
          1 => 'support.type.attrib-option.sas'
      end
    end

    # executable data step statements, without argument

    rule 'meta.statement.data.d-exec-no-arg.sas' do
      match %r/(?ix) (?: (?<=^|;) \s* (?:(#{sas_name})\s*:)? | \b(then|else)\b ) \s*
            (delete|describe|execute|list|lostcard|stop|continue|end|leave|return) \s*;/,
        1 => 'entity.name.section.label.sas',
        2 => 'keyword.control.sas',
        3 => 'keyword.control.data.noarg.sas'
    end

    # executable data step statements with arguments

    rule 'meta.statement.data.d-exec-with-arg.sas' do
      from %r/(?ix) (?: (?<=^|;) \s* (?:(#{sas_name})\s*:)? | \b(then|else)\b ) \s* (
            abort|declare|error|output|putlog|redirect|remove|replace|
            link|input|put|go\s*to
          )\b/,
        1 => 'entity.name.section.label.sas',
        2 => 'keyword.control.sas',
        3 => 'keyword.control.sas'
      to_semicolon
      include "#comment_block"
      include "#strings"
      include "#macro_variable"
      include "#macro_call"
    end

    # do while|until (nested parentheses)

    rule 'meta.statement.data.d-do-while.sas' do
      from %r/(?ix) (?: (?<=^|;) \s* (?:(#{sas_name})\s*:)? | \b(then|else)\b ) \s* (do)\s+(while|until) \s* \(/,
        1 => 'entity.name.section.label.sas',
        2 => 'keyword.control.sas',
        3 => 'keyword.control.sas',
        4 => 'keyword.control.sas'
      to %r/\)\s*;/
      include "#comment_block"
      include "#strings"
      include "#macro_variable"
      include "#macro_call"
    end

    # do, iterative

    rule 'meta.statement.data.d-do-iter.sas' do
      from %r/(?ix) (?: (?<=^|;) \s* (?:(#{sas_name})\s*:)? | \b(then|else)\b ) \s* (do) \s+ (\S+) \s*=/,
        1 => 'entity.name.section.label.sas',
        2 => 'keyword.control.sas',
        3 => 'keyword.control.sas'
      to_semicolon
      include "#comment_block"
      include "#strings"
      include "#macro_variable"
      include "#macro_call"
      rule 'keyword.control.data.sas' do
        match %r/(?i)\b(to|by)\b/
      end
    end

    # select (nested parentheses)

    rule 'meta.statement.data.d-select-with-arg.sas' do
      from %r/(?ix) (?: (?<=^|;) \s* (?:(#{sas_name})\s*:)? | \b(then|else)\b ) \s* (select) \s* \(/,
        1 => 'entity.name.section.label.sas',
        2 => 'keyword.control.sas',
        3 => 'keyword.control.sas'
      to %r/\)\s*;/
      include "#comment_block"
      include "#strings"
      include "#macro_variable"
      include "#macro_call"
    end

    # do or select without argument

    rule 'meta.statement.data.d-select-no-arg.sas' do
      match %r/(?ix) (?: (?<=^|;) \s* (?:(#{sas_name})\s*:)? | \b(then|else)\b ) \s* (do|select)\b;/,
        1 => 'entity.name.section.label.sas',
        2 => 'keyword.control.sas',
        3 => 'keyword.control.sas'
    end

    # when (...)

    rule 'meta.statement.data.d-when.sas' do
      from %r/(?ix) (?<=^|;) \s* (when) \s* \(/,
        1 => 'keyword.control.sas'
      to %r/\)/
      include "#comment_block"
      include "#strings"
      include "#macro_variable"
      include "#macro_call"
    end

    # otherwise

    rule 'meta.statement.data.d-otherwise.sas' do
      from %r/(?ix) (?<=^|;) \s* (otherwise) \s*/, 1 => 'keyword.control.sas'
      to %r/;/
      include "#comment_block"
    end

    # call routine

    rule 'meta.statement.data.d-call-routine.sas' do
      from %r/(?ix) (?: (?<=^|;) \s* (?:(#{sas_name})\s*:)? | \b(then|else)\b ) \s*
                    (call) \s+ (#{call_routines_re}) \s* \(/,
        1 => 'entity.name.section.label.sas',
        2 => 'keyword.control.sas',
        3 => 'keyword.control.sas',
        4 => 'support.function.call-routine.sas'
      to %r/\)\s*;/
      include "#comment_block"
      include "#strings"
      include "#macro_variable"
      include "#macro_call"
    end

    # assignment

    rule 'meta.statement.data.d-ass.sas' do
      match %r/(?ix) (?: (?<=^|;) \s* (?:(#{sas_name})\s*:)? | \b(then|else)\b ) \s*
            (#{sas_name}) (\s*\(.+?\)\s*)? \s*=/,
        1 => 'entity.name.section.label.sas',
        2 => 'keyword.control.sas'
    end

    # if

    rule 'meta.statement.data.d-if.sas' do
      match %r/(?ix) (?: (?<=^|;) \s* (?:(#{sas_name})\s*:)? | \b(then|else)\b ) \s* (if)\b/,
        1 => 'entity.name.section.label.sas',
        2 => 'keyword.control.sas',
        3 => 'keyword.control.sas'
    end

    include "#logical_op"

    # first. & last.

    rule 'support.type.first-last.sas' do
      match %r/(?ix) \b(first|last)\./
    end

    # a label alone

    rule 'meta.statement.data.d-label-alone.sas' do
      match %r/(?ix) (?<=^|;) \s* (#{sas_name})\s*:/,
        1 => 'entity.name.section.label.sas'
    end

    # an "else" not followed by something on the same line

    rule 'meta.statement.data.d-else-alone.sas' do
      match %r/(?ix) (?<=^|;) \s* (else) \s*$/,
        1 => 'keyword.control.sas'
    end

    # a "then" not followed by something on the same line

    rule 'meta.statement.data.d-then-alone.sas' do
      match %r/(?ix) \b(then)\s*$/,
        1 => 'keyword.control.sas'
    end

    include "#data_function"

    # cards statement

    rule 'meta.statement.data.cards.sas' do
      content_scope "text.plain"
      from %r/(?ix) (?<=^|;) \s* (cards|datalines) \s* ; \s* (\S.*)?/,
        1 => 'keyword.control.sas',
        2 => 'invalid.illegal.trailing-text.sas'
      to %r/^\s*(\S.*?)?\s*;\s*(\S.*)?/,
        1 => 'invalid.illegal.leading-text.sas',
        2 => 'invalid.illegal.trailing-text.sas'
    end

    # cards4 statement

    rule 'meta.statement.data.cards4.sas' do
      content_scope "text.plain"
      from %r/(?ix) (?<=^|;) \s* (cards4|datalines4) \s* ; \s* (\S.*)?/,
        1 => 'keyword.control.sas',
        2 => 'invalid.illegal.trailing-text.sas'
      to %r/^(.+?)?;;;;\s*(\S.*)?/,
        1 => 'invalid.illegal.leading-text.sas',
        2 => 'invalid.illegal.trailing-text.sas'
    end

    # proc sql

    rule 'meta.statement.proc.sql.sas' do
      from %r/(?ix) (?<=^|;) \s* (proc)\s+(sql).*?;/,
        1 => 'keyword.control.general.sas',
        2 => 'entity.name.function.proc.sas'
      to %r/(?ix) (?<=^|;) \s* (quit)\s*;/,
        1 => 'keyword.control.general.sas'
      include "#comment"
      include "#strings"
      include "#macro_indef"  # FIXME this is here because it is valid if we are inside a macro definition...
      include "#macro_variable"
      include "#macro_call"
      include "#parens"
      rule 'keyword.control.sql.sas' do
        match %r/(?ix)\b(#{sql_keywords_re})\b/
      end
      rule 'invalid.illegal.run.sas' do
        match %r/(?i)\b(run)\s*;/
      end
    end

    # proc something

    rule 'meta.statement.proc.other.sas' do
      from %r/(?ix) (?<=^|;) \s* (proc) \s+ (#{sas_name})\b/,
        1 => 'keyword.control.general.sas',
        2 => 'entity.name.function.proc.sas'
      to_semicolon
      include "#comment_block"
      include "#strings"
      include "#macro_variable"
      include "#macro_call"
      include "#parens"
    end
  end

  # list of datasets & their options (after data, set, merge, etc.)

  fragment :dataset_list do

    # [library].dataset (option ...)

    rule 'meta.dataset.with-options.sas' do

      from %r/(?ix) \b ( (#{sas_name} \.)? (#{sas_name}) ) \s* \(/,
        2 => 'entity.name.function.library.sas',
        3 => 'entity.name.function.dataset.sas'
      to %r/\)/

      include "#comment_block"
      include "#strings"
      include "#macro_variable"
      include "#macro_call"

      # rename: no nested parentheses

      rule 'meta.dataset-option.paren.rename.sas' do
        from %r/(?ix)(rename)\s*=\s*\(/, 1 => 'support.type.dataset-option.sas'
        to %r/\)/
      end

      # index/where: nested parentheses

      rule 'meta.dataset-option.paren.index-where.sas' do
        from %r/(?ix)(index|where)\s*=\s*\(/, 1 => 'support.type.dataset-option.sas'
        to %r/\)/
        include "#parens"
      end

      # options without parentheses

      rule 'meta.dataset-option.noparen.sas' do
        match %r/(?ix)(
                alter|bufno|bufsize|cntllev|compress|dldmgaction|encrypt|genmax|gennum|label|
                obsbuf|outrep|pw|pwreq|read|repempty|replace|reuse|sortedby|spill|tobsno|type|
                write|fileclose|firstobs|in|obs|pointobs|whereup|idxname|idxwhere|drop|keep
              )\s*(=)\s*(\(.*)?/,
          1 => 'support.type.dataset-option.sas',
          3 => 'invalid.illegal.dataset-option.paren.sas'
      end
    end

    # [library].dataset

    rule 'meta.dataset.no-options.sas' do
      match %r/(?ix) \b ( (#{sas_name} \.)? (#{sas_name}\b) \s* (?!=))/,
        2 => 'entity.name.function.library.sas',
        3 => 'entity.name.function.dataset.sas'
    end

  end

  # logical operators

  fragment :logical_op do
    rule 'keyword.operator.word.logical.sas' do
      # logical operators
      match %r/(?ix) \b(not|and|or|eq|ne|lt|le|gt|ge|in)\b/
    end
  end

  # --- rules that need to vary their includes/inner rules only

  def macro_call_nrstr(&block)
    # a call to %nrstr(...): turns off macro recognition
    rule 'meta.macro.call.sas' do
      content_scope "meta.quoted.nrstr.sas"
      from %r/(?i)(%nrstr)\s*\(/, 1 => 'support.function.macro.nrstr.sas'
      to %r/\)/
      to_last true
      block.call
    end
  end

  # inside %[nr]str: %" %' %( %) %%
  def percent_escapes
    rule 'constant.character.escape.macro.sas' do match %r/%["'\(\)%]/ end
  end

  # inside %nrstr: % and & are ordinary characters
  def macro_escapes
    rule 'constant.character.escape.macro.sas' do
      match %r/[%&]/  # TODO: only if would be interpreted: %[a-z_] or &[a-z_] or &&
    end
  end

  def macro_call_str(&block)
    # a call to %str(...): escapes via %" %' %( %) %%
    rule 'meta.macro.call.sas' do
      content_scope "meta.quoted.str.sas"
      from %r/(?i)(%str)\s*\(/, 1 => 'support.function.macro.str.sas'
      to %r/\)/
      to_last true
      block.call
    end
  end

  def macro_call_other(&block)

    # TODO: distinguish these ones from user ones
    sas_macro_functions = %w(
        eval index length superq symexist symglobl symlocal sysevalf sysget sysprod
        unquote bquote nrbquote quote nrquote scan qscan substr qsubstr sysfunc qsysfunc
        upcase qupcase
      ).join('|')

    # a macro/function call with arguments
    rule 'meta.macro.call.sas' do
      from %r/(?ix) (?: (#{sas_macro_functions})|(%#{sas_name}) ) \s* \(/,
        1 => 'support.function.macro.sas',
        2 => 'support.function.macro.sas'
      to %r/\)/
      to_last true
      block.call
    end

    # a macro call without arguments
    rule 'support.function.macro.sas' do match %r/(?i)%#{sas_name}\b/ end

  end

  # a macro or macro function call in open code, that may contain statements
  # => includes #data_proc

  fragment :macro_call_open do

    macro_call_nrstr do
      include "#comment_block"
      percent_escapes
      macro_escapes
      include "#comment_star"
      # include "#data_proc_no_macro"   want to define this?
      include "#strings_no_macro"
      include "#parens_no_macro"
    end

    macro_call_str do
      include "#comment_block"
      percent_escapes
      include "#comment_star"
      include "#data_proc"
      include "#macro_variable"
      include "#macro_call_open"
      include "#strings"
      include "#parens"
    end

    macro_call_other do
      include "#comment"
      include "#data_proc"
      include "#macro_variable"
      include "#macro_call_open"
      include "#strings"
      include "#parens"
    end

  end

  # a macro or macro function call inside a statement
  # => does not include #data_proc nor #comment_star

  fragment :macro_call do

    macro_call_nrstr do
      include "#comment_block"
      percent_escapes
      macro_escapes
      include "#strings_no_macro"
      include "#parens_no_macro"
    end

    macro_call_str do
      include "#comment_block"
      percent_escapes
      include "#macro_variable"
      include "#macro_call"
      include "#strings"
      include "#parens"
    end

    macro_call_other do
      include "#comment_block"
      include "#macro_variable"
      include "#macro_call"
      include "#strings"
      include "#parens"
    end

  end

  # a macro call inside a double-quoted string

  fragment :macro_call_instring do

    macro_call_str do
      include "#comment_block"
      percent_escapes
      include "#macro_variable"
      include "#macro_call_instring"
      include "#parens_instring"
    end

    macro_call_other do
      include "#comment_block"
      include "#macro_variable"
      include "#macro_call_instring"
      include "#parens_instring"
    end

  end

  # macro definition

  fragment :macro_def do
    rule 'meta.macro.definition.sas' do
      from %r/(?i)(%macro)\s+(#{sas_name})\b/,
        1 => 'keyword.control.macro.anywhere.sas',
        2 => 'entity.name.function.macro.sas'
      to %r/(?i)(%mend)(?:\s+(?:(§2)|(#{sas_name})))?\b/,
        1 => 'keyword.control.macro.anywhere.sas',
        2 => 'entity.name.function.macro.sas',
        3 => 'invalid.illegal.name-mismatch.sas'
      include "#comment"
      include "#strings"
      include "#macro_open_code"
      include "#macro_indef"
      include "#macro_call_open"
      include "#macro_variable"
      include "#data_proc"
    end
  end

  # macro statements valid in open code

  fragment :macro_open_code do
    rule 'keyword.control.macro.sas' do
      match %r/(?ix) % (
            inc|include|
            let|global|put|
            symdel|syscall|sysexec|copy|
            display|input|list|run|window|syslput|sysrput
          )\b/
    end
  end

  # macro keywords inside macro definitions (invalid in open code)

  macro_inner_keyword = /(?ix)%(goto|if|then|else|do|to|by|until|while|end|return|abort|local)\b/

  fragment :macro_indef do
    rule 'keyword.control.macro.inside.sas' do match macro_inner_keyword end
    rule 'entity.name.section.label.sas' do match %r/(?ix)%#{sas_name}(?=:)/ end
  end

  fragment :macro_keyword_invalid do
    rule 'invalid.illegal.control.macro.sas' do match macro_inner_keyword end
  end

  # reference to a macro-variable

  fragment :macro_variable do
    rule 'variable.other.macro.sas' do
      match %r/(?i)&#{sas_name}\.?/
    end
  end

  # nested parentheses

  fragment :parens do
    rule do
      from %r/\(/
      to %r/\)/
      include "#comment_block"
      include "#strings"
      include "#macro_variable"
      include "#macro_call"
      include "#parens"
    end
  end

  # nested parentheses in a (double-quoted) string

  fragment :parens_instring do
    rule do
      from %r/\(/
      to %r/\)/
      include "#macro_variable"
      include "#macro_call_instring"
      include "#parens_instring"
    end
  end

  # nested parentheses without macro recognition, inside %nrstr(...)

  fragment :parens_no_macro do
    rule do
      from %r/\(/
      to %r/\)/
      include "#comment_block"
      include "#strings_no_macro"
      include "#parens_no_macro"
    end
  end

  # strings (single or double-quoted)

  fragment :strings do
    include "#strings_single"
    rule 'string.quoted.double.sas' do
      from %r/(")/,     1 => 'punctuation.definition.string.begin.sas'
      to %r/("(?!"))/,  1 => 'punctuation.definition.string.end.sas'
      to_last true
      rule 'constant.character.escape.quote.sas' do match %r/""/ end
      include "#macro_variable"
      include "#macro_call_instring"
    end
  end

  # single-quoted strings

  fragment :strings_single do
    rule 'string.quoted.single.sas' do
      from %r/(')/,     1 => 'punctuation.definition.string.begin.sas'
      to %r/('(?!'))/,  1 => 'punctuation.definition.string.end.sas'
      to_last true
      rule 'constant.character.escape.apostrophe.sas' do match %r/''/ end
    end
  end

  # strings without macro recognition, inside %nrstr(...)

  fragment :strings_no_macro do
    include "#strings_single"
    rule 'string.quoted.double.sas' do
      from %r/"/, 0 => 'punctuation.definition.string.begin.sas'
      to %r/"(?!")/, 0 => 'punctuation.definition.string.end.sas'
      to_last true
      rule 'constant.character.escape.quote.sas' do match %r/""/ end
    end
  end

end
