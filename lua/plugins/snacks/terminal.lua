-- @see: https://github.com/folke/snacks.nvim/blob/main/docs/terminal.md
local M = {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		terminal = {
		},
		styles = {
			terminal = {
				position = "float",
			},
		},
	},
	keys = {
		{ "<Leader>i", function() Snacks.terminal.toggle() end, desc = "[Snacks] Toggle Terminal", mode = { "n", "t" } },
	},
}

return M
