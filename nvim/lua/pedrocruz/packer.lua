vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    -- or                            , branch = '0.1.x',
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  use("nvim-telescope/telescope-file-browser.nvim")

  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

  use("mbbill/undotree")

  use({
    "blazkowolf/gruber-darker.nvim",
    config = function()
      require("gruber-darker").setup {
        bold = true,
        italic = {
          strings = false,
          comments = true,
          operators = false,
          folds = true,
        },
      }
    end
  })

  use({
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup {
        extend_background_behind_borders = true,
      }
    end
  })

  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },             -- Required
      { "williamboman/mason.nvim" },           -- Optionalpacke
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },         -- Required
      { "hrsh7th/cmp-nvim-lsp" },     -- Required
      { "hrsh7th/cmp-buffer" },       -- Optional
      { "hrsh7th/cmp-path" },         -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" },     -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" },             -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional
    },
  })

  use("nvim-tree/nvim-web-devicons")
  use("lewis6991/gitsigns.nvim")
  use("romgrk/barbar.nvim")
  use("numToStr/Comment.nvim")
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use({
    "akinsho/toggleterm.nvim",
    tag = '*',
  })

  use {
    "nvim-neorg/neorg",
    requires = { "nvim-neorg/lua-utils.nvim", "nvim-neotest/nvim-nio", "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "pysan3/pathlib.nvim" },
    tag = "*",
  }
  use("ahmedkhalf/project.nvim")
end)
