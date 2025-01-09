local M = {
	"ray-x/lsp_signature.nvim",
	-- event = "VeryLazy",
	event = "LspAttach",
}

function M.config()
	require("lsp_signature").setup {
		bind = true,
		-- handler_opts = {
		-- 	border = "rounded"
		-- },
	}
end

return M
