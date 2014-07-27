# encoding: utf-8

snippets do

  default_scope 'source.c++.qt'
  file_format :textmate

  key "\n", 'Block Comment Newline', "\n* ", scope: 'source.c++.qt comment.block.c', uuid: '9CD2DCE1-C4FE-46CF-BE35-D38041740C5D'

  tab '/*', 'Block Comment', <<-'TXT', uuid: '2FC991AF-86B9-4227-838A-30164B4923A1'
/*
 * $0
 */
TXT

  tab 'con', 'connect', <<-'TXT', uuid: '8D9D10AE-0531-11DB-8509-0011242E4184'
connect( ${1:sender}, SIGNAL(${2:signal}(${3})), ${4:reciever}, ${5:SLOT}(${6:slot}($3)) );$0
TXT

  tab 'debug', 'qDebug', <<-'TXT', uuid: 'DDDE4415-9B12-4F03-81CE-CB9ACA62CFD2'
qDebug() << $1;
TXT

  tab 'dis', 'disconnect', <<-'TXT', uuid: '48A79C21-0832-11DB-9495-0011242E4184'
disconnect( ${1:sender}, SIGNAL(${2:signal}(${3})), ${4:reciever}, ${5:SLOT}(${6:slot}($3)) );$0
TXT

  tab 'fe', 'foreach', "foreach( ${1:variable}, ${2:container} )\n{\n\t${3:doSomething();} \n}$0", uuid: '90F2231F-959B-4CA7-9CAF-7165E5160D04'

  tab 'latin', 'toLatin1().data()', <<-'TXT', uuid: '9CC7A8E5-1EDD-4795-A1A9-3432D535F4C4', file: 'toLatin1().data() (latin)'
toLatin1().data()
TXT

  tab 'qmain', 'main()', <<-'TXT', uuid: '1BE36C25-5F22-45EE-9339-C0A3D1EACEA2', file: 'main (qmain)'
#include <QApplication>

int main (int argc, char *argv[])
{
	QApplication app(argc, argv);
	$0
	return app.exec();
}
TXT

  tab 'qp', 'Q_PROPERTY', <<-'TXT', uuid: '204E5213-CAF7-47FD-B272-34997632832D'
Q_PROPERTY( ${1:type} ${2:name} READ ${3:$2} ${4:WRITE ${5:${2/.*/set\u$0/}} ${6:RESET ${7:${2/.*/reset\u$0/}} DESIGNABLE ${8:true} SCRIPTABLE ${9:true} STORED ${10:true} }})$0
TXT

  tab 'qSort', 'qSort(...)', <<-'TXT', uuid: 'D05EDFB2-D456-420B-87EB-BD4CBEDAA58E', file: 'qSort(___)'
qSort(${1:list}.begin(), ${1}.end())
TXT

  tab 'singleShot', 'QTimer::singleShot(...)', <<-'TXT', uuid: '466A5E55-F2E9-4542-8CE7-5799B4DC9BF8', file: 'QTimer˸˸singleShot(___)'
QTimer::singleShot(${1:0}, ${2:this}, SLOT(${3:slotName()}))
TXT

  tab 'stub', 'qmake Project template stub', <<-'TXT', scope: 'source.qmake', uuid: 'C129BDA0-E887-4404-B8B5-3F6086468A5E'
TEMPLATE = app
CONFIG += qt
QT += gui
SOURCES += ${1:main.cpp}

windows {
	# otherwise we would get 'unresolved external _WinMainCRTStartup'
	# when compiling with MSVC
	MOC_DIR     = _moc
	OBJECTS_DIR = _obj
	UI_DIR      = _ui
	RCC_DIR     = _rcc
}
!windows {
	MOC_DIR     = .moc
	OBJECTS_DIR = .obj
	UI_DIR      = .ui
	RCC_DIR     = .rcc
}

$0
TXT

  tab 'utf8', 'toUtf8().data()', <<-'TXT', uuid: '84CF7C01-9208-453D-8254-DCD17D0A7500', file: 'toUtf8()_data()'
toUtf8().data()
TXT

  tab 'warn', 'qWarning(...)', <<-'TXT', uuid: '611BEDBC-30B4-4019-B29C-A91ECD480051', file: 'qWarning (warn)'
qWarning("$1"${1/[^%]*(%)?.*/(?1:, :\);)/}$2${1/[^%]*(%)?.*/(?1:\);)/}
TXT

end