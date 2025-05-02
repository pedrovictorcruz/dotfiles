local lspconfig = require("lspconfig")

-- LSP
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

lspconfig.csharp_ls.setup({})
lspconfig.ts_ls.setup({})
lspconfig.gopls.setup({})
lspconfig.kotlin_language_server.setup({})
lspconfig.tailwindcss.setup({
	filetypes = {
		"javascript",
		"typescript",
		"typescriptreact",
		"javascriptreact",
		"typescript.tsx",
		"javascript.jsx",
		"html",
	},
})
lspconfig.pyright.setup({})
lspconfig.clangd.setup({
	cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
})
lspconfig.zls.setup({})

-- Keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, {})
vim.keymap.set("n", "gr", function()
	require('telescope.builtin').lsp_references()
end, {})

vim.keymap.set("n", "<leader>vrn", function()
	vim.lsp.buf.rename()
end, {})
