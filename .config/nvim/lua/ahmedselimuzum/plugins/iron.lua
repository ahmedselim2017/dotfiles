return {
  "Vigemus/iron.nvim",

  config = function()
    local iron = require("iron.core")

    iron.setup {
      config = {
        scratch_repl = true,

        repl_definition = {
          python = {
            command = { "ipython", "--no-autoindent" },
            format = require("iron.fts.common").bracketed_paste,
          }
        },

        repl_open_cmd = require('iron.view').split.horizontal.botright(15),
      },

      keymaps = {
        send_motion = "<leader>sC",
        visual_send = "<leader>sc",
        send_file = "<leader>sf",
        send_line = "<leader>sl",
        send_paragraph = "<leader>sp",
        send_until_cursor = "<leader>su",
        send_mark = "<leader>sm",
        mark_motion = "<leader>mc",
        mark_visual = "<leader>mc",
        remove_mark = "<leader>md",
        cr = "<leader>s<cr>",
        interrupt = "<leader>s<space>",
        exit = "<leader>sq",
        clear = "<leader>cl",
      },

    }
  end
}
