return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
    local nvimtree = require("nvim-tree")

    vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
    vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
    vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
    vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
  end,
}
