# encoding: utf-8

commands 'Vintage' do

  item ':w - Save', save
  item ':e - Revert', revert
  item ':0 - BOF', move_to("bof")
  item ':$ - EOF', move_to("eof")

end
