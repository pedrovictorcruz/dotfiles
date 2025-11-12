vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"tailwindcss",
	"html",
	"jsonls",
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end)
    end
  end,
})

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
	underline = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	},
	update_in_insert = false,
	severity_sort = true,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"javascript",
		"javascriptreact",
		"javascript.jsx",
	},
	callback = function(args)
		local buf = args.buf
		local bufname = vim.api.nvim_buf_get_name(buf)

		-- Check for Node/TS
		local node_root = vim.fs.find({ "tsconfig.json", "jsconfig.json" }, { upward = true, path = bufname })[1]
		if node_root then
			vim.lsp.enable("ts_ls", { bufnr = buf })
			return
		end
	end,
})
