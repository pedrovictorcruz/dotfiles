return {
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
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
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    }
}
