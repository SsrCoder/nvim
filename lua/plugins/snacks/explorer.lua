-- @see: https://github.com/folke/snacks.nvim/blob/main/docs/explorer.md
local M = {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		explorer = {
		}
	},
	keys = {
		{ "<Leader>e", function() Snacks.explorer() end, desc = "Show Explorer", },
	},
}

return M
