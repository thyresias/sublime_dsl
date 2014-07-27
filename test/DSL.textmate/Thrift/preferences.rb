# encoding: utf-8

preferences 'Folding' => 'source.thrift' do
  folding_start_marker %r/\{\s*$/
  folding_stop_marker %r/^\s*\}/
  uuid "208DF397-F82E-41FA-AA3A-458EBDFA12C6"
end

preferences 'Symbol List: enum' => 'entity.name.enum.thrift' do
  show_in_symbol_list true
  symbol_transformation "s/^/enum /"
  uuid "6D3EADC1-CF25-4897-AA50-F250B1627EA1"
end

preferences 'Symbol List: exception' => 'entity.name.exception.thrift' do
  show_in_symbol_list true
  symbol_transformation "s/^/exception /"
  uuid "D7334D6A-DA82-428A-8425-0C9AC0D9969F"
end

preferences 'Symbol List: function' => 'entity.name.function.thrift' do
  show_in_symbol_list true
  symbol_transformation "s/^/  /"
  uuid "22F4E4F0-E729-4538-9954-68456E915A2E"
end

preferences 'Symbol List: senum' => 'entity.name.senum.thrift' do
  show_in_symbol_list true
  symbol_transformation "s/^/senum /"
  uuid "497C774E-4491-41D7-BE69-A0C23D8EE5D2"
end

preferences 'Symbol List: service' => 'entity.name.service.thrift' do
  show_in_symbol_list true
  symbol_transformation "s/^/service /"
  uuid "8825DD7F-9C98-474B-9242-C5406DB241F7"
end

preferences 'Symbol List: struct' => 'entity.name.struct.thrift' do
  show_in_symbol_list true
  symbol_transformation "s/^/struct /"
  uuid "B8D168EA-2ACF-4221-8DA8-FD7E6D620739"
end
