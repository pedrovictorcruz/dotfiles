local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fd', builtin.git_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope grep string' })
vim.keymap.set('n', '<leader>fl', builtin.lsp_document_symbols, { desc = 'Telescope document symbols' })
