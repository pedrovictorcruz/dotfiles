-- Configurar clangd (C/C++)
require'lspconfig'.clangd.setup{}

-- Configurar ts_ls (TS)
require'lspconfig'.ts_ls.setup{}

-- Exibir mensagens de erro na linha
vim.diagnostic.config({
  virtual_text = true, -- Mostrar o erro diretamente no código
  signs = true,        -- Mostrar sinais na lateral da linha (como "X")
  underline = false,    -- Sublinha a parte do código com erro
})

-- Configurar nvim-cmp para funcionar apenas com LSP
local cmp = require'cmp'

cmp.setup({
  mapping = {
    -- Mapeamento para mover para cima com Ctrl+P
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    -- Mapeamento para mover para baixo com Ctrl+N
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Mapeamento para aceitar a sugestão com Ctrl+Y
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    -- Mapeamento para ativar o autocompletar manualmente com Ctrl+Space
    ['<C-Space>'] = cmp.mapping.complete(),
    -- Fechar o menu com Ctrl+E
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
  },
  sources = {
    { name = 'nvim_lsp' }, -- Apenas LSP source
  },
  completion = {
    autocomplete = false,
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
