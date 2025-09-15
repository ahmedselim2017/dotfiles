return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},

	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = { enable = true },
			indent = { enable = true },

			ensure_installed = {
				"bash",
				"bibtex",
				"c",
				"cmake",
				"comment",
				"cpp",
				"csv",
				"cuda",
				"dockerfile",
				"doxygen",
				"fortran",
				"json",
				"latex",
				"lua",
				"make",
				"matlab",
				"python",
				"toml",
				"tmux",
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
