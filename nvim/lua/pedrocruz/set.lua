vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.background = "dark"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.ttimeoutlen = 50

vim.env.TERM = "screen-256color"
vim.env.COLORTERM = "truecolor"

vim.opt.formatoptions = cro

-- Definir o tom de cinza que você deseja usar
local gray_color = "#5C6370" -- Defina a cor que você prefere

-- Ajustar as cores dos diagnósticos LSP para cinza
vim.cmd(string.format([[
  highlight DiagnosticError guifg=%s
  highlight DiagnosticWarn guifg=%s
  highlight DiagnosticInfo guifg=%s
  highlight DiagnosticHint guifg=%s
]], gray_color, gray_color, gray_color, gray_color))

