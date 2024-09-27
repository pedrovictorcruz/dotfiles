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

  use('neovim/nvim-lspconfig')

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

  use("nvim-tree/nvim-web-devicons")
  use("romgrk/barbar.nvim")
  use("lewis6991/gitsigns.nvim")
  use("numToStr/Comment.nvim")

  use({
    "akinsho/toggleterm.nvim",
    tag = '*',
  })


end)
