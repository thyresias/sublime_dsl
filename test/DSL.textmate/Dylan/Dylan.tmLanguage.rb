# encoding: utf-8

language 'Dylan' => 'source.dylan' do
  file_types %w(dylan)
  key_equivalent "^~D"  # TextMate only
  uuid "475B8369-3520-4B4C-BBA1-1D1229C6F397"  # TextMate only

  rule 'comment.block.dylan' do
    from %r'(?<=^|\s|\()/\*'
    to %r'\*/'
    include "#comment-block"
  end
  rule do
    from %r'(^[ \t]+)?(?=//)',
      1 => 'punctuation.whitespace.comment.leading.dylan'
    to %r/(?!\G)/
    rule 'comment.line.double-slash.dylan' do
      from %r'//',
        0 => 'punctuation.definition.comment.dylan'
      to %r/\n/
    end
  end
  rule 'keyword.control.preprocessor.dylan' do
    content_scope "meta.preprocessor.dylan"
    from %r/^(module|synopsis|author|copyright|version|files|executable|library):/
    to %r/^\s*$/
    rule 'keyword.control.preprocessor.dylan' do
      match %r/^(module|synopsis|author|copyright|version|files|executable|library):/
    end
  end
  rule 'meta.function.dylan' do
    match %r'^(define)\s+((?:(?:sealed|open|inline[-a-z]*)\s+)+)?(?:(domain)|(method|function|generic)\s+)([\\_A-Za-z0-9/!?*%$\-\<\>=]*)',
      1 => 'keyword.other.dylan',
      2 => 'storage.modifier.dylan',
      3 => 'storage.modifier.dylan',
      4 => 'storage.type.function.dylan',
      5 => 'entity.name.function.dylan'
  end
  rule 'meta.class.dylan' do
    match %r'^(define)\s+((?:(?:sealed|open|abstract|concrete|primary|free)\s+)+)?(class)\s+([_A-Za-z0-9/!?*%$\-\<\>]*)',
      1 => 'keyword.other.dylan',
      2 => 'storage.modifier.dylan',
      3 => 'storage.type.class.dylan',
      4 => 'entity.name.type.dylan'
  end
  rule 'meta.namespace.dylan' do
    match %r'^(define)\s+((library|module)\s+[_A-Za-z0-9/!?*%$\-\<\>]+)',
      1 => 'keyword.other.dylan',
      2 => 'entity.name.other.dylan',
      3 => 'storage.type.namespace.dylan'
  end
  rule 'meta.variable.dylan' do
    match %r'^(define)\s+(constant|variable)\s+([_A-Za-z0-9/!?*%$\-\<\>]+)',
      1 => 'keyword.other.dylan',
      2 => 'storage.type.dylan',
      3 => 'entity.name.other.dylan'
  end
  rule 'meta.macro.dylan' do
    match %r'^(define)\s+(macro)\s+([_A-Za-z0-9/!?*%$\-\<\>]+)',
      1 => 'keyword.other.dylan',
      2 => 'storage.type.dylan',
      3 => 'entity.name.other.dylan'
  end
  rule 'meta.definition.dylan' do
    match %r'^(define)\s+([_A-Za-z0-9/!?*%$\-\<\>\s]+)',
      1 => 'keyword.other.dylan',
      2 => 'entity.name.other.dylan'
  end
  rule 'constant.language.dylan' do
    match %r/(#t|#f|#next|#rest|#key|#all-keys|#include)/
  end
  rule 'constant.numeric.dylan' do
    match %r/\b((#x[0-9a-fA-F]*)|(([0-9]+\.?[0-9]*)|(\.[0-9]+))((e|E)(\+|-)?[0-9]+)?)\b/
  end
  rule 'constant.character.dylan' do
    match %r/'(\\<[0-9a-fA-F]*>|\\.|.)'/
  end
  rule 'string.quoted.double.dylan' do
    from %r/"/
    to %r/"/
    include "#escape"
  end
  rule 'string.quoted.other.dylan' do
    from %r/(#)"/,
      1 => 'keyword.operator.dylan'
    to %r/"/
    include "#escape"
  end
  rule 'keyword.control.dylan' do
    match %r/(?<=^|[,.()\s])(above|afterwards|begin|below|block|by|case|cleanup|else|elseif|exception|finally|for|from|keyed-by|if|in|otherwise|select|then|to|unless|until:?|using|when|while:?)(?=$|[;,()\s])/
  end
  rule 'keyword.control.dylan' do
    match %r/(?<=^|[,;\s])end(?=$|[;,)\s])/
  end
  rule 'keyword.other.dylan' do
    match %r/(?<=^|[,.(\s])(class|constant|create|default:|define|each-subclass|exclude:|export|export:|function|generic|import:|inherited|init-function:|init-keyword:|init-value:|instance|keyword|let(\s+handler)?|library|local|macro|method|module|prefix:|rename:|required|required-init-keyword:|sealed|setter:|slot|type:|use|variable|virtual)(?=$|[;,.()\s])/
  end
  rule 'support.class.dylan' do
    match %r/<(abort|array|boolean|byte-string|character|class|collection|complex|condition|deque|double-float|empty-list|error|explicit-key-collection|extended-float|float|function|generic-function|integer|list|method|mutable-collection|mutable-explicit-key-collection|mutable-sequence|number|object-table|object|pair|range|rational|real|restart|sealed-object-error|sequence|serious-condition|simple-error|simple-object-vector|simple-restart|simple-vector|simple-warning|single-float|singleton|stretchy-collection|stretchy-vector|string|symbol|table|type-error|type|unicode-string|vector|warning)>/
  end
  rule 'support.function.dylan' do
    match %r'(?<=^|[~,.(\[\s])(abort|abs|add|add!|add-method|add-new|add-new!|all-superclasses|always|any\?|applicable-method\?|apply|aref|aref-setter|as|as-lowercase|as-lowercase!|as-uppercase|as-uppercase!|ash|backward-iteration-protocol|break|ceiling|ceiling/|cerror|check-type|choose|choose-by|complement|compose|concatenate|concatenate-as|condition-format-arguments|condition-format-string|conjoin|copy-sequence|curry|default-handler|dimension|dimensions|direct-subclasses|direct-superclasses|disjoin|do|do-handlers|element|element-setter|empty\?|error|even\?|every\?|false-or|fill!|find-key|find-method|first|first-setter|floor|floor/|forward-iteration-protocol|function-arguments|function-return-values|function-specializers|gcd|generic-function-mandatory-keywords|generic-function-methods|head|head-setter|identity|initialize|instance\?|integral\?|intersection|key-sequence|key-test|last|last-setter|lcm|limited|list|logand|logbit\?|logior|lognot|logxor|make|map|map-as|map-into|max|member\?|merge-hash-codes|min|modulo|negative|negative\?|next-method|object-class|object-hash|odd\?|one-of|pair|pop|pop-last|positive\?|push|push-last|range|rank|rcurry|reduce|reduce1|remainder|remove|remove!|remove-duplicates|remove-duplicates!|remove-key!|remove-method|replace-elements!|replace-subsequence!|restart-query|return-allowed\?|return-description|return-query|reverse|reverse!|round|round/|row-major-index|second|second-setter|shallow-copy|signal|singleton|size|size-setter|slot-initialized\?|sort|sort!|sorted-applicable-methods|subsequence-position|subtype\?|table-protocol|tail|tail-setter|third|third-setter|truncate|truncate/|type-error-expected-type|type-error-value|type-for-copy|type-union|union|values|vector|zero\?)(?=$|[;,.()\s\]])'
  end

  fragment :"comment-block" do
    rule do
      from %r'(?<=^|\s|\()/\*'
      to %r'\*/'
    end
  end

  fragment :escape do
    rule 'constant.character.escape.dylan' do
      match %r/\\(<[0-9a-fA-F]*>|.)/
    end
  end
end
