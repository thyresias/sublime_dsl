# encoding: utf-8

preferences 'Comments' => 'source.css' do
  shell_variable 'TM_COMMENT_START', '/*'
  shell_variable 'TM_COMMENT_END', '*/'
  shell_variable 'TM_COMMENT_DISABLE_INDENT', 'yes'
  uuid "375CF370-8A7B-450A-895C-FD18B47957E2"
end

preferences 'Completions' => 'source.css -meta.property-list' do
  completions %w(
    * # . a abbr acronym address area b base big blockquote body br button caption
    cite code col colgroup dd del dfn div dl dt em fieldset form frame frameset h1
    h2 h3 h4 h5 h6 head hr html i iframe img input ins kbd label legend li link map
    meta noframes noscript object ol optgroup option p param pre q samp script
    select small span strike strong style sub sup table tbody td textarea tfoot th
    thead title tr tt ul var
  )
  uuid "92B0C9FE-CC81-498A-B93C-376A9C47CF2D"
end

preferences 'Folding' => 'source.css' do
  folding_start_marker %r'/\*\*(?!\*)|\{\s*($|/\*(?!.*?\*/.*\S))|\/\*\s*@group\s*.*\s*\*\/'
  folding_stop_marker %r'(?<!\*)\*\*/|^\s*\}|\/*\s*@end\s*\*\/'
  uuid "37393068-A217-494A-9DA4-68FD43FB4F8B"
end

preferences 'Miscellaneous' => 'source.css' do
  smart_typing_pairs "\"\" () {} [] “” '' ``"
  uuid "623154CA-0EDF-4365-9441-80D396C11979"
end

preferences 'Property Completions' => 'source.css meta.property-list -meta.property-value' do
  completions %w(
    -moz-border-radius azimuth background background-attachment background-color
    background-image background-position background-repeat border border-bottom
    border-bottom-color border-bottom-style border-bottom-width border-collapse
    border-color border-left border-left-color border-left-style border-left-width
    border-right border-right-color border-right-style border-right-width
    border-spacing border-style border-top border-top-color border-top-style
    border-top-width border-width bottom caption-side clear clip color content
    counter-increment counter-reset cue cue-after cue-before cursor direction
    display elevation empty-cells float font font-family font-size font-size-adjust
    font-stretch font-style font-variant font-weight height left letter
    letter-spacing line-height list list-style list-style-image list-style-position
    list-style-type margin margin-bottom margin-left margin-right margin-top marker
    marker-offset marks max-height max-width min-height min-width opacity orphans
    outline outline-color outline-style outline-width overflow overflow(-[xy])?
    padding padding-bottom padding-left padding-right padding-top page
    page-break-after page-break-before page-break-inside pause pause-after
    pause-before pitch pitch-range play-during position quotes richness right
    scrollbar size speak speak-header speak-numeral speak-punctuation speech-rate
    stress table-layout text text-align text-decoration text-indent text-shadow
    text-transform top unicode-bidi vertical vertical-align visibility voice-family
    volume white white-space widows width word word-spacing z-index
  )
  uuid "BCAF7514-033E-45D7-9E46-07FACF84DAAD"
end

preferences 'Property Value Completions' => 'source.css meta.property-value' do
  completions %w(
    absolute all-scroll always auto baseline below bidi-override block bold bolder
    both bottom break-all break-word capitalize center char circle col-resize
    collapse crosshair dashed decimal default disabled disc distribute
    distribute-all-lines distribute-letter distribute-space dotted double e-resize
    ellipsis fixed groove hand help hidden horizontal ideograph-alpha
    ideograph-numeric ideograph-parenthesis ideograph-space inactive inherit inline
    inline-block inset inside inter-ideograph inter-word italic justify keep-all
    left lighter line line-edge line-through list-item loose lower-alpha lower-roman
    lowercase lr-tb ltr medium middle move n-resize ne-resize newspaper no-drop
    no-repeat none normal not-allowed nowrap nw-resize oblique outset outside
    overline pointer progress relative repeat repeat-x repeat-y ridge right
    row-resize rtl s-resize scroll se-resize separate small-caps solid square static
    strict super sw-resize table-footer-group table-header-group tb-rl text
    text-bottom text-top thick thin top transparent underline upper-alpha
    upper-roman uppercase url("") vertical-ideographic vertical-text visible
    w-resize wait whitespace
  )
  uuid "1E4F54FD-1940-42E0-9D0A-0EC11D81E446"
end

preferences 'PropertyName' => 'meta.property-list.css -meta.property-value' do
  smart_typing_pairs ":;"
  uuid "45707407-3307-4B4D-AE9B-78BDCFB6F920"
end

preferences 'Symbol List: Selector' => 'source.css meta.selector, source.css meta.at-rule.media', file: 'Symbol list' do
  show_in_symbol_list true
  symbol_transformation 's/^\s*/CSS: /; s/\s+/ /g'
  uuid "17B2DD5B-D2EA-4DC5-9C7D-B09B505156C5"
end

preferences 'Symbol List: Group' => 'source.css comment.block.css -source.css.embedded' do
  show_in_symbol_list true
  symbol_transformation 's/\/\*\*\s*(.*?)\s*\*\//** $1 **/; s/\/\*.*?\*\*\//./; s/\/\*[^\*].*?[^\*]\*\///'
  uuid "096894D8-6A5A-4F1D-B68C-782F0A850E52"
end
