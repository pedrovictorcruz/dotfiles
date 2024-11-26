-- Definir o caminho para o lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Última versão estável
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Carregar os plugins usando o lazy.nvim
require("lazy").setup("pedrocruz.plugins")

