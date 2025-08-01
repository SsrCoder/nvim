local M = {
	"williamboman/mason.nvim",
	-- lazy = false,
	cmd = "Mason",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		ensure_installed = {
			"lua-language-server",
			"jsonls",
		},
	},
}

return M
