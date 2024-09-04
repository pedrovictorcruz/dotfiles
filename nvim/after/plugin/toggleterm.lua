local toggleterm = require('toggleterm')
local Terminal   = require('toggleterm.terminal').Terminal

toggleterm.setup({})

vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>:ToggleTerm<CR>", { noremap = true, silent = true })
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
