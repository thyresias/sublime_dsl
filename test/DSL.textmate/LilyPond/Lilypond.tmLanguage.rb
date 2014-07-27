# encoding: utf-8

language 'LilyPond' => 'source.lilypond', file: 'Lilypond' do
  #
  # This bundle is, as can easily be seen, far from complete,
  # but it should still be as useful as the Lilypond.app pyobjc
  # application, which has no syntax coloring, no way to do
  # snippets, and pretty much no interesting functionality at
  # all, other than a "Run" menu option. :)
  #
  file_types %w(ly lily ily)
  key_equivalent "^~L"  # TextMate only
  uuid "F25B30BE-0526-4D92-806C-F0D678DDF669"  # TextMate only

  include "#comments"
  include "#g_header"
  include "#groupings"
  include "#strings"
  include "#scheme"
  include "#functions"

  fragment :comments do
    rule 'comment.block.lilypond' do
      from %r/%{/
      to %r/%}/
      both 0 => 'punctuation.definition.comment.lilypond'
    end
    rule do
      from %r/(^[ \t]+)?(?=%)/,
        1 => 'punctuation.whitespace.comment.leading.lilypond'
      to %r/(?!\G)/
      rule 'comment.line.percentage.lilypond' do
        from %r/%/,
          0 => 'punctuation.definition.comment.lilypond'
        to %r/\n/
      end
    end
  end

  fragment :f_clef do
    rule 'meta.element.clef.lilypond' do
      #
      # This looks something like:   \clef mezzosoprano_8
      # Or maybe:                    \clef neomensural-c3^15
      #
      match %r'(?x)
        ((\\) clef) \s+  # backslash + "clef" + spaces (groups 1-2)
        (?:
          ("?)  # beginning quotes (group 3)
          (?:
            ( (?: # group 4
              treble | violin | G | french |                    # G clefs
                alto | C | tenor | (?:mezzo)?soprano | baritone | # C clefs
                (?:sub)?bass | F | varbaritone |                  # F clefs
                percussion | tab | # percussion / tablature clefs
                      
                  (?:neo)?mensural-c[1-4] | mensural-[fg] |     # Ancient clefs
                petrucci-(?: [fg] | c[1-5] ) |
                (?: vaticana | medicaea | hufnagel ) - (?: do[1-3] | fa[12] ) |
                hufnagel-do-fa
              )
              ([_^](?:8|15)?)? # optionally shift 1-2 octaves ↑/↓ (group 5)
            ) |
            ( (?:\w+) ([_^](?:8|15))? ) # unknown clef name (groups 6-7)
          )
          (\3) # closing quotes (group 8)
        )?
      ',
        1 => 'support.function.element.lilypond',
        2 => 'punctuation.definition.function.lilypond',
        3 => 'punctuation.definition.string.lilypond',
        4 => 'constant.language.clef-name.lilypond',
        5 => 'constant.other.modifier.clef.lilypond',
        6 => 'meta.fixme.unknown-clef-name.lilypond',
        7 => 'constant.other.modifier.clef.lilypond',
        8 => 'punctuation.definition.string.lilypond'
    end
  end

  fragment :f_generic do
    rule 'support.function.general.lilypond' do
      match %r/(\\)[a-zA-Z-]+\b/,
        1 => 'punctuation.definition.function.lilypond'
    end
  end

  fragment :"f_key-signature" do
    # FIXME: no "match" nor "begin/end"
    rule 'meta.element.key-signature.lilypond' do
      # FIXME
    end
  end

  fragment :f_keywords do
    rule 'keyword.control.lilypond' do
      match %r/(?x)
        (?: (\\)
            (?: set | new | override | revert)\b
        )
      /,
        1 => 'punctuation.definition.function.lilypond'
    end
  end

  fragment :"f_time-signature" do
    rule 'meta.element.time-signature.lilypond' do
      match %r'(?x)
        ((\\) time) \s+ # backslash + "time" + spaces (groups 1-2)
        ([1-9][0-9]*/[1-9][0-9]*)?
      ',
        1 => 'support.function.element.lilypond',
        2 => 'punctuation.definition.function.lilypond',
        3 => 'constant.numeric.time-signature.lilypond'
    end
  end

  fragment :functions do
    include "#f_clef"
    include "#f_time-signature"
    include "#f_key-signature"
    include "#f_keywords"
    include "#f_generic"
  end

  fragment :g_header do
    rule 'meta.header.lilypond' do
      from %r/((\\)header)\s*({)/,
        1 => 'support.function.section.header.lilypond',
        2 => 'punctuation.definition.function.lilypond',
        3 => 'punctuation.section.group.begin.lilypond'
      to %r/}/,
        0 => 'punctuation.section.group.end.lilypond'
      include "#comments"
      include "#strings"
      include "#scheme"
      include "#g_markup"
      rule 'punctuation.separator.key-value.lilypond' do
        match %r/=/
      end
      rule 'support.constant.header.lilypond' do
        match %r/(?x)
            dedication | title | subtitle | subsubtitle | poet |
            composer | meter | opus | arranger | instrument |
            piece | breakbefore | copyright | tagline | enteredby
          /
      end
      rule 'support.constant.header.mutopia.lilypond' do
        match %r/(?x)
            mutopiatitle | mutopiacomposer | mutopiapoet |
            mutopiaopus | mutopiainstrument | date | source |
            style | maintainer | maintainerEmail |
            maintainerWeb | lastupdated
          /
      end
    end
  end

  fragment :g_m_group do
    rule 'meta.group.lilypond' do
      from %r/{/,
        0 => 'punctuation.section.group.begin.lilypond'
      to %r/}/,
        0 => 'punctuation.section.group.end.lilypond'
      include "#f_generic"
      include "#strings"
      include "#comments"
      include "#scheme"
      include "#g_m_group"
    end
  end

  fragment :g_markup do
    rule 'meta.element.markup.lilypond' do
      from %r/(?x)
        ((\\) markup) \s+ # backslash + "markup" + spaces
        (?={)
      /,
        1 => 'support.function.element.markup.lilypond',
        2 => 'punctuation.definition.function.markup'
      to %r/(?<=})/
      include "#g_m_group"
    end
  end

  fragment :g_relative do
    rule do
      from %r/((\\)relative)\s*(?:([a-h][',]*)\s*)?(?={)/,
        1 => 'support.function.section.lilypond',
        2 => 'punctuation.definition.function.lilypond',
        3 => 'storage.type.pitch.lilypond'
      to %r/(?<=})/
      include "#group"
    end
  end

  fragment :g_system do
    rule 'meta.system.lilypond' do
      from %r/<</,
        0 => 'punctuation.section.system.begin.lilypond'
      to %r/>>/,
        0 => 'punctuation.section.system.end.lilypond'
      include "$self"
    end
  end

  fragment :g_times do
    rule do
      from %r'((\\)times)\s*(?:([1-9][0-9]*/[1-9][0-9])\s*)(?={)',
        1 => 'support.function.section.lilypond',
        2 => 'punctuation.definition.function.lilypond',
        3 => 'constant.numeric.fraction.lilypond'
      to %r/(?<=})/
      include "#group"
    end
  end

  fragment :group do
    rule 'meta.music-expression.lilypond' do
      from %r/{/,
        0 => 'punctuation.section.group.begin.lilypond'
      to %r/}/,
        0 => 'punctuation.section.group.end.lilypond'
      include "#music-expr"
    end
  end

  fragment :groupings do
    include "#g_system"
    include "#g_relative"
    include "#g_times"
    include "#group"
  end

  fragment :"music-expr" do
    include "#comments"
    include "#groupings"
    include "#strings"
    include "#functions"
    include "#scheme"
    include "#notes"
  end

  fragment :n_articulations do
    rule 'storage.modifier.articulation.accent.lilypond' do
      match %r/(?x)
            ([_^-])
            (?:[.>^+|_-])
          /
    end
    rule 'storage.modifier.articulation.named.lilypond' do
      match %r/(?x)
            (\\)
            (?: accent | markato | staccatissimo |           # basic accents
              espressivo | staccato | tenuto | portato | 
              (?:up|down)bow | flageolet | thumb |
              [lr](?:heel|toe) | open | stopped |
              (?:reverse)?turn | trill |
              prall(?: prall | mordent | down | up)? |       # pralls
              (?: up | down | line ) prall |                 # and
              (?: up | down )? mordent |                     # mordents
              signumcongruentiae |
              (?: (?:very)? long | short)?fermata(Markup)? | # fermatas
              segno | (?:var)?coda 
            )
          /,
        1 => 'punctuation.definition.function.lilypond'
    end
    rule 'storage.modifier.articulation.dynamics.lilypond' do
      match %r/(?x)
            (\\) # backslash
            (?:
                p{1,5} | m[pf] | f{1,4} | fp | # forte, piano, etc.
                [sr]fz | sff? | spp? | 
                < | > | ! | espressivo         # (de)crescendo
            )
          /
    end
    rule 'storage.modifier.beam.lilypond' do
      match %r/\[|\]/
    end
    rule 'storage.modifier.slur.lilypond' do
      match %r/\(|\)/
    end
    rule 'storage.modifier.slur.phrasing.lilypond' do
      match %r/\\\(|\\\)/
    end
  end

  fragment :notes do
    #
    # This section includes the rules for notes, rests, and chords
    #
    rule 'meta.element.note.lilypond' do
      #
      # This rule handles notes, including the pitch, the
      # duration, and any articulations drawn along with
      # the note.
      #
      # This rule gets a whole lot uglier if we want to
      # support multilingual note names.  If so, the rule
      # goes something like:
      #
      # (?x)
      #   \b( # Basic Pitches
      #     [a-h]  # Dutch/English/etc.
      #     (?: (iss?|s|sharp|x)(iss?|s|sharp|x|ih) | # sharp / flat
      #       (ess?|s|flat|f)(ess?|s|flat|f|eh)
      #     )? |
      #     (?: do|re|mi|fa|sol|la|si) # Italian/Spanish
      #     (?: ss?|dd?bb?) # sharp/flat
      #   )
      # ...
      #
      from %r/(?x)\b
              (              # (group 1)
              ( [a-h]                 # Pitch (group 2)
                ( (?:i[sh]){1,2} |    #   - sharp (group 3)
                  (?:e[sh]|s){1,2}    #   - flat
                )?
                  (?:(\!)|(\?))?               # Cautionary accidental (groups 4-5)
                  ('+|,+)?             # Octave (group 6)
              )
              ( ( ((\\)breve)|        # Duration (groups 7-10)
                  64|32|16|8|4|2|1
                )
                (\.+)?                 # Augmentation dot (group 11)
              ((?:(\*)(\d+(?:\/\d+)?))*) # Scaling duration (groups 12-14)
              )?
            )(?![a-z])  # do not follow a note with a letter
          /,
        2 => 'storage.type.pitch.lilypond',
        4 => 'meta.note-modifier.accidental.reminder.lilypond',
        5 => 'meta.note-modifier.accidental.cautionary.lilypond',
        6 => 'meta.note-modifier.octave.lilypond',
        7 => 'storage.type.duration.lilypond',
        10 => 'punctuation.definition.function.lilypond',
        13 => 'keyword.operator.duration-scale.lilypond',
        14 => 'constant.numeric.fraction.lilypond'
      to %r/(?x)
            (?= [\s}~a-z] |$) # End when we encounter a space or } or end of line
          /
      include "#n_articulations"
    end
    rule 'meta.element.pause.rest.lilypond' do
      from %r'(?x)\b
            (?:(r)|(R)) # (groups 1-2)
            ( ( (\\)breve|       # Duration (groups 3-5)
                64|32|16|8|4|2|1
              )
              (\.+)?                 # Augmentation dot (group 6)
              ((?:(\*)(\d+(?:/\d+)?))*) # Scaling duration (groups 7-9)
            
            )?
            (?![a-z])  # do not follow a note with a letter
          ',
        1 => 'storage.type.pause.rest.lilypond',
        2 => 'storage.type.pause.rest.multi-measure.lilypond',
        3 => 'storage.type.duration.lilypond',
        5 => 'punctuation.definition.function.lilypond',
        7 => 'keyword.operator.duration-scale.lilypond',
        9 => 'constant.numeric.fraction.lilypond'
      to %r/(?=[\s}~a-z])/
      include "#n_articulations"
    end
    rule 'meta.element.pause.skip.lilypond' do
      from %r'(?x)\b
            (s) # (group 1)
            ( ( (\\)breve|       # Duration (groups 2-4)
                64|32|16|8|4|2|1
              )
              (\.+)?                 # Augmentation dot (group 5)
              ((?:(\*)(\d+(?:/\d+)?))*) # Scaling duration (groups 6-8)
            
            )?
            (?![a-z])  # do not follow a note with a letter
          ',
        1 => 'storage.type.pause.skip.lilypond',
        2 => 'storage.type.duration.lilypond',
        4 => 'punctuation.definition.function.lilypond',
        6 => 'keyword.operator.duration-scale.lilypond',
        8 => 'constant.numeric.fraction.lilypond'
      to %r/(?=[\s}~a-z]|$)/
      include "#n_articulations"
    end
    rule 'meta.element.pause.skip.lilypond' do
      match %r/((\\)skip)\s+(64|32|16|8|4|2|1)/,
        1 => 'storage.type.pause.skip.lilypond',
        2 => 'punctuation.definition.function.lilypond',
        3 => 'storage.type.duration.lilypond'
    end
    rule 'meta.element.chord.lilypond' do
      #
      # Lilypond chords look like:    < a b c >
      #
      from %r/</
      to %r/>/
      both 0 => 'punctuation.definition.chord.lilypond'
      rule do
        match %r/(?x)\b
                  ( [a-h]                 # Pitch (group 1)
                    ( (?:i[sh]){1,2} |    #   - sharp (group 2)
                      (?:e[sh]|s){1,2}    #   - flat
                    )?
                      (?:(\!)|(\?))?       # Reminder\/cautionary accidental (groups 3-4)
                      ('+|,+)?             # Octave (group 5)
                  )
              /,
          1 => 'storage.type.pitch.lilypond',
          3 => 'meta.note-modifier.accidental.reminder.lilypond',
          4 => 'meta.note-modifier.accidental.cautionary.lilypond',
          5 => 'meta.note-modifier.octave.lilypond'
      end
    end
    rule 'meta.element.chord.lilypond' do
      #
      # This rule attaches stuff to the end of a chord
      #
      # Therefore it begins after the > which ends a chord,
      # and does not end after a > which ends a chord.
      # (to avoid infinite loops)
      #
      from %r/(?x)
              (?<!-)
              (?<=>)
            (
              ( ( ((\\)breve)|        # Duration (groups 1-4)
                  64|32|16|8|4|2|1
                )
                (\.+)?                  # Augmentation dot (group 5)
              ) |
              (?![\s}~a-z]|$)
            )
          /,
        1 => 'storage.type.duration.lilypond',
        4 => 'punctuation.definition.function.lilypond'
      to %r/(?=[\s}~a-z]|$)(?<![^-]>)/
      include "#n_articulations"
    end
    rule 'storage.type.tie.lilypond' do
      match %r/~/
    end
    rule 'storage.type.breath-mark.lilypond' do
      match %r/(\\)breathe/,
        1 => 'punctuation.definition.function.lilypond'
    end
  end

  fragment :scheme do
    rule do
      from %r/(^[ \t])?(?=#)/,
        0 => 'punctuation.whitespace.embedded.leading.scheme'
      to %r/(?!\G)/
      rule 'meta.embedded.line.scheme' do
        content_scope "source.scheme"
        from %r/#/
        to %r/(?=[\s%])|(?<=\n)/
        include "source.scheme"
      end
    end
  end

  fragment :strings do
    rule 'string.quoted.double.lilypond' do
      from %r/"/
      to %r/"/
      both 0 => 'punctuation.definition.string.lilypond'
      rule 'constant.character.escape.lilypond' do
        match %r/\\./
      end
    end
  end
end
