vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

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

vim.keymap.set("n", "<leader>fd", ":E ", { noremap = true })
