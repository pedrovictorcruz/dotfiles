return {
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "neovim/nvim-lspconfig" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  { "mbbill/undotree" },
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
  { "ThePrimeagen/harpoon" },
  {
      'stevearc/oil.nvim',
      ---@module 'oil'
      ---@type oil.SetupOpts
      opts = {},
      -- Optional dependencies
      dependencies = { { "echasnovski/mini.icons", opts = {} } },
      -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
}

