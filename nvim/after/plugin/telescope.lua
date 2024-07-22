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

require('telescope').load_extension('file_browser')

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
vim.keymap.set('n', ';e', function()
    builtin.diagnostics()
end)

-- Mapeamento de tecla para abrir o file browser
vim.keymap.set('n', '<leader>fb', function()
    require('telescope').extensions.file_browser.file_browser({
        path = "%:p:h",                              -- Abre o file browser no diretório atual
        hidden = true,                               -- Mostrar arquivos ocultos
        respect_gitignore = true,                    -- Respeitar .gitignore
        file_ignore_patterns = file_ignore_patterns, -- Usar os padrões de arquivos ignorados
        previewer = false,
    })
end, {})
