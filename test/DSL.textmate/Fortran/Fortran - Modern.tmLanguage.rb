# encoding: utf-8

language 'Fortran - Modern' => 'source.fortran.modern' do
  # Specificities of Fortran >= 90
  file_types %w(f90 F90 f95 F95 f03 F03 f08 F08)
  first_line_match %r/(?i)-[*]- mode: f90 -[*]-/
  key_equivalent "^~F"  # TextMate only
  uuid "016CA1B6-8351-4B17-9215-29C275D5D973"  # TextMate only

  include "source.fortran"
  rule 'meta.function.interface.operator.fortran.modern' do
    # Interface declaration of operator/assignments
    from %r'(?x:          # extended mode
          ^
          \s*          # start of line and possibly some space
          (?i:(interface))    # 1: word interface
          \s+          # some space
          (?i:(operator|assignment))    # 2: the words operator or assignment
          \(          # opening parenthesis
          ((\.[a-zA-Z0-9_]+\.)|[\+\-\=\/\*]+)  # 3: an operator
          
          \)          # closing parenthesis
          )',
      1 => 'storage.type.function.fortran',
      2 => 'storage.type.fortran',
      3 => 'keyword.operator.fortran'
    to %r/(?x:
          ((?i:end))      # 1: the word end
          \s*          # possibly some space
          ((?i:interface)?)     # 2: possibly interface
          )/,
      1 => 'keyword.other.fortran',
      2 => 'storage.type.function.fortran'
    include "$self"
  end
  rule 'meta.function.interface.fortran.modern' do
    # Interface declaration of function/subroutines
    from %r/(?x:          # extended mode
          ^
          \s*          # start of line and possibly some space
          (?i:(interface))    # 1: word interface
          \s+          # some space
          ([A-Za-z_][A-Za-z0-9_]*)  # 1: name
          )/,
      1 => 'storage.type.function.fortran',
      2 => 'entity.name.function.fortran'
    to %r/(?x:        # extended mode
          ((?i:end))    # 1: the word end
          \s*        # possibly some space
          ((?i:interface)?)   # 2: possibly interface
          )/,
      1 => 'keyword.other.fortran',
      2 => 'storage.type.function.fortran'
    include "$self"
  end
  rule 'meta.type-definition.fortran.modern' do
    # Type definition
    from %r/(?x:      # extended mode
          ^\s*      # begining of line and some space
          (?i:(type))  # 1: word type
          \s+      # some space
          ([a-zA-Z_][a-zA-Z0-9_]*)  # 2: type name
          )/,
      1 => 'storage.type.fortran.modern',
      2 => 'entity.name.type.fortran.modern'
    to %r/(?x:
          ((?i:end))      # 1: the word end
          \s*          # possibly some space
          (?i:(type))?       # 2: possibly the word type
          (\s+[A-Za-z_][A-Za-z0-9_]*)?  # 3: possibly the name
          )/,
      1 => 'keyword.other.fortran',
      2 => 'storage.type.fortran.modern',
      3 => 'entity.name.type.end.fortran.modern'
    include "$self"
  end
  rule do
    from %r/(^[ \t]+)?(?=!-)/,
      1 => 'punctuation.whitespace.comment.leading.ruby'
    to %r/(?!\G)/
    rule 'comment.line.exclamation.mark.fortran.modern' do
      from %r/!-/,
        0 => 'punctuation.definition.comment.fortran'
      to %r/\n/
      rule do
        match %r/\\\s*\n/
      end
    end
  end
  rule do
    from %r/(^[ \t]+)?(?=!)/,
      1 => 'punctuation.whitespace.comment.leading.ruby'
    to %r/(?!\G)/
    rule 'comment.line.exclamation.fortran.modern' do
      from %r/!/,
        0 => 'punctuation.definition.comment.fortran'
      to %r/\n/
      rule do
        match %r/\\\s*\n/
      end
    end
  end
  rule 'keyword.control.fortran.modern' do
    # statements controling the flow of the program
    match %r/\b(?i:(select\s+case|case(\s+default)?|end\s+select|use|(end\s+)?forall))\b/
  end
  rule 'keyword.control.io.fortran.modern' do
    # input/output instrinsics
    match %r/\b(?i:(access|action|advance|append|apostrophe|asis|blank|delete|delim|direct|end|eor|err|exist|file|fmt|form|formatted|iolength|iostat|keep|name|named|nextrec|new|nml|no|null|number|old|opened|pad|position|quote|read|readwrite|rec|recl|replace|scratch|sequential|size|status|undefined|unformatted|unit|unknown|write|yes|zero|namelist)(?=\())/
  end
  rule 'keyword.operator.logical.fortran.modern' do
    # logical operators in symbolic format
    match %r'\b(\=\=|\/\=|\>\=|\>|\<|\<\=)\b'
  end
  rule 'keyword.operator.fortran.modern' do
    # operators
    match %r/(\%|\=\>)/
  end
  rule 'keyword.other.instrinsic.numeric.fortran.modern' do
    # numeric instrinsics
    match %r/\b(?i:(ceiling|floor|modulo)(?=\())/
  end
  rule 'keyword.other.instrinsic.array.fortran.modern' do
    # matrix/vector/array instrinsics
    match %r/\b(?i:(allocate|allocated|deallocate)(?=\())/
  end
  rule 'keyword.other.instrinsic.pointer.fortran.modern' do
    # pointer instrinsics
    match %r/\b(?i:(associated)(?=\())/
  end
  rule 'keyword.other.programming-units.fortran.modern' do
    # programming units
    match %r/\b(?i:((end\s*)?(interface|procedure|module)))\b/
  end
  rule 'meta.specification.fortran.modern' do
    # Line of type specification
    from %r/\b(?i:(type(?=\s*\()))\b(?=.*::)/,
      1 => 'storage.type.fortran.modern'
    to %r/(?=!)|$/
    include "$base"
  end
  rule 'storage.type.fortran.modern' do
    match %r/\b(?i:(type(?=\s*\()))\b/
  end
  rule 'storage.modifier.fortran.modern' do
    match %r/\b(?i:(optional|recursive|pointer|allocatable|target|private|public))\b/
  end
end
