vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use 'hrsh7th/nvim-cmp'         -- Completion plugin
  use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
  use 'neovim/nvim-lspconfig'    -- LSP configurations

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

  use("nvim-tree/nvim-web-devicons")
  use("lewis6991/gitsigns.nvim")
  use("numToStr/Comment.nvim")

  use({
    "akinsho/toggleterm.nvim",
    tag = '*',
  })

  use("tpope/vim-fugitive")

  use("nvim-lua/plenary.nvim")
  use({
    "ej-shafran/compile-mode.nvim",
    config = function()
      ---@type CompileModeOpts
      vim.g.compile_mode = {
        focus = true,
      }
    end
  })

  use('junegunn/fzf')
  use('junegunn/fzf.vim')


end)
