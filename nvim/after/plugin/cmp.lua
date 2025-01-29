local cmp = require("cmp")
local options = {
	completion = {
		completeopt = "menu,menuone,noinsert",
		autocomplete = false,
	},
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
}
cmp.setup(options)
