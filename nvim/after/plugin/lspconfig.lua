vim.lsp.config('lua_ls', {
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

-- Servidores sem configurações personalizadas podem ser simplesmente habilitados
-- usando vim.lsp.enable().
vim.lsp.enable({ 'csharp_ls', 'ts_ls', 'gopls', 'kotlin_language_server', 'pyright', 'zls' })

-- O util.root_pattern do lspconfig também pode ser substituído por vim.lsp.root_pattern.
vim.lsp.config('clangd', {
	cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
	filetypes = { "c", "cpp" },
    root_markers = { '.clangd', 'compile_commands.json' },
})

-- Habilitar clangd
vim.lsp.enable({ 'clangd' })

-- A configuração do tailwindcss precisa ser feita usando vim.lsp.config.
vim.lsp.config('tailwindcss', {
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

-- Habilitar tailwindcss
vim.lsp.enable({ 'tailwindcss' })

-- Gerenciamento de Keymaps com autocmd
-- O 'on_attach' foi substituído por um autocmd que é disparado quando
-- um servidor LSP se anexa a um buffer. Isso garante que os keymaps
-- sejam definidos apenas quando um LSP estiver disponível.
local on_attach = function(client, bufnr)
	-- Keymaps
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, noremap = true, silent = true })
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, { buffer = bufnr })
	vim.keymap.set("n", "gr", function()
		require('telescope.builtin').lsp_references()
	end, { buffer = bufnr })
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, { buffer = bufnr })
end

-- Associa o autocmd a todos os servidores
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		on_attach(client, bufnr)
	end
})

