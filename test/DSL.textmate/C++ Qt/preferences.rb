# encoding: utf-8

preferences 'qmake Comments' => 'source.qmake' do
  shell_variable 'TM_COMMENT_START', '# '
  uuid "1252E454-CFC7-4FB1-80C3-33A267BFB3FF"
end

preferences 'qmake Completitions' => 'source.qmake' do
  completions %w(
    CONFIG DEFINES DEF_FILE DESTDIR DISTFILES DLLDESTDIR FORMS FORMS3 HEADERS
    INCLUDEPATH LEXSOURCES LIBS MOC_DIR OBJECTS_DIR RCC_DIR REQUIRES SOURCES SUBDIRS
    TARGET TEMPLATE TRANSLATIONS UI_DIR UI_HEADERS_DIR UI_SOURCES_DIR VERSION
    YACCSOURCES
  )
  uuid "8B8C14B7-9E15-448E-AE1B-BE87E6069F40"
end

preferences 'qmake Typing Pairs' => 'source.qmake' do
  smart_typing_pairs "\"\""
  uuid "2669156F-0951-4BF3-AD31-DC390F6B0632"
end

preferences 'C++ Qt Completitions' => 'source.c++.qt', file: 'Qt C++ Completitions' do
  completions %w(
    Q_CLASSINFO Q_ENUMS Q_FLAGS Q_INTERFACES Q_OBJECT Q_PROPERTY qobject_cast
    QAbstractItemDelegate QAbstractItemModel QAbstractItemView QAccessible QAction
    QApplication QButtonGroup QByteArray QCache QCheckBox QClipboard QColor
    QColorDialog QComboBox QCoreApplication QCursor QDataStream QDate QDateEdit
    QDateTime QDateTimeEdit QDesktopWidget QDial QDialog QDir QDomDocument QDomNode
    QDoubleSpinBox QFile QFileDialog QFlags QFocusFrame QFont QFontDialog QFrame
    QFtp QGLWidget QGraphicsScene QGraphicsView QGridLayout QGroupBox QHBoxLayout
    QHash QHeaderView QHttp QIcon QImage QInputDialog QItemDelegate QKeySequence
    QLCDNumber QLabel QLibrary QLibraryInfo QLineEdit QLinkedList QList QListView
    QListWidget QLocale QMainWindow QMap QMenu QMenuBar QMessageBox QModelIndex
    QMultiHash QMultiMap QMutex QObject QPainter QPalette QPen QPicture QPixmap
    QPluginLoader QPointer QPrinter QProcess QProgressBar QProgressDialog
    QPushButton QQueue QRadioButton QRegExp QResource QRubberBand QScrollArea QSet
    QSettings QSharedDataPointer QShortcut QSignalMapper QSlider QSound QSpinBox
    QSplashScreen QSplitter QSqlDatabase QSqlQuery QStack QStackedLayout
    QStackedWidget QStatusBar QString QStringList QStringListModel QTabBar
    QTabWidget QTableView QTableWidget QTemporaryFile QTextCursor QTextDocument
    QTextEdit QThread QThreadStorage QTime QTimeEdit QTimer QToolBar QToolBox
    QToolButton QToolTip QTranslator QTreeView QTreeWidget QUrl QVBoxLayout
    QValidator QVariant QVector QWhatsThis QWidget QWidgetAction QXmlSimpleReader
  )
  uuid "8BEB2DA8-C015-463B-929F-FAB4FAF17414"
end

preferences 'C++ Qt Folding' => 'source.c++.qt', file: 'Qt C++ Folding' do
  folding_start_marker %r'(?x)
     /\*\*(?!\*)
    |^(?![^{]*?//|[^{]*?/\*(?!.*?\*/.*?\{)).*?\{\s*($|//|/\*(?!.*?\*/.*\S))
  '
  folding_stop_marker %r'(?<!\*)\*\*/|^\s*\}'
  uuid "D64B58B1-E356-4A9B-A3F5-7296B518A2B8"
end

preferences 'C++ Qt Indentation Rules' => 'source.c++.qt', file: 'Qt C++ Indentation Rules' do
  decrease_indent_pattern %r!^(.*\*/)?\s*\}([^}{"']*\{)?[;\s]*$|^\s*((public|private|protected)(\s+slots)?|signals):\s*$!
  increase_indent_pattern %r/^.*\{[^}"']*$|^\s*((public|private|protected)(\s+slots)?|signals):\s*$/
  uuid "26796298-41FC-40F6-8B8F-D896A0EF2BDC"
end
