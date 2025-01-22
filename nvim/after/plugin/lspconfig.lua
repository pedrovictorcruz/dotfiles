-- Configurar clangd (C/C++)
require'lspconfig'.clangd.setup{}

-- Configurar ts_ls (TS)
require'lspconfig'.ts_ls.setup{}

-- Setup pyright (python)
require'lspconfig'.pyright.setup{}

-- Setup kotlin-language-server
require'lspconfig'.kotlin_language_server.setup{
    cmd = {
        os.getenv 'HOME' .. '/development/kotlin-language-server/server/build/install/server/bin/kotlin-language-server',
    },
}

-- Setup zls (zig)
require'lspconfig'.zls.setup{
    cmd = { '/usr/local/bin/zls' }
}

-- Setup gopls (go)
require'lspconfig'.gopls.setup{
    settings = {
        gopls = {
            gofumpt = true
        }
    }
}

-- Exibir mensagens de erro na linha
vim.diagnostic.config({
  virtual_text = true, -- Mostrar o erro diretamente no código
  signs = true,        -- Mostrar sinais na lateral da linha (como "X")
  underline = false,    -- Sublinha a parte do código com erro
})

-- Customize diagnostic colors
vim.cmd [[
    highlight DiagnosticError guifg=gray ctermfg=gray
    highlight DiagnosticWarn guifg=gray ctermfg=gray
    highlight DiagnosticInfo guifg=gray ctermfg=gray
    highlight DiagnosticHint guifg=gray ctermfg=gray
]]

vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { noremap = true, silent = true })
-- Mapeamento para mostrar assinatura de função com 'K'
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })

vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
vim.keymap.set("n", "<leader>D", function() vim.lsp.buf.type_definition() end, opts)

-- Mapeamento para formatar o código com '<leader>f'
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { noremap = true, silent = true })

-- Mapeamento para mostrar os erros da linha com 'vd'
vim.keymap.set('n', 'vd', vim.diagnostic.open_float, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
