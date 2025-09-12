return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")


    mason.setup({})
    mason_lspconfig.setup({
      automatic_installation = true,
      automatic_enable = false
    })
  end
}
