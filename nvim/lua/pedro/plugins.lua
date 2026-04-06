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
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },
    {
        'RostislavArts/naysayer.nvim',
        priority = 1000,
        lazy = false
    },
    {
         'nvim-lualine/lualine.nvim',
         dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'kvrohit/rasmus.nvim',
        priority = 1000,
        lazy = false
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
    },
}
