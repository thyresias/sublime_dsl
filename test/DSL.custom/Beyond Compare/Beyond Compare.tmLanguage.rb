# encoding: utf-8

language 'Beyond Compare' => 'source.beyond-compare' do

  file_types %w(bc)
  # first_line_match %r'^#!/.*\bruby'
  # folding_start_marker %r:(?x)^ ... $:
  # folding_stop_marker %r/(?x) ... /
  # key_equivalent "^~R"  # TextMate only
  # uuid "E00B62AC-6B1C-11D9-9B1F-000D93589AF6"  # TextMate only

  commands = %w(
    attrib beep collapse compare copy copyto criteria data-report delete expand file-report filter
    folder-report hex-report load log move mp3-report option picture-report registry-report rename
    select snapshot sync text-report touch version-report
  )

  # valueless option/parameter names

    # all attrib binary crc create-empty cutoff diff empty exact expand-archives files folders newer
    # no-filters older orphan regexpr rules-based save-crc save-version size stop-on-error version
    # visible

  # selection masks:
    # all
    # empty.folders
    # [(left|lt|right|rt|all).][(exact|diff|newer|older|orphan|all).][(files|folders|all)]

  # valued option/parameter names

    # append attrib confirm layout mirror options output-options output-to path prompt recyclebin
    # timestamp timezone update

  # option/parameter values

    # base clipboard column-attributes
    # column-crc column-none column-size column-timestamp column-version
    # composite display-all display-context display-left-newer display-left-newer-orphans
    # display-matches display-mismatches display-mismatches-no-orphans display-no-orphans
    # display-orphans display-right-newer display-right-newer-orphans html-color html-custom html-mono
    # ignore ignore-unimportant ignoredst line-numbers no no-to-all none normal now over-under patch
    # patch-classic patch-context patch-standard patch-unified print-color print-landscape print-mono
    # print-portrait printer prompt relative side-by-side statistics stats-descriptive stats-tabular
    # verbose wrap-character wrap-none wrap-word xml yes yes-to-all

  sides = %w(lt left right rt lt->rt rt->lt)

  rule 'comment.line.beyond-compare' do
    match %r/(?:^\s+)?(#).*$\n?/,
      1 => 'punctuation.definition.comment.beyond-compare'
  end

  rule 'meta.statement.beyond-compare' do
    from %r/^\s*(#{commands.join('|')})\b/i, 1 => 'keyword.control.beyond-compare'
    to %r/[^&]$/

    include '#string'
    # rule 'statement continuation' { match %r/&$/ }

    # rule 'attrib'
    # /[-+][ashr]/

  end

  fragment :string do
    # double quoted string
    rule 'string.quoted.double.beyond-compare' do
      from %r/"/, 0 => 'punctuation.definition.string.begin.beyond-compare'
      to %r/"/, 0 => 'punctuation.definition.string.end.beyond-compare'
      # include '#variables'
    end
  end

  # fragment :variables do

    # rule 'script args'
    # ; other miscellaneous
    # /%[1-9]/

    # rule 'auto var'
    # /%(date|time)%/i

    # rule 'env var'
    # /%[a-z]%/i

    # rule 'continue statement'
    # /&$/

  # end

end
