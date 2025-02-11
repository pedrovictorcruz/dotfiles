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

lspconfig.ts_ls.setup({})
lspconfig.gopls.setup({})
lspconfig.kotlin_language_server.setup({})
lspconfig.sqlls.setup({})
lspconfig.pyright.setup({})
lspconfig.clangd.setup({
	cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=never" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
})

-- Keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, {})

vim.keymap.set("n", "<leader>vrn", function()
	vim.lsp.buf.rename()
end, {})
