local M = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "TroubleToggle" },
}

function M.config()
	require("trouble").setup {}
end

return M
