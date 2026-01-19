local builtin = require('telescope.builtin')

require('telescope').setup({
    pickers = {
        find_files = {
            theme = "dropdown",
            preview = false
        },
        buffers = {
            theme = "dropdown",
            preview = false
        },
        live_grep = {
            theme = "dropdown",
            preview = false
        }
    }
})

vim.keymap.set('n', '<leader>fd', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>en', function ()
    local opts = require('telescope.themes').get_dropdown({
        cwd = vim.fn.stdpath("config")
    })
    builtin.find_files {
        cwd = vim.fn.stdpath("config")
    }
end)
