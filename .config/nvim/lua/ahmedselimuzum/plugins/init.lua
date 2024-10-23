return {
  "rickhowe/diffchar.vim",
  "folke/twilight.nvim",
  "folke/zen-mode.nvim",
  "rickhowe/diffchar.vim",
  "christoomey/vim-tmux-navigator",
  "norcalli/nvim-colorizer.lua",
  "google/vim-searchindex",
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
  }
}
