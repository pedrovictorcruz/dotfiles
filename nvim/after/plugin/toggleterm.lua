local toggleterm = require('toggleterm')
local Terminal   = require('toggleterm.terminal').Terminal
local lazygit    = Terminal:new({ cmd = "lazygit", hidden = true })

toggleterm.setup {

}

function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>:ToggleTerm<CR>", { noremap = true, silent = true })
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
