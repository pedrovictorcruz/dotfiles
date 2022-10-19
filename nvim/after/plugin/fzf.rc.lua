local status, fzf = pcall(require, "fzf-lua")
if (not status) then return end

fzf.setup {
  fzf_opts = { ['--layout'] = 'reverse-list' },
  cmd = "git grep --line-number --column --color=always"
}

vim.api.nvim_set_keymap('n', '<c-P>',
  "<cmd>lua require('fzf-lua').files()<CR>",
  { noremap = true, silent = true })
