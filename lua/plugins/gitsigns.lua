local M = {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
}

function M.config()
	require("gitsigns").setup {
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 0,
			ignore_whitespace = true,
		}
	}
end

return M
