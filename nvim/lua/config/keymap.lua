vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    -- lcd to the directory of the current file
    vim.cmd("silent! lcd " .. vim.fn.expand("%:p:h"))
  end,
})

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = "grep",
  callback = function()
    vim.cmd("copen")
  end,
})

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "fugitive://*",
	callback = function()
		vim.cmd("only")
	end,
})

vim.keymap.set("n", "<A-c>", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Tab>", ":bn<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

