# encoding: utf-8

preferences 'Completions' => 'text.xml.pom' do
  completions %w(
    activation activeByDefault address arch archive artifactId build checksumPolicy
    ciManagement classifier comments configuration connection contributor
    contributors defaultGoal dependencies dependency dependencyManagement
    description developer developerConnection developers directory distribution
    distributionManagement downloadUrl email enabled excludeDefaults excludes
    exclusion exclusions execution executions exists extension extensions family
    file filtering filters finalName goals groupId id inceptionYear includes
    inherited issueManagement jdk layout license licenses mailingList mailingLists
    maven message missing modelVersion modules name notifier notifiers optional
    organization organizationUrl os otherArchives outputDirectory packaging parent
    phase plugin pluginManagement pluginRepositories pluginRepository plugins post
    prerequisites profile profiles project properties property relativePath releases
    relocation reporting reports reportSet reportSets repositories repository
    resource resources roles scm scope scriptSourceDirectory sendOnError
    sendOnFailure sendOnSuccess sendOnWarning site snapshotRepository snapshots
    sourceDirectory status subscribe system systemPath tag targetPath
    testOutputDirectory testResource testResources testSourceDirectory timezone type
    uniqueVersion unsubscribe updatePolicy url value version
  )
  uuid "D8BDD7B3-F35D-4D8E-94B5-87CB90944C1C"
end

preferences 'Symbol List: Build -> Extension -> Extension' => 'text.xml.pom meta.build meta.extensions meta.extension meta.extension-id' do
  show_in_symbol_list true
  symbol_transformation "s/.*/    extension: $0/"
  uuid "13D5A341-D7CC-41ED-91C4-602AA5E74E58"
end

preferences 'Symbol List: Build -> Extensions' => 'text.xml.pom meta.build meta.tag.extensions.begin' do
  show_in_symbol_list true
  symbol_transformation "s/.*/  extensions/"
  uuid "23A860DC-A252-40A2-A1D9-79EAC9CB3B1E"
end

preferences 'Symbol List: Build -> Plugins -> Plugin' => 'text.xml.pom meta.build meta.plugins meta.plugin meta.plugin-id' do
  show_in_symbol_list true
  symbol_transformation "s/.*/    plugin: $0/"
  uuid "3BC64EF1-67CD-4689-9B37-9D754F0E9A9D"
end

preferences 'Symbol List: Build -> Plugins' => 'text.xml.pom meta.build meta.tag.plugins.begin' do
  show_in_symbol_list true
  symbol_transformation "s/.*/  plugins/"
  uuid "8D174EDA-14D1-423A-9427-46AFFCF7FC9B"
end

preferences 'Symbol List: Build' => 'text.xml.pom meta.tag.build.begin' do
  show_in_symbol_list true
  symbol_transformation "s/.*/build/"
  uuid "F5C156D4-5817-4E2B-A8BE-A75B7D61D553"
end

preferences 'Symbol List: Dependencies -> Dependency' => 'text.xml.pom meta.dependencies meta.dependency meta.dependency-id' do
  show_in_symbol_list true
  symbol_transformation "s/.*/  depedency: $0/"
  uuid "A46B4CCE-8BD1-46AA-9B28-A95864E14E4B"
end

preferences 'Symbol List: Dependencies' => 'text.xml.pom meta.tag.dependencies.begin' do
  show_in_symbol_list true
  symbol_transformation "s/.*/dependencies/"
  uuid "B6596154-1365-441E-BB4C-C53BA0E9D21F"
end

preferences 'Symbol List: Profiles -> Profile -> Build' => 'text.xml.pom meta.profiles meta.profile meta.tag.build.begin' do
  show_in_symbol_list true
  symbol_transformation "s/.*/    build/"
  uuid "01A59BF7-D943-41E0-B5AA-7CAA04C91435"
end

preferences 'Symbol List: Profiles -> Profile -> Dependencies -> Dependency' => 'text.xml.pom meta.profiles meta.profile meta.dependencies meta.dependency meta.dependency-id' do
  show_in_symbol_list true
  symbol_transformation "s/.*/      dependency: $0/"
  uuid "6FE61B38-8560-4F13-96D4-B8E7EA235A8B"
end

preferences 'Symbol List: Profiles -> Profile -> Dependencies' => 'text.xml.pom meta.profiles meta.profile meta.tag.dependencies.begin' do
  show_in_symbol_list true
  symbol_transformation "s/.*/    dependencies/"
  uuid "B83683D3-8EE7-4B75-AB73-093C50735485"
end

preferences 'Symbol List: Profiles -> Profile' => 'text.xml.pom meta.profiles meta.profile meta.profile-id' do
  show_in_symbol_list true
  symbol_transformation "s/.*/  profile: $0/"
  uuid "B25F16A8-9059-420C-89BF-D71E5BDB6B53"
end

preferences 'Symbol List: Profiles' => 'text.xml.pom meta.tag.profiles.begin' do
  show_in_symbol_list true
  symbol_transformation "s/.*/profiles/"
  uuid "5F9897B0-3582-4163-81EA-3D80D6C55173"
end

preferences 'Symbol List: Properties -> Property' => 'text.xml.pom meta.properties meta.tag.property.begin  entity.name.tag' do
  show_in_symbol_list true
  symbol_transformation "s/.*/  property: $0/"
  uuid "0757E232-7370-4CB2-B7B5-A0BD8BD1768E"
end

preferences 'Symbol List: Properties' => 'text.xml.pom meta.tag.properties.begin' do
  show_in_symbol_list true
  symbol_transformation "s/.*/properties/"
  uuid "8A380CD5-F7EC-4ADD-8B09-D7DE28E95153"
end

preferences 'Symbol List: Reporting -> Plugins -> Plugin' => 'text.xml.pom meta.reporting meta.plugins meta.plugin meta.plugin-id' do
  show_in_symbol_list true
  symbol_transformation "s/.*/    plugin: $0/"
  uuid "5DB5C187-1F53-4D67-A79E-2B21996E7BE2"
end

preferences 'Symbol List: Reporting -> Plugins' => 'text.xml.pom meta.reporting meta.tag.plugins.begin' do
  show_in_symbol_list true
  symbol_transformation "s/.*/  plugins/"
  uuid "D2C98E19-A481-4CFC-8800-FB19999D058B"
end

preferences 'Symbol List: distributionManagement' => 'text.xml.pom meta.tag.distributionManagement.begin', file: 'Symbol List˸ Reporting copy' do
  show_in_symbol_list true
  symbol_transformation "s/.*/distributionManagement/"
  uuid "51279D12-00B1-4F13-95EE-DCAC994E9265"
end

preferences 'Symbol List: Reporting' => 'text.xml.pom meta.tag.reporting.begin' do
  show_in_symbol_list true
  symbol_transformation "s/.*/reporting/"
  uuid "5A4B41A2-5FC3-46C6-B29E-755E6BB3A9E7"
end

preferences 'Symbol List: Repositories' => 'text.xml.pom meta.tag.repositories.begin' do
  show_in_symbol_list true
  symbol_transformation "s/.*/repositories/"
  uuid "EB199A8B-F3D2-48E7-9E0B-D96399EC9A99"
end
