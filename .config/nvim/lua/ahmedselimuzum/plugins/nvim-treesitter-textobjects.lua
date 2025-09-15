return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,

	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,
					lookahead = true,

					keymaps = {
						["a="] = "@assignment.outer",
						["i="] = "@assignment.inner",
						["l="] = "@assignment.lhs",
						["r="] = "@assignment.rhs",

						["ap"] = "@parameter.outer",
						["ip"] = "@parameter.inner",

						["ai"] = "@conditional.outer",
						["ii"] = "@conditional.inner",

						["al"] = "@loop.outer",
						["il"] = "@loop.inner",

						["af"] = "@call.outer",
						["if"] = "@call.inner",

						["am"] = "@function.outer",
						["im"] = "@function.inner",

						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]p"] = "@parameter.outer",
						["]i"] = "@conditional.outer",
						["]l"] = "@loop.outer",
						["]f"] = "@call.outer",
						["]m"] = "@function.outer",
						["]c"] = "@class.outer",
					},
					goto_next_end = {
						["]P"] = "@parameter.outer",
						["]İ"] = "@conditional.outer",
						["]L"] = "@loop.outer",
						["]F"] = "@call.outer",
						["]M"] = "@function.outer",
						["]C"] = "@class.outer",
					},
					goto_previous_start = {
						["[p"] = "@parameter.outer",
						["[i"] = "@conditional.outer",
						["[l"] = "@loop.outer",
						["[f"] = "@call.outer",
						["[m"] = "@function.outer",
						["[c"] = "@class.outer",
					},
					gotoprevious__end = {
						["[P"] = "@parameter.outer",
						["[İ"] = "@conditional.outer",
						["[L"] = "@loop.outer",
						["[F"] = "@call.outer",
						["[M"] = "@function.outer",
						["[C"] = "@class.outer",
					},
				},
			},
		})

		local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

		-- Repeat movement with ; and ,
		-- ensure ; goes forward and , goes backward regardless of the last direction
		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

		-- vim way: ; goes to the direction you were moving.
		-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
		-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

		-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
		vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
	end,
}
