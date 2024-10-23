return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup {
      python = {
        names = false,
      }
    }
  end,
}
