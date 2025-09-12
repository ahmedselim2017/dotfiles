return {
  -- {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'},
  "rickhowe/diffchar.vim",
  "folke/twilight.nvim",
  "folke/zen-mode.nvim",
  "rickhowe/diffchar.vim",
  "christoomey/vim-tmux-navigator",
  "norcalli/nvim-colorizer.lua",
  "google/vim-searchindex",
  "benlubas/molten-nvim",
  {
    'declancm/maximize.nvim',
    config = true
  },
  { 'akinsho/git-conflict.nvim', version = "*", config = true },
  -- "daeyun/vim-matlab",
  -- "Rahlir/nvim-matlab"
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
      "echasnovski/mini.pick",         -- optional
    },
    config = true
  },
  {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("inlay-hints").setup()
    end
  },
  {
    "danymat/neogen",
    -- Uncomment next line if you want to follow only stable versions
    version = "*",
    config = function()
      local neogen = require("neogen")

      neogen.setup({
        languages = {
          cuda = require("neogen.configurations.cpp")
        }

      })
    end
    -- {
    --   enabled = true,
    --   languages = {
    --     cuda = require("neogen.configurations.cpp")
    --   }
    -- }


  }

}
