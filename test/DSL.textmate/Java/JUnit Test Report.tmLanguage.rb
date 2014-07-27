# encoding: utf-8

language 'JUnit Test Report' => 'text.junit-test-report' do
  # FIXME: no file types
  first_line_match %r/^Testsuite:/
  key_equivalent "^~J"  # TextMate only
  uuid "6F20804D-4BF2-42A7-BC64-A8CD83B7DE0F"  # TextMate only

  rule 'meta.testsuite.name.junit-test-report' do
    match %r/(Testsuite:) (.+)$\n/,
      1 => 'meta.testsuite.label.junit-test-report',
      2 => 'entity.name.testsuite.junit-test-report'
  end
  rule 'meta.testcase.name.junit-test-report' do
    match %r/(Testcase:) (.+) took ([\d\.]+) sec$\n/,
      1 => 'meta.testcase.label.junit-test-report',
      2 => 'entity.name.testcase.junit-test-report'
  end
  rule 'meta.stackframe.junit-test-report' do
    from %r/at\s+(?=.+?\(.+?\)$)/
    to %r/$\n/
    rule 'meta.stackframe.method.junit-test-report' do
      match %r/(?<=\.)[^\.]+?(?=\()/
    end
    rule do
      match %r/\((.+)(:)(.+)\)$/,
        1 => 'meta.stackframe.source.junit-test-report',
        3 => 'meta.stackframe.source.line.junit-test-report'
    end
  end
  rule 'meta.section.output.junit-test-report' do
    from %r/------------- Standard Output ---------------$\n/
    to %r/------------- ---------------- ---------------$\n/
    rule 'meta.output.junit-test-report' do
      content_scope "meta.output.content.junit-test-report"
      from %r/--Output from (.+?)--$\n/,
        1 => 'entity.name.testcase.junit-test-report'
      to %r/(?=--Output from|------------- ---------------- ---------------)/
    end
  end
  rule 'meta.section.error.junit-test-report' do
    content_scope "meta.error.junit-test-report"
    from %r/------------- Standard Error -----------------$\n/
    to %r/------------- ---------------- ---------------$\n/
    rule 'meta.error.junit-test-report' do
      content_scope "meta.error.content.junit-test-report"
      from %r/--Output from (.+?)--$\n/,
        1 => 'entity.name.testcase.junit-test-report'
      to %r/(?=--Output from|------------- ---------------- ---------------)/
    end
  end
end
