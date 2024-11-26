return {
    { 'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-telescope/telescope-file-browser.nvim"
    },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "neovim/nvim-lspconfig" },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    { "mbbill/undotree" },
    { "nvim-tree/nvim-web-devicons" },
    {
		-- Adds git related signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' }
			},
			on_attach = function(bufnr)
				vim.keymap.set('n', '<leader>hp',
					require('gitsigns').preview_hunk,
					{ buffer = bufnr, desc = 'Preview git hunk' })
			end
		},
	},
    { "numToStr/Comment.nvim" },
    { "akinsho/toggleterm.nvim", version = "*" },
    { "tpope/vim-fugitive" },
    { "nvim-lua/plenary.nvim" },
    {
        "ej-shafran/compile-mode.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "m00qek/baleia.nvim", tag = "v1.3.0" },
        },
        config = function()
            vim.g.compile_mode = {
                baleia_setup = true,
            }
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                config = function(_, opts)
                    require("luasnip").config.set_config(opts)
                end,
            },
            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
            },
        },
    },
    { 'onsails/lspkind-nvim' },
    { "rose-pine/neovim", name = "rose-pine" },
    { 'romgrk/barbar.nvim' },
    --{
    --    'akinsho/bufferline.nvim',
    --    version = "*", 
    --    dependencies = 'nvim-tree/nvim-web-devicons'
    --},
    { 'sainnhe/gruvbox-material' },
    { "Yazeed1s/oh-lucy.nvim", },
    {
        'folke/trouble.nvim',
        requires = "kyazdani42/nvim-web-devicons",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = 'Trouble',
        keys = {
            {
                '<leader>q',
                '<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>',
                desc = 'Buffer Diagnostics (Trouble)',
            },
        },
    },
    {
        'stevearc/oil.nvim',
        opts = {
            view_options = {
                show_hidden = true,
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
    {
        'williamboman/mason.nvim'
    }
}

