local file_ignore_patterns = {
    "yarn%.lock",
    "node_modules/",
    "raycast/",
    "dist/",
    "%.next",
    "%.git/",
    "%.gitlab/",
    "build/",
    "target/",
    "package%-lock%.json",
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({
        file_ignore_patterns = file_ignore_patterns,
    })
end, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.live_grep({
        file_ignore_patterns = file_ignore_patterns,
    })
end, {})
