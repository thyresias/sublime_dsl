# encoding: utf-8

snippets do

  default_scope 'source.python.django'
  file_format :textmate

  tab 'auto', 'AutoField', <<-'TXT', uuid: '5D4F70FB-4A51-41D4-B729-920F827E70D2', file: 'AutoField (auto)'
${1:FIELDNAME} = models.AutoField()
TXT

  tab 'boolean', 'BooleanField', <<-'TXT', uuid: '27531D3B-899B-4872-A16D-7275E4E91B02', file: 'BooleanField (boolean)'
${1:FIELDNAME} = models.BooleanField(${2:default=True})
TXT

  tab 'char', 'CharField', <<-'TXT', uuid: '97FCBFBC-BBEE-408B-BF5D-203D895FCFBA', file: 'CharField (char)'
${1:FIELDNAME} = models.CharField(${2:blank=True}, max_length=${3:100})
TXT

  tab 'commaseparatedinteger', 'CommaSeparatedIntegerField', <<-'TXT', uuid: '8FA6C6F3-4F38-4560-A565-39FB0C498B74', file: 'CommaSeparatedIntegerField (commaseparatedinteger)'
${1:FIELDNAME} = models.CommaSeparatedIntegerField(max_length=$2)
TXT

  tab 'date', 'DateField', <<-'TXT', uuid: '25D5C228-A652-421D-ACC1-924FC5FEBEBE', file: 'DateField (date)'
${1:FIELDNAME} = models.DateField(${2:default=datetime.datetime.today})
TXT

  tab 'datetime', 'DateTimeField', <<-'TXT', uuid: '2F382BC6-3AD6-4012-9663-DF2FD744B591'
${1:FIELDNAME} = models.DateTimeField(${2:blank=True}${3:, default=datetime.datetime.now})
TXT

  tab 'decimal', 'DecimalField', <<-'TXT', uuid: '0C28D967-6886-42A9-B74F-6E47C649962E'
${1:FIELDNAME} = models.DecimalField(max_digits=$2, decimal_places=$3)
TXT

  tab 'email', 'EmailField', <<-'TXT', uuid: '23AA908D-8DC6-4657-89A4-83214B85497D', file: 'EmailField (email)'
${1:FIELDNAME} = models.EmailField()
TXT

  tab 'file', 'FileField', <<-'TXT', uuid: 'CD1F651A-9D70-460B-A1AA-92E77908BA6A', file: 'FileField (file)'
${1:FIELDNAME} = models.FileField(upload_to=${1:/path/for/upload})
TXT

  tab 'filepath', 'FilePathField', <<-'TXT', uuid: 'D9BD861A-B03E-4765-92B2-55AE10067066', file: 'FilePathField (filepath)'
${1:FIELDNAME} = models.FilePathField(path="${1:/location/of/choices}"${2:, match="${3:regex}"}${4:, recursive=True})
TXT

  tab 'fk', 'ForeignKey', <<-'TXT', uuid: 'F497C0D3-812E-4339-8260-8D906337023B', file: 'ForeignKey (fk)'
${1:FIELDNAME} = models.ForeignKey(${2:RELATED_MODEL})
TXT

  tab 'float', 'FloatField', <<-'TXT', uuid: 'B2BDB25E-E626-443B-8B6D-2E09FD75876A', file: 'FloatField (float)'
${1:FIELDNAME} = models.FloatField()
TXT

  tab 'image', 'ImageField', <<-'TXT', uuid: '1E41208D-8E7E-42ED-A23C-376075EC6ADB', file: 'ImageField (image)'
${1:FIELDNAME} = models.ImageField(upload_to="${2:/dir/path}"${3:, height_field=$4}${5:, width_field=$6})
TXT

  tab 'integer', 'IntegerField', <<-'TXT', uuid: '636921D5-6D30-44DC-B49A-4188DF6A8477', file: 'IntegerField (integer)'
${1:FIELDNAME} = models.IntegerField(${2:blank=True, null=True})
TXT

  tab 'ipaddress', 'IPAddressField', <<-'TXT', uuid: '6C53B5EA-B8CD-4FC8-903B-1967FD9E421F', file: 'IPAddressField (ipaddress)'
${1:FIELDNAME} = models.IPAddressField(${2:blank=True})
TXT

  tab 'manytomany', 'ManyToManyField', <<-'TXT', uuid: '449AB31C-BAB7-4D30-AF04-6A070CBE4EF4', file: 'ManyToManyField (manytomany)'
${1:FIELDNAME} = models.ManyToManyField(${2:RELATED_MODEL})
TXT

  tab 'model', 'Model Skeleton', <<-'TXT', uuid: '311C17C5-A556-48D4-B91F-DD28BB0CF4E7', file: 'Model Skeleton (model)'
class ${1:Modelname}(models.Model):
	"""${2:($1 description)}"""
	$0

	class Admin:
		list_display = ('',)
		search_fields = ('',)

	def __unicode__(self):
		return u"$1"

TXT

  tab 'nullboolean', 'NullBooleanField', <<-'TXT', uuid: '21013818-A691-4E96-A889-70A0F2F28557', file: 'NullBooleanField (nullbool)'
${1:FIELDNAME} = models.NullBooleanField(${2:default=True})
TXT

  tab 'phonenumber', 'PhoneNumberField', <<-'TXT', uuid: '611E7330-56E2-4B20-A364-265666458121', file: 'PhoneNumberField (phonenumber)'
${1:FIELDNAME} = models.PhoneNumberField(${2:blank=True})
TXT

  tab 'positiveinteger', 'PositiveIntegerField', <<-'TXT', uuid: '4EFDEB25-E308-4708-9F2F-594582B5CCE0', file: 'PositiveIntegerField (posint)'
${1:FIELDNAME} = models.PositiveIntegerField(${2:blank=True, null=True})
TXT

  tab 'positivesmallinteger', 'PositiveSmallIntegerField', <<-'TXT', uuid: '9F2FB381-651B-420F-9835-0CADEA5DF7EF', file: 'PositiveSmallIntegerField (possmall)'
${1:FIELDNAME} = models.PositiveSmallIntegerField(${2:blank=True, null=True})
TXT

  tab 'sendmail', 'send_mail', <<-'TXT', uuid: '97AF7101-45AD-4286-8AA2-4F43E63EB452'
mail.send_mail("${1:Subject}", "${2:Message}", "${3:from@example.com}", ${4:["to@example.com"]}${5:, fail_silently=True})

TXT

  tab 'slug', 'SlugField', <<-'TXT', uuid: '8F14D580-0910-40DE-95B4-10825F3CD656', file: 'SlugField (slug)'
${1:slug} = models.SlugField(${2:prepopulate_from=("$3",$4)})
TXT

  tab 'smallinteger', 'SmallIntegerField', <<-'TXT', uuid: 'E9B61D15-B2CC-4202-9F2D-9AE2C09219BF', file: 'SmallIntegerField (smallinteger)'
${1:FIELDNAME} = models.SmallIntegerField(${2:blank=True, null=True})
TXT

  tab 'text', 'TextField', <<-'TXT', uuid: 'A15C10E8-4DC9-4C9B-A47E-A47F14663AFE', file: 'TextField (text)'
${1:FIELDNAME} = models.TextField(${2:blank=True})
TXT

  tab 'time', 'TimeField', <<-'TXT', uuid: '343CDE2F-C489-4437-B316-2881C5F1C854', file: 'TimeField (time)'
${1:FIELDNAME} = models.TimeField(${2:blank=True})
TXT

  tab 'url', 'URLField', <<-'TXT', uuid: '4D06CE4E-A856-4607-8D58-A03ED5EB90B1', file: 'URLField (url)'
${1:FIELDNAME} = models.URLField(${2:blank=True}, verify_exists=${3:True})
TXT

  tab 'usstate', 'USStateField', <<-'TXT', uuid: '2F2B9569-8D5D-423E-8B36-75C59BAE9FE4', file: 'USStateField (ussstate)'
${1:FIELDNAME} = models.USStateField(${2:blank=True})
TXT

  tab 'xml', 'XMLField', <<-'TXT', uuid: '0B31BBE8-B195-4164-B4F6-245803D21C30'
${1:FIELDNAME} = models.XMLField(schema_path=${2:/path/to/RelaxNG}${3:, blank=True})
TXT

end