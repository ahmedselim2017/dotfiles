return {
	"folke/snacks.nvim",

	priority = 1000,
	lazy = false,

	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		indent = { enabled = true, animate = { enabled = false } },
		input = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
}
