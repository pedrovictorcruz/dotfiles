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
    },
    {
        'everviolet/nvim', name = 'evergarden',

    },
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },
    {
        'github/copilot.vim'
    }
}
