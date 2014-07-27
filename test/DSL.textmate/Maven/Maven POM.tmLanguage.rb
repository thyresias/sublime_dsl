# encoding: utf-8

language 'Maven POM' => 'text.xml.pom' do
  file_types %w(pom.xml)
  key_equivalent "^~M"  # TextMate only
  uuid "FF85557D-4A93-4CD0-954C-DB74F36A27D8"  # TextMate only

  include "#profiles"
  include "#pom-body"
  include "#maven-xml"

  fragment :build do
    rule 'meta.build.xml.pom' do
      from %r'(<)(build)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.build.begin.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      to %r'(</)(build)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.build.end.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      include "#plugins"
      include "#extensions"
      include "#maven-xml"
    end
  end

  fragment :dependencies do
    rule 'meta.dependencies.xml.pom' do
      from %r'(<)(dependencies)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.dependencies.begin.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      to %r'(</)(dependencies)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.dependencies.end.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      include "#dependency"
      include "#maven-xml"
    end
  end

  fragment :dependency do
    rule 'meta.dependency.xml.pom' do
      from %r'(<)(dependency)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.dependency.begin.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      to %r'(</)(dependency)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.dependency.end.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      rule 'meta.dependency-id.xml.pom' do
        from %r/(?<=<artifactId>)/
        to %r'(?=</artifactId>)'
      end
      include "#maven-xml"
    end
  end

  fragment :distributionManagement do
    rule 'meta.distributionManagement.xml.pom' do
      from %r'(<)(distributionManagement)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.distributionManagement.begin.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      to %r'(</)(distributionManagement)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.distributionManagement.end.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      include "#maven-xml"
    end
  end

  fragment :extension do
    rule 'meta.extension.xml.pom' do
      from %r'(<)(extension)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.extension.begin.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      to %r'(</)(extension)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.extension.end.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      rule 'meta.extension-id.xml.pom' do
        from %r/(?<=<artifactId>)/
        to %r'(?=</artifactId>)'
      end
      include "#maven-xml"
    end
  end

  fragment :extensions do
    rule 'meta.extensions.xml.pom' do
      from %r'(<)(extensions)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.extensions.begin.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      to %r'(</)(extensions)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.extensions.end.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      include "#extension"
      include "#maven-xml"
    end
  end

  fragment :"groovy-plugin" do
    rule 'meta.plugin.groovy-plugin.xml.pom' do
      from %r'((<)(artifactId)\s*(>)(?!<\s*/\2\s*>))(groovy-maven-plugin)((</)(artifactId)\s*(>)(?!<\s*/\2\s*>))',
        0 => 'meta.groovy-plugin.identifier.xml.pom',
        1 => 'meta.tag.artifactId.begin.xml.pom',
        2 => 'punctuation.definition.tag.xml.pom',
        3 => 'entity.name.tag.xml.pom',
        4 => 'punctuation.definition.tag.xml.pom',
        5 => 'meta.plugin-id.xml.pom',
        6 => 'meta.tag.artifactId.begin.xml.pom',
        7 => 'punctuation.definition.tag.xml.pom',
        8 => 'entity.name.tag.xml.pom',
        9 => 'punctuation.definition.tag.xml.pom'
      to %r'(?=</plugin>)'
      rule 'meta.source.groovy.xml.pom' do
        content_scope "source.groovy"
        from %r'(<)(source)\s*(>)(?!<\s*/\2\s*>)',
          0 => 'meta.tag.plugin.begin.xml.pom',
          1 => 'punctuation.definition.tag.xml.pom',
          2 => 'entity.name.tag.xml.pom',
          3 => 'punctuation.definition.tag.xml.pom'
        to %r'(</)(source)\s*(>)(?!<\s*/\2\s*>)',
          0 => 'meta.tag.plugin.end.xml.pom',
          1 => 'punctuation.definition.tag.xml.pom',
          2 => 'entity.name.tag.xml.pom',
          3 => 'punctuation.definition.tag.xml.pom'
        include "source.groovy"
      end
      include "#maven-xml"
    end
  end

  fragment :"maven-xml" do
    rule 'variable.other.expression.xml.pom' do
      from %r/\${/
      to %r/}/
      both 0 => 'punctuation.definition.variable.begin.xml.pom'
    end
    include "text.xml"
  end

  fragment :plugin do
    rule 'meta.plugin.xml.pom' do
      from %r'(<)(plugin)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.plugin.begin.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      to %r'(</)(plugin)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.plugin.end.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      include "#groovy-plugin"
      rule 'meta.plugin-id.xml.pom' do
        from %r/(?<=<artifactId>)/
        to %r'(?=</artifactId>)'
      end
      include "#maven-xml"
    end
  end

  fragment :plugins do
    rule 'meta.plugins.xml.pom' do
      from %r'(<)(plugins)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.plugins.begin.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      to %r'(</)(plugins)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.plugins.end.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      include "#plugin"
      include "#maven-xml"
    end
  end

  fragment :"pom-body" do
    include "#dependencies"
    include "#repositories"
    include "#build"
    include "#reporting"
    include "#distributionManagement"
    include "#properties"
    include "#maven-xml"
  end

  fragment :profile do
    rule 'meta.profile.xml.pom' do
      from %r'(<)(profile)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.profile.begin.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      to %r'(</)(profile)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.profile.end.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      rule 'meta.profile-id.xml.pom' do
        from %r/(?<=<id>)/
        to %r'(?=</id>)'
      end
      include "#pom-body"
    end
  end

  fragment :profiles do
    rule 'meta.profiles.xml.pom' do
      from %r'(<)(profiles)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.profiles.begin.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      to %r'(</)(profiles)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.profiles.end.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      include "#profile"
    end
  end

  fragment :properties do
    rule 'meta.properties.xml.pom' do
      from %r'(<)(properties)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.properties.begin.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      to %r'(</)(properties)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.properties.end.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      rule 'meta.property.xml.pom' do
        from %r'(<)(\w+)\s*(>)(?!<\s*/\2\s*>)',
          0 => 'meta.tag.property.begin.xml.pom',
          1 => 'punctuation.definition.tag.xml.pom',
          2 => 'entity.name.tag.xml.pom',
          3 => 'punctuation.definition.tag.xml.pom'
        to %r'(</)(\w+)\s*(>)(?!<\s*/\2\s*>)',
          0 => 'meta.tag.property.end.xml.pom',
          1 => 'punctuation.definition.tag.xml.pom',
          2 => 'entity.name.tag.xml.pom',
          3 => 'punctuation.definition.tag.xml.pom'
      end
      include "#maven-xml"
    end
  end

  fragment :reporting do
    rule 'meta.reporting.xml.pom' do
      from %r'(<)(reporting)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.reporting.begin.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      to %r'(</)(reporting)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.reporting.end.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      include "#plugins"
      include "#maven-xml"
    end
  end

  fragment :repositories do
    rule 'meta.repositories.xml.pom' do
      from %r'(<)(repositories)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.repositories.begin.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      to %r'(</)(repositories)\s*(>)(?!<\s*/\2\s*>)',
        0 => 'meta.tag.repositories.end.xml.pom',
        1 => 'punctuation.definition.tag.xml.pom',
        2 => 'entity.name.tag.xml.pom',
        3 => 'punctuation.definition.tag.xml.pom'
      include "#maven-xml"
    end
  end
end
