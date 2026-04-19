local capabilities = require("blink.cmp").get_lsp_capabilities()
local telescope_builtin = require("telescope.builtin")
local entry_display = require("telescope.pickers.entry_display")

local lsp_location_displayer = entry_display.create({
	separator = "",
	items = {
		{ width = 10 },
		{ remaining = true },
		{ remaining = true },
	},
})

local function tail_path(path, max_len)
	max_len = max_len or 60
	if #path <= max_len then
		return path
	end

	return "..." .. path:sub(-(max_len - 3))
end

local function split_dir_and_file(path)
	local dir, file = path:match("^(.*[/\\])(.-)$")
	if not dir then
		return "", path
	end

	return dir, file
end

local function lsp_location_entry(entry)
	local filename = entry.filename
	if (not filename or filename == "") and entry.bufnr then
		filename = vim.api.nvim_buf_get_name(entry.bufnr)
	end

	if not filename or filename == "" then
		return nil
	end

	local lnum = entry.lnum or 1
	local col = entry.col or 1
	local relative_path = vim.fn.fnamemodify(filename, ":.")
	local max_len = math.max(20, math.floor(vim.o.columns * 0.42) - 14)
	local display_path = tail_path(relative_path, max_len)
	local dir, file = split_dir_and_file(display_path)

	return {
		value = entry,
		ordinal = string.format("%s %s %s", relative_path, lnum, entry.text or ""),
		filename = filename,
		lnum = lnum,
		col = col,
		display = function()
			local position = string.format("%d:%d", lnum, col)
			return lsp_location_displayer({
				{ string.format("%-10s", position), "TelescopeResultsLineNr" },
				{ dir, "TelescopeResultsComment" },
				file,
			})
		end,
	}
end

local function lsp_picker_opts()
	return {
		show_line = false,
		entry_maker = lsp_location_entry,
	}
end

local function telescope_lsp_references()
	telescope_builtin.lsp_references(lsp_picker_opts())
end

local function telescope_lsp_definitions()
	telescope_builtin.lsp_definitions(lsp_picker_opts())
end

local function telescope_lsp_implementations()
	telescope_builtin.lsp_implementations(lsp_picker_opts())
end

local function telescope_lsp_type_definitions()
	telescope_builtin.lsp_type_definitions(lsp_picker_opts())
end

local function telescope_lsp_declarations()
	telescope_builtin.lsp_declarations(lsp_picker_opts())
end

vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"tailwindcss",
	"html",
	"jsonls",
    "pyright",
    "kotlin",
    "clang",
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

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf, noremap = true, silent = true }

		vim.keymap.set("n", "gR", telescope_lsp_references, vim.tbl_extend("force", opts, { desc = "LSP references" }))
		vim.keymap.set("n", "gd", telescope_lsp_definitions, vim.tbl_extend("force", opts, { desc = "LSP definitions" }))
		vim.keymap.set("n", "gI", telescope_lsp_implementations, vim.tbl_extend("force", opts, { desc = "LSP implementations" }))
		vim.keymap.set("n", "gy", telescope_lsp_type_definitions, vim.tbl_extend("force", opts, { desc = "LSP type definitions" }))
		vim.keymap.set("n", "gD", telescope_lsp_declarations, vim.tbl_extend("force", opts, { desc = "LSP declaration" }))
	end,
})
