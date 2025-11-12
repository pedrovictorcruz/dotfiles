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
    { 
        "blazkowolf/gruber-darker.nvim", 
        opts = {
        bold = false,
            italic = {
              strings = false,
            },
        }
    },
    { 
        "dmtrKovalenko/fff.nvim",
        build = function()
            require("fff.download").download_or_build_binary()
        end,
    }
}
