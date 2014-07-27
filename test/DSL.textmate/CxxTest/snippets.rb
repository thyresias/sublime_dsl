# encoding: utf-8

snippets do

  default_scope 'attr.test.cxxtest'
  file_format :textmate

  tab 'a', 'Assert', <<-'TXT', uuid: '22DDD2B3-5901-446B-8236-65516E05923F'
TS_ASSERT(${1:expr});
TXT

  tab 'ad', 'Assert Delta', <<-'TXT', uuid: 'D2575BFF-8A9B-41C5-AA1C-483A3D86D0E3'
TS_ASSERT_DELTA(${1:sqrt(4)}, ${2:2.0}, ${3:0.0001});
TXT

  tab 'ad', 'Assert Differs', <<-'TXT', uuid: '1E71D2E4-F9DB-42BC-9515-C7093161F720'
TS_ASSERT_DIFFERS(${1:x}, ${2:y});
TXT

  tab 'ae', 'Assert Equals', <<-'TXT', uuid: '936C7E11-2F62-4472-A987-2F3EF307354E'
TS_ASSERT_EQUALS(${1:x}, ${2:y});
TXT

  tab 'alt', 'Assert Less Than', <<-'TXT', uuid: 'B1DF9AAD-DE46-4147-A04A-7AE31EFD026E'
TS_ASSERT_LESS_THAN(${1:x}, ${2:y});
TXT

  tab 'alte', 'Assert Less Than Equals', <<-'TXT', uuid: '6EAEF1FF-A66F-449E-958C-E15878C864AF'
TS_ASSERT_LESS_THAN_EQUALS(${1:x}, ${2:y});
TXT

  tab 'ap', 'Assert Predicate', <<-'TXT', uuid: 'D2C9AD08-D194-4404-9898-1449EA7EA475'
TS_ASSERT_PREDICATE(${1:R}, ${2:x});
TXT

  tab 'ar', 'Assert Relation', <<-'TXT', uuid: '3581E22A-2210-41F5-A674-F2EA49B1B4C6'
TS_ASSERT_RELATION(${1:R}, ${2:x}, ${3:y});
TXT

  tab 'asd', 'Assert Same Data', <<-'TXT', uuid: '8F90962E-DD95-4F56-80A7-090CE1C4979A'
TS_ASSERT_SAME_DATA(${1:x}, ${2:y}, ${3:size});
TXT

  tab 'at', 'Assert Throws', <<-'TXT', uuid: '4C3263F1-7F3D-45B3-8FA6-5191F6194EB0'
TS_ASSERT_THROWS(${1:expr}, ${2:type});
TXT

  tab 'ata', 'Assert Throws Anything', <<-'TXT', uuid: '0B07D003-7EE7-42F2-AFE1-D7AAE5043822'
TS_ASSERT_THROWS_ANYTHING(${1:expr});
TXT

  tab 'ata', 'Assert Throws Assert', <<-'TXT', uuid: '7E2B5D3E-3D12-4CD8-A619-A07525D34654'
TS_ASSERT_THROWS_ASSERT(${1:expr}, ${2:arg}, ${3:assertion});
TXT

  tab 'ate', 'Assert Throws Equals', <<-'TXT', uuid: '0CFE4E16-2B9A-4608-A3D1-C6EE3D1191EF'
TS_ASSERT_THROWS_EQUALS(${1:expr}, ${2:arg}, ${3:x}, ${4:y});
TXT

  tab 'atn', 'Assert Throws Nothing', <<-'TXT', uuid: 'E59871F5-F8F1-4F11-8A8E-44006E70B554'
TS_ASSERT_THROWS_NOTHING(${1:expr});
TXT

  tab 'fail', 'Fail', <<-'TXT', uuid: 'E66F1C9C-EF5C-4D8E-99AC-90FA906F877E'
TS_FAIL(${2:"${1:Test not implemented}"});
TXT

  tab 'test', 'New Unit Test', <<-'TXT', scope: 'attr.test.cxxtest & source.c++, attr.test.cxxtest & source.objc++', uuid: 'AB0B0546-2007-4E5E-AE48-E3136821C560'
class ${TM_DISPLAYNAME/(?:t_)?(.*?)(\.(.+)|$)/${1/([^_]*)_?/\u$1/g}/}Tests : public CxxTest::TestSuite
{
public:
	void test_${1:${TM_DISPLAYNAME/(?:t_)?(.*?)(\.(.+)|$)/$1/}} ()
	{$0
	}
};

TXT

  tab 'trace', 'Trace', <<-'TXT', uuid: '6C9B6A78-A4CF-44E8-9192-B41AFDE748A4'
TS_TRACE(${1:errno});
TXT

  tab 'warn', 'Warn', <<-'TXT', uuid: '747DCDDB-5D40-414B-A908-47C353D79DB2'
TS_WARN(${2:"${1:TODO: Check invalid parameters}"});
TXT

end