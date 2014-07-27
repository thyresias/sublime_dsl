# encoding: utf-8

snippets do

  default_scope 'meta.bullet-point'
  file_format :textmate

  # FIXME: illegal XML character "\u0003" replaced by 'ETX'
  key "ETX", 'Continue Bullet', "\n• ", uuid: 'C30BA263-B10E-11D9-9975-000D93589AF6', file: 'Conitnue bullet'

  # FIXME: illegal XML character "\u0003" replaced by 'ETX'
  key "ETX", 'Continue Light Bullet', "\n· ", scope: 'meta.bullet-point.light', uuid: 'EA149DAB-B10E-11D9-9975-000D93589AF6', file: 'Conitnue light bullet'

  # FIXME: illegal XML character "\u0003" replaced by 'ETX'
  key "ETX", 'Continue Star Bullet', "\n* ", scope: 'meta.bullet-point.star', uuid: 'B5E22191-B151-11D9-85C9-000D93589AF6', file: 'Conitnue star bullet'

  # FIXME: missing scope, will be default_scope
  tab 'c)', 'Copyright Notice', "(c) Copyright `date +%Y` $TM_FULLNAME. All Rights Reserved. ", uuid: 'BC8B89E4-5F16-11D9-B9C3-000D93589AF6', file: '010 Copyright'

  # FIXME: missing scope, will be default_scope
  tab 'isoD', 'Current Date — YYYY-MM-DD', <<-'TXT', uuid: 'C9CAF012-6E50-11D9-AA12-000D93589AF6', file: 'Insert ISO date'
`date +%Y-%m-%d`
TXT

  # FIXME: missing scope, will be default_scope
  tab 'lorem', 'Lorem ipsum', <<-'TXT', uuid: 'BA9A2B17-DA89-49A5-809B-AC7510C24625'
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
TXT

end