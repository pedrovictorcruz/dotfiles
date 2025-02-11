require("naysayer").setup({
	variant = "main",
	dark_variant = "main",
	bold_vert_split = false,
	dim_nc_background = true,
	disable_background = false,
	disable_float_background = false,
	disable_italics = true,
})

require("jb").setup({})

vim.cmd("colorscheme jb")
