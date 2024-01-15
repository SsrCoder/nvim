local M = {
	"folke/flash.nvim",
	event = "VeryLazy",
	keys = {
	},
}

function M.config()
	require("flash").setup {}
end

return M
