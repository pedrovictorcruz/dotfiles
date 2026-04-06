vim.g.barbar_auto_setup = false

require('barbar').setup({
    animation = false,
    auto_hide = false,
    tabpages = true,
    clickable = true,
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
