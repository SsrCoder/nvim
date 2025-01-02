local M = {
	"williamboman/mason-lspconfig.nvim",
	-- lazy = true,
	-- event = { "VeryLazy" },
	dependencies = {
		{
			"williamboman/mason.nvim",
			cmd = { "Mason" },
		},
	},
}

function M.config()
	require("mason").setup {
		PATH =  "prepend"
	}

	require("mason-lspconfig").setup {
		-- ensure_installed = { "lua_ls" },
		automatic_installation = { exclude = { } },
	}
end

return M
