local M = {
	"williamboman/mason.nvim",
	cmd = { "Mason" },
}

function M.config()
	require("mason").setup {
		ui = {
			border = "rounded",
		},
	}
end

return M
