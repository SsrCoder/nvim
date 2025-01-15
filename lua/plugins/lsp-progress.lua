local M = {
	"linrongbin16/lsp-progress.nvim",
	event = "BufReadPost",
}

function M.config()
	require("lsp-progress").setup {}
end

return M
