# encoding: utf-8

snippets do

  default_scope 'source.js.mootools'
  file_format :textmate

  tab 'fx', 'Fx.Elements', <<-'TXT', uuid: 'B03348DD-8BE9-43D6-9559-1F34DCAD311C', file: 'Fx_Elements'
Fx.Elements(${1:\$\$(${2:'${3:element}'})}${4:, {$0\}});
TXT

  tab 'fx', 'Fx.Height', "Fx.Height(${1:\\$(${2:'${3:element}'})}${4:, {$0\\}});\t", uuid: 'DB1C40E5-2A12-4D8B-AC14-108F616DEC07', file: 'Fx_Height'

  tab 'fx', 'Fx.Opacity', "Fx.Opacity(${1:\\$(${2:'${3:element}'})}${4:, {$0\\}});\t", uuid: 'E85EE815-2CF4-453D-ACF0-545BEA08A3F4', file: 'Fx_Opacity'

  tab 'fx', 'Fx.Scroll', <<-'TXT', uuid: '58D90ABD-8242-4D82-A1EC-E99F90703041', file: 'Fx_Scroll'
Fx.Scroll(${1:\$(${2:'${3:element}'})});
TXT

  tab 'fx', 'Fx.Slide', "Fx.Slide(${1:\\$(${2:'${3:element}'})}${4:, {$0\\}});\t", uuid: 'BE4FD7CC-98B9-4C2A-BF2D-21D027DA5F9C', file: 'Fx_Slide'

  tab 'fx', 'Fx.Style', "Fx.Style(${1:\\$(${2:'${3:element}'})}, '${4:selector}'${5:, {$0\\}});\t", uuid: '485344E1-960C-4BE9-99FB-80CB36874256', file: 'Fx_Style'

  tab 'fx', 'Fx.Styles', "Fx.Styles(${1:\\$(${2:'${3:element}'})}${4:, {$0\\}});\t", uuid: '2C8138F2-5322-474F-8234-059CBB1791BA', file: 'Fx_Styles'

  tab 'fx', 'Fx.Width', "Fx.Width(${1:\\$(${2:'${3:element}'})}${4:, {$0\\}});\t", uuid: '776B6CA4-1D3D-466C-BC8C-E2DC2BEBC7EF', file: 'Fx_Width'

  tab 'transition:', 'backIn', <<-'TXT', uuid: '7FE3ECEC-347D-4CA0-93FC-1A2871C7E508'
transition: Fx.Transitions.backIn
TXT

  tab 'transition:', 'backInOut', <<-'TXT', uuid: 'DDE1DFB9-519B-4880-83C9-89CE25656034'
transition: Fx.Transitions.backInOut
TXT

  tab 'transition:', 'backOut', <<-'TXT', uuid: 'DF0061A6-CC91-4C04-9569-73682F3A23A8'
transition: Fx.Transitions.backOut
TXT

  tab 'transition:', 'bounceIn', <<-'TXT', uuid: '2A36430D-BB4E-465E-8309-1F9AE6416236'
transition: Fx.Transitions.bounceIn
TXT

  tab 'transition:', 'bounceInOut', <<-'TXT', uuid: '4950A38E-7EEC-4C58-AC8B-1D7AD92DB305'
transition: Fx.Transitions.bounceInOut
TXT

  tab 'transition:', 'bounceOut', <<-'TXT', uuid: 'DB7F73A5-0EB4-401B-9F23-055023AED2CD'
transition: Fx.Transitions.bounceOut
TXT

  tab 'transition:', 'circIn', <<-'TXT', uuid: '0990F415-8F3A-40D9-890B-560AD9822E5B'
transition: Fx.Transitions.circIn
TXT

  tab 'transition:', 'circInOut', <<-'TXT', uuid: '5EF0B236-3E8A-44F8-8AAE-890ADC65D5E7'
transition: Fx.Transitions.circInOut
TXT

  tab 'transition:', 'circOut', <<-'TXT', uuid: '5D3768A4-7C18-4069-93B3-B2AA2718AF14'
transition: Fx.Transitions.circOut
TXT

  tab 'transition:', 'cubicIn', <<-'TXT', uuid: '90532BF2-4229-43FA-9734-A0FC4631C9E7'
transition: Fx.Transitions.cubicIn
TXT

  tab 'transition:', 'cubicInOut', <<-'TXT', uuid: 'D5CE57D6-C40D-432D-80C3-807E31C6F4BB'
transition: Fx.Transitions.cubicInOut
TXT

  tab 'transition:', 'cubicOut', <<-'TXT', uuid: '93896616-4E82-4592-92FD-056BF367BD37'
transition: Fx.Transitions.cubicOut
TXT

  tab 'transition:', 'elasticIn', <<-'TXT', uuid: '5349D291-8530-40CE-BC9B-904B6194D451'
transition: Fx.Transitions.elasticIn
TXT

  tab 'transition:', 'elasticInOut', <<-'TXT', uuid: 'E10724D3-5665-4EEC-999A-EE12E321336F'
transition: Fx.Transitions.elasticInOut
TXT

  tab 'transition:', 'elasticOut', <<-'TXT', uuid: '666D0D1C-E5DF-4A5A-97AA-4D7B497772DC'
transition: Fx.Transitions.elasticOut
TXT

  tab 'transition:', 'expoIn', <<-'TXT', uuid: 'D161FF03-6E1C-46B1-A823-BAD48FF83374'
transition: Fx.Transitions.expoIn
TXT

  tab 'transition:', 'expoInOut', <<-'TXT', uuid: '8E0C6932-96FF-4CBE-B340-3CCFAA46763B'
transition: Fx.Transitions.expoInOut
TXT

  tab 'transition:', 'expoOut', <<-'TXT', uuid: '8E4D61A0-9609-434F-BB81-7556B2EBAFAB'
transition: Fx.Transitions.expoOut
TXT

  tab 'transition:', 'linear', <<-'TXT', uuid: 'B8D7A21D-12A9-42F8-AF11-8CF388E425BE', file: 'Transitions_linear'
transition: Fx.Transitions.linear
TXT

  tab 'transition:', 'quadIn', <<-'TXT', uuid: 'F6641981-5B7D-4810-A5FB-A3C2BD9EFE0B'
transition: Fx.Transitions.quadIn
TXT

  tab 'transition:', 'quadInOut', <<-'TXT', uuid: '535CD352-CA15-4155-9EB8-F187356E29EA'
transition: Fx.Transitions.quadInOut
TXT

  tab 'transition:', 'quadOut', <<-'TXT', uuid: '3252CF74-988F-42E9-A8C8-0E1C3517A042'
transition: Fx.Transitions.quadOut
TXT

  tab 'transition:', 'quartIn', <<-'TXT', uuid: 'D8B0A671-EDC2-4D3B-B7B7-29E6B421BC84'
transition: Fx.Transitions.quartIn
TXT

  tab 'transition:', 'quartInOut', <<-'TXT', uuid: 'A3196EB1-B460-4871-B7B5-EE1599DE75A3'
transition: Fx.Transitions.quartInOut
TXT

  tab 'transition:', 'quartOut', <<-'TXT', uuid: 'B6D86ADE-5FAF-4AC0-BE67-D689D2A42EDA'
transition: Fx.Transitions.quartOut
TXT

  tab 'transition:', 'quintIn', <<-'TXT', uuid: '17097888-BAB8-4F71-AFB0-19F5051BEE99'
transition: Fx.Transitions.quintIn
TXT

  tab 'transition:', 'quintInOut', <<-'TXT', uuid: '4605A0F2-CA21-46E5-B39D-A2AA54B361BA'
transition: Fx.Transitions.quintInOut
TXT

  tab 'transition:', 'quintOut', <<-'TXT', uuid: 'BF1E9F12-70E4-490B-BC9A-C5AAC399E60C'
transition: Fx.Transitions.quintOut
TXT

  tab 'transition:', 'sineIn', <<-'TXT', uuid: '1479EAD6-3580-46E2-95C8-CF8CB8FAC6AD'
transition: Fx.Transitions.sineIn
TXT

  tab 'transition:', 'sineInOut', <<-'TXT', uuid: '6C15C8CA-C6E2-486B-8FF8-18FCB6CE9B58'
transition: Fx.Transitions.sineInOut
TXT

  tab 'transition:', 'sineOut', <<-'TXT', uuid: 'E5DC60EA-2E9B-48DB-8050-7486BA71BF74'
transition: Fx.Transitions.sineOut
TXT

  tab '{', 'Fx.Base Options', <<-'TXT', scope: 'source.js.mootools variable.parameter.fx', uuid: 'CBD9B971-9B81-4A8B-9E8A-EBBBEB127762', file: 'Fx_Base Options'
{
	${1:onStart: ${2:function},
	}${3:onComplete: ${4:function},
	}${5:duration: ${6:value},
	}${7:unit: ${8:value},
	}${9:wait: ${10:false},
	}${11:fps: ${12:30},
	}${13:transition:$0}

TXT

  tab '{', 'Fx.Slide Options', <<-'TXT', scope: 'source.js.mootools variable.parameter.fx.slide', uuid: '6F4E81A4-409C-4368-9699-24AD2ECD0C18', file: 'Fx_Slide Options'
{
	${1:onStart: ${2:function},
	}${3:onComplete: ${4:function},
	}${5:duration: ${6:value},
	}${7:unit: ${8:value},
	}${9:wait: ${10:false},
	}${11:fps: ${12:30},
	}${13:mode: ${14:vertical}
	}${15:transition:$0}
}
TXT

end