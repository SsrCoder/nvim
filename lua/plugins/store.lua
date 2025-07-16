---@See https://www.reddit.com/r/neovim/comments/1lx5b22/storenvim_not_a_plugin_manager_but_plugin_magazine/

local M = {
	"alex-popov-tech/store.nvim",
	dependencies = {
		"OXY2DEV/markview.nvim", -- optional, for pretty readme preview / help window
	},
	cmd = "Store",
	keys = {
		-- { "<leader>s", "<cmd>Store<cr>", desc = "Open Plugin Store" },
	},
	opts = {
		-- optional configuration here
	},
}

return M
