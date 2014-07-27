# encoding: utf-8

language 'Doxygen' => 'text.html.doxygen' do
  file_types %w(doxygen)
  uuid "9725E602-6D7C-4E98-911A-C66802142451"  # TextMate only

  rule 'comment.block.doxygen' do
    from %r'/\*\*<?'
    to %r'\*/'
    both 0 => 'punctuation.definition.comment.doxygen'
    include "#source_doxygen"
  end
  rule 'comment.block.doxygen' do
    from %r'/\*!<?'
    to %r'\*/'
    both 0 => 'punctuation.definition.comment.doxygen'
    include "#source_doxygen"
  end
  rule do
    from %r'(^[ \t]+)?(?=//[/!]<?)',
      1 => 'punctuation.whitespace.comment.leading.doxygen'
    to %r/(?!\G)/
    rule 'comment.line.doxygen' do
      from %r'//[/!]<?',
        0 => 'punctuation.definition.comment.doxygen'
      to %r/\n/
      include "#source_doxygen"
    end
  end

  fragment :keywords do
    rule 'keyword.control.doxygen' do
      match %r/([\\@])((a|addindex|addtogroup|anchor|arg|attention|author|authors|b|brief|bug|c|callgraph|callergraph|category|cite|class|code|cond|condnot|copybrief|copydetails|copydoc|copyright|date|def|defgroup|deprecated|details|dir|dontinclude|dot|dotfile|e|else|elseif|em|endcode|endcond|enddot|endhtmlonly|endif|endinternal|endlatexonly|endlink|endmanonly|endmsc|endrtfonly|endverbatim|endxmlonly|enum|example|exception|extends|file|fn|headerfile|hideinitializer|htmlinclude|htmlonly|if|ifnot|image|implements|include|includelineno|ingroup|internal|invariant|interface|latexonly|li|line|link|mainpage|manonly|memberof|msc|mscfile|n|name|namespace|nosubgrouping|note|overload|p|package|page|par|paragraph|param|post|pre|private|privatesection|property|protected|protectedsection|protocol|public|publicsection|ref|related|relates|relatedalso|relatesalso|remark|remarks|result|return|returns|retval|rtfonly|sa|section|see|short|showinitializer|since|skip|skipline|snippet|struct|subpage|subsection|subsubsection|tableofcontents|test|throw|throws|todo|tparam|typedef|union|until|var|verbatim|verbinclude|version|warning|weakgroup|xmlonly|xrefitem)\b|(\$|\@|\\|\&|\~|\<|\>|\#|\%|\"|\.|::|f\$|f\[|f\]|f\{|f\}))/,
        1 => 'punctuation.definition.keyword.doxygen'
    end
  end

  fragment :source_doxygen do
    include "#keywords"
    include "text.html.basic"
  end
end
