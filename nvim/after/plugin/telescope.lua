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
    "vendor/",
}

local builtin = require('telescope.builtin')

require('telescope').load_extension('file_browser')

vim.keymap.set('n', '<C-p>', function()
    builtin.find_files({
        file_ignore_patterns = file_ignore_patterns,
        previewer = false,
        hidden = true,                               -- Mostrar arquivos ocultos
        respect_gitignore = false,                    -- Respeitar .gitignore
        file_ignore_patterns = file_ignore_patterns, -- Usar os padrões de arquivos ignorados
    })
end, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.live_grep({
        file_ignore_patterns = file_ignore_patterns,
        previewer = false,
        hidden = true,                               -- Mostrar arquivos ocultos
        respect_gitignore = false,                    -- Respeitar .gitignore
    })
end, {})
vim.keymap.set('n', ';e', function()
    builtin.diagnostics()
end)

-- Mapeamento de tecla para abrir o file browser
vim.keymap.set('n', '<leader>pv', function()
    require('telescope').extensions.file_browser.file_browser({
        path = "%:p:h",                              -- Abre o file browser no diretório atual
        hidden = true,                               -- Mostrar arquivos ocultos
        respect_gitignore = false,                    -- Respeitar .gitignore
        previewer = false,
    })
end, {})
