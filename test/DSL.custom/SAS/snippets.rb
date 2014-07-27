# encoding: utf-8

snippets do

  default_scope 'source.sas'

  tab '(', '(…);', "($0);", scope: 'meta.general.d-data.sas'
  tab 'ind', 'index=(…)', "index=(_PKey=(${1})/unique)$0", scope: 'meta.dataset.with-options.sas'
  tab 'where', 'where=(…)', "where=($0)", scope: 'meta.dataset.with-options.sas'

  tab 'data', 'data …; run;', <<-SAS
data ${1:toto};
  set ${2:toto};
  $0
run;
SAS

  tab 'psqt', 'proc sql; select … from dict.tables; quit;', <<-SAS
proc sql noprint;
  %let ${1:dslist} = ;
  select memname into :$1 separated by " "
  from dictionary.tables
  where libname = "$0";
quit;
SAS

  tab 'pf', 'proc freq …; run;', <<-SAS
proc freq data=${1:toto};
  tables $0 / list missing nocum nopercent;
run;
SAS

end