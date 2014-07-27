# encoding: utf-8

language 'Installer Distribution Script' => 'text.xml.apple-dist' do
  file_types %w(dist)
  key_equivalent "^~I"  # TextMate only
  uuid "25D29CD3-07B7-44C6-A96A-46CF771130EB"  # TextMate only

  rule do
    content_scope "meta.embedded.js.apple-dist"
    from %r/(^\s*)?(?=<script>)/,
      1 => 'punctuation.whitespace.embedded.leading.apple-dist'
    to %r'(?<=</script>)(?!<script>)(\s*$\n?)?',
      1 => 'punctuation.whitespace.embedded.trailing.apple-dist'
    rule do
      content_scope "source.js"
      from %r/((<)(script)(>))/,
        0 => 'punctuation.definition.embedded.begin.apple-dist',
        1 => 'meta.tag.content.embedded.begin.apple-dist',
        2 => 'punctuation.definition.tag.xml',
        3 => 'entity.name.tag.xml',
        4 => 'punctuation.definition.tag.xml'
      to %r'(((</))(script)(>))',
        0 => 'punctuation.definition.embedded.end.apple-dist',
        1 => 'meta.tag.content.embedded.end.apple-dist',
        2 => 'punctuation.definition.tag.xml',
        3 => 'source.js',
        4 => 'entity.name.tag.xml',
        5 => 'punctuation.definition.tag.xml'
      include "#javascript"
    end
  end
  include "text.xml"

  fragment :javascript do
    rule 'support.class.apple-dist' do
      from %r/\bsystem\b/
      to %r/(?=(\(|\s))|$/
      rule 'support.function.apple-dist' do
        match %r/\b(compareVersions|defaults|gestalt|localizedString(WithFormat)?|localizedStandardString(WithFormat)?|log|propertiesOf|run(Once)?|sysctl|users\.desktopSessionsCount|version)\b/
      end
      rule 'support.function.apple-dist' do
        from %r/\b(applications)\b/
        to %r/(?=(\(|\s))|$/
        rule 'support.variable.apple-dist' do
          match %r/\b(fromPID|fromIdentifier|all)\b/
        end
      end
      rule 'support.function.apple-dist' do
        from %r/\b(files)\b/
        to %r/(?=(\(|\s))|$/
        rule 'support.variable.apple-dist' do
          match %r/\b(fileExistsAtPath|plistAtPath|bundleAtPath)\b/
        end
      end
      rule 'support.function.apple-dist' do
        from %r/\b(ioregistry)\b/
        to %r/(?=(\(|\s))|$/
        rule 'support.variable.apple-dist' do
          match %r/\b(fromPath|matching(Class|Name)|(children|parents)Of)\b/
        end
      end
    end
    rule 'support.class.apple-dist' do
      from %r/\b(choices)\b/
      to %r/(?=(\(|\s))|$/
      rule 'support.variable.apple-dist' do
        match %r/\b(.*)\.(bundle|customLocation(AllowAlternateVolumes)?|description(-mime-type)?|(start_)?enabled|id|(start_)?selected|tooltip|(start_)?visible|title|packages|packageUpgradeAction)\b/
      end
    end
    rule 'support.class.apple-dist' do
      from %r/\bmy\b/
      to %r/(?=(\(|\s))|$/
      rule 'support.function.apple-dist' do
        from %r/\b(choice)\b/
        to %r/(?=(\(|\s))|$/
        rule 'support.variable.apple-dist' do
          match %r/\b(bundle|customLocation(AllowAlternateVolumes)?|description(-mime-type)?|(start_)?enabled|id|(start_)?selected|tooltip|(start_)?visible|title|packages|packageUpgradeAction)\b/
        end
      end
      rule 'support.function.apple-dist' do
        from %r/\b(result)\b/
        to %r/(?=(\(|\s))|$/
        rule 'support.variable.apple-dist' do
          match %r/\b(type|title|message)\b/
        end
      end
      rule 'support.function.apple-dist' do
        from %r/\b(target)\b/
        to %r/(?=(\(|\s))|$/
        rule 'support.variable.apple-dist' do
          match %r/\b(mountpoint|availableKilobytes|systemVersion|receiptForIdentifier)\b/
        end
      end
    end
    include "source.js"
  end
end
