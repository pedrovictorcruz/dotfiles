local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fd', builtin.find_files, { desc = 'Telescope find files' })
