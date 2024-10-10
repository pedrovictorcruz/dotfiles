vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
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
vim.cmd("highlight Normal guibg='#181818'")

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

vim.cmd(string.format([[
  highlight CmpItemAbbr guibg=NONE guifg=#A0A0A0
  highlight CmpItemAbbrMatch guibg=NONE guifg=#FFCC00
  highlight CmpItemAbbrMatchFuzzy guibg=NONE guifg=#FFCC00
  highlight CmpItemKind guibg=NONE guifg=#A0A0A0
  highlight CmpItemMenu guibg=NONE guifg=#A0A0A0
  highlight CmpItemSelected guibg=#3d3d3d guifg=#FFFFFF
]]))

vim.opt.path:append("**")
vim.opt.wildignore:append("*/node_modules/*,*/build/*,*/dist/*")

vim.o.wildmenu = true
vim.o.wildmode = "longest,full"
vim.o.wildoptions = ""
vim.o.pumblend = 0
vim.o.completeopt = "menu,menuone,noselect"
