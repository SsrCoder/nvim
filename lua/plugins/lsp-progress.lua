local M = {
	"linrongbin16/lsp-progress.nvim",
	event = "VeryLazy",
}

function M.config()
	require("lsp-progress").setup {
	}
end

return M
