return {
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
	},
	{
		"stevearc/oil.nvim",
		opts = {
			view_options = {
				show_hidden = true,
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "romgrk/barbar.nvim" },
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },
	{ "alljokecake/naysayer-theme.nvim", name = "naysayer" },
	{
		"vague2k/vague.nvim",
		priority = 1000,
	},
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000,
	},
	{
		"Mofiqul/adwaita.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"datsfilipe/vesper.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
				"onsails/lspkind.nvim",
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			{
				"nvim-tree/nvim-web-devicons",
			},
		},
	},
	{
		"sainnhe/gruvbox-material",
		enabled = true,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_transparent_background = 0
			vim.g.gruvbox_material_foreground = "mix"
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_ui_contrast = "high"
			vim.g.gruvbox_material_float_style = "bright"
			vim.g.gruvbox_material_statusline_style = "material"
			vim.g.gruvbox_material_cursor = "auto"

			-- vim.g.gruvbox_material_colors_override = { bg0 = '#16181A' } -- #0e1010
			-- vim.g.gruvbox_material_better_performance = 1
		end,
	},
	{
		"tinted-theming/tinted-vim",
		lazy = false,
		priority = 1000,
	},
}
