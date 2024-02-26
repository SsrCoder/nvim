local M = {
	"williamboman/mason-lspconfig.nvim",
	-- event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
	},
}

local servers = {
	"lua_ls",
	"gopls",
	"pyright",
	"jsonls",
	"rust_analyzer",
}

function M.config()
	require("mason-lspconfig").setup {
		ensure_installed = servers,
	}
end

return M
