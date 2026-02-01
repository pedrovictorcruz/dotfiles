return {
    { 
        "nvim-treesitter/nvim-treesitter", 
        lazy = false,
        run = ":TSUpdate" 
    },
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		lazy = false,
	},
    { "rose-pine/neovim", name = "rose-pine" },
    {
        "comfysage/artio.nvim", lazy = false,
    }
}
