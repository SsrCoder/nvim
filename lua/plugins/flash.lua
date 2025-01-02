local M = {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
	},
	keys = {},
}

function M.config()
	require("flash").setup {}
end

return M
