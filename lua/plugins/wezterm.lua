local M = {
	"willothy/wezterm.nvim",
	event = "VeryLazy",
}

function M.config()
	require("wezterm").setup {}
end

return M
