# encoding: utf-8

snippets do

  default_scope 'source.dot'
  file_format :textmate

  tab '>', '-> (convert ">" to "->")', "-> ", uuid: 'C903C77B-C726-47E1-8FB2-9F90DFE6B763'

  tab 'dir', 'PROPerty [dir =both…]', <<-'TXT', uuid: '612DF1E1-034E-4925-8E78-3EE2E2EDDA90', file: 'PROPerty [dir =both]'
[dir=${1|back,both,forward,none|}]
TXT

  tab 'graph', 'Graph Template', <<-'TXT', uuid: 'AD2AB606-D634-4DFD-9BDA-A53CD235E1C4', file: 'graph template'
digraph G {
	splines="FALSE";
	/* Entities */
	${1:shortName}  [label="${2:$1}", shape="${3|square,rectangle,circle,ellipse,triangle,plaintext,point,diamond,pentagon,hexagon,septagon,octagon,egg,trapezium,parallelogram,house,doublecircle,doubleoctagon,tripleoctagon,invtriangle,invtrapezium,invhouse,Mdiamond,Msquare,Mcircle,none,note,tab,folder,box3d|}"${4:, URL="${5:http://en.wikipedia.org/wiki/John de Fries}"}]
  var$0

	/* Relationships */
	${6:F1} > $1${7:[label="${8:.63}"]}
	/* Ranks */
	{ rank=${9|same,min,max,# max is bottom|}; $1;};
}

TXT

  tab 'path', 'Path from -> to [label)', <<-'TXT', uuid: 'B7D66242-840C-473F-8546-33D6947AEFA7', file: 'path (from -˃ to [label)'
${1:From} -> ${2:too} [label="${3:.7}";]
TXT

  tab 'path', 'Path from-> {to list}', <<-'TXT', uuid: '1D4DF823-1CE3-4011-87AB-04958905098B', file: 'path a-˃ {b c d}'
${1:From} -> {${2:item1} ${3:item2} $0}
TXT

  tab 'prop', 'PROPerty [shape=box]', <<-'TXT', uuid: '5A1C3792-81BA-413D-AB43-9DED29F22E18'
[shape=box]
TXT

  tab 'prop', 'PROPerty [styles...]', <<-'TXT', uuid: 'CC54EBCC-8BE6-4105-931B-999242396406', file: 'PROPerty [styles___]'
[style=dotted; color=red; style=bold,label="100 times"; weight=8]
TXT

  tab 'rank', '{rank=same|min|max; x; y}', <<-'TXT', uuid: 'F1E71422-DE57-48AF-A95A-8C30632299C2'
{rank=${1|same,min,max,nb:max is bottom|}; ${2:space delimitted list}};


TXT

  tab 'var', 'New variable', <<-'TXT', uuid: 'CA31A932-3D52-4AC8-B132-005BE95E680F', file: 'new variable'
${1:shortName}  [label="${2:$1}", shape="${3|square,rectangle,circle,ellipse,triangle,plaintext,point,diamond,pentagon,hexagon,septagon,octagon,egg,trapezium,parallelogram,house,doublecircle,doubleoctagon,tripleoctagon,invtriangle,invtrapezium,invhouse,Mdiamond,Msquare,Mcircle,none,note,tab,folder,box3d|}"${4:, URL="${5:http://en.wikipedia.org/wiki/John de Fries}"}]
var$0

TXT

  tab 'var', 'New variable [plaintext]', <<-'TXT', uuid: '351180F5-0F3D-4486-A04E-0788FD7C4803', file: 'PROPerty [plaintext]'
"${1:Machine: a}" [ shape = plaintext ];
TXT

end