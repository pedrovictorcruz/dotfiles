local fff = require('fff')

fff.setup({
    prompt = '> ',
    preview = {
      enabled = false,
    },
    keymaps = {
      close = {'<Esc>', '<C-c>' },
      select = '<CR>',
      select_split = '<C-s>',
      select_vsplit = '<C-v>',
      select_tab = '<C-t>',
      move_up = { '<Up>', '<C-p>' },
      move_down = { '<Down>', '<C-n>' },
    },
})


vim.keymap.set("n", "<leader>fd", function()
	fff.find_files()
end, {})
