require("naysayer").setup({
	variant = "main",
	dark_variant = "main",
	bold_vert_split = false,
	dim_nc_background = true,
	disable_background = false,
	disable_float_background = false,
	disable_italics = true,
})

require("vague").setup({
	-- optional configuration here
})

require("vesper").setup({
	italics = {
		comments = true, -- Boolean: Italicizes comments
		keywords = false, -- Boolean: Italicizes keywords
		functions = false, -- Boolean: Italicizes functions
		strings = false, -- Boolean: Italicizes strings
		variables = false, -- Boolean: Italicizes variables
	},
})

vim.cmd("colorscheme naysayer")
-- vim.cmd("colorscheme vesper")
-- vim.cmd("colorscheme vague")
-- vim.cmd("colorscheme onedark_dark")
-- vim.cmd("colorscheme adwaita")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
