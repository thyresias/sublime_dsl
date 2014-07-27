# encoding: utf-8

menu 'Main' do

  item '&Edit', id: 'edit' do
    item '-', id: 'clipboard'
    item '&Cut', clipboard_manager_cut
    item 'Copy', clipboard_manager_copy, mnemonic: 'n'
    item paste, mnemonic: 'P'
    item paste_and_indent, mnemonic: 'I'
    item 'Clipboard History' do
      item 'Next && Paste', clipboard_manager_next_and_paste
      item 'Previous && Paste', clipboard_manager_previous_and_paste
      item 'Next', clipboard_manager_next
      item 'Previous', clipboard_manager_previous
      item 'Choose && Paste', clipboard_manager_choose_and_paste
      item 'Show History', clipboard_manager_show
      item 'Show Registers', clipboard_manager_show_registers
    end
    item '-'
  end

end
