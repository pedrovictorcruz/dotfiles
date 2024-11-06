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
    { "lewis6991/gitsigns.nvim" },
    { "numToStr/Comment.nvim" },
    { "akinsho/toggleterm.nvim", version = "*" },
    { "tpope/vim-fugitive" },
    { "nvim-lua/plenary.nvim" },
    {
        "ej-shafran/compile-mode.nvim",
        config = function()
            vim.g.compile_mode = {
                focus = true,
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
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
    },
    {
        "blazkowolf/gruber-darker.nvim",
        config = function()
            require("gruber-darker").setup({
                bold = true,
                italic = {
                    strings = false,
                    comments = true,
                    operators = false,
                    folds = true,
                },
            })
        end,
    },
}

