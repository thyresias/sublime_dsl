# encoding: utf-8

language 'Perforce Client Specification' => 'source.perforce' do
  file_types %w(spec client)
  first_line_match %r/# A Perforce/
  uuid "9C843973-4684-4D1F-AC63-748BE92025A6"  # TextMate only

  rule 'keyword.other' do
    match %r/^(Change|Client|User|Status|Description|Files|Update|Access|Owner|Host|Root|AltRoots|Options|SubmitOptions|LineEnd|View):/
  end
  rule 'keyword.control.submitoptions' do
    match %r/\b((submit|revert|leave)unchanged)(\+reopen)?\b/
  end
  rule 'keyword.control.lineend' do
    match %r/\b(local|unix||mac|win|share)\b/
  end
  rule 'keyword.control.options' do
    match %r/\b(((no)?(allwrite|clobber|compress|modtime|rmdir)|(un)?locked))\b/
  end
  rule 'comment.line' do
    match %r/(#).*$\n?/,
      1 => 'punctuation.definition.comment'
  end
  rule 'invalid.illegal' do
    match %r/<enter description here>/
  end
end
