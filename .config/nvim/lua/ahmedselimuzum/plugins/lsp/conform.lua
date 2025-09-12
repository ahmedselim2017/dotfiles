return {
  "stevearc/conform.nvim",
  -- event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>F",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "luaformatter" },
      -- markdown = { "markdownlint" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      json = { "cj" },
      c = {"clang-format"},
      fortran = {"fprettify"},
      cmake = {"cmake_format"}



    },
    -- Set up format-on-save
    -- format_on_save = { timeout_ms = 1000, lsp_fallback = true },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      fprettify = {
        prepend_args = {"-i", "2"},
      },
      cj = {
        command = "compact-json_pipe",
        stdin = true
      }
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
