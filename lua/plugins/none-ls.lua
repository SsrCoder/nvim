local M = {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" }
}

function M.config()
	local null_ls = require "null-ls"

	local formatting = null_ls.builtins.formatting
	-- local diagnostics = null_ls.builtins.diagnostics;

	null_ls.setup {
		debug = false,
		source = {
			formatting.stylua,
			formatting.prettier,
			null_ls.builtins.completion.spell,
		},
	}
end

return M
