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
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
		},
	},
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },
	{
		"jameswalls/naysayer.nvim",
		priority = 1000,
		lazy = false,
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
				"meuter/lualine-so-fancy.nvim",
			},
		},
	},
	{ "zbirenbaum/copilot.lua" },
    { "Mofiqul/vscode.nvim" },
}
