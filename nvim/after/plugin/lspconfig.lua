-- Configurar clangd (C/C++)
require'lspconfig'.clangd.setup{}

-- Configurar ts_ls (TS)
require'lspconfig'.ts_ls.setup{}

-- Exibir mensagens de erro na linha
vim.diagnostic.config({
  virtual_text = false, -- Mostrar o erro diretamente no código
  signs = true,        -- Mostrar sinais na lateral da linha (como "X")
  underline = false,    -- Sublinha a parte do código com erro
})

-- Configurar nvim-cmp para funcionar apenas com LSP
local cmp = require'cmp'

cmp.setup({
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Remova o atalho padrão
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Seleciona o primeiro item de sugestão com Enter
  },
  sources = {
    { name = 'nvim_lsp' }, -- Apenas LSP source
  }
})

vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { noremap = true, silent = true })
-- Mapeamento para mostrar assinatura de função com 'K'
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })

vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

-- Mapeamento para formatar o código com '<leader>f'
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { noremap = true, silent = true })

-- Mapeamento para mostrar os erros da linha com 'vd'
vim.keymap.set('n', 'vd', vim.diagnostic.open_float, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
