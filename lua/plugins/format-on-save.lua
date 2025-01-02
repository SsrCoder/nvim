local M = {
	"elentok/format-on-save.nvim"
}

function M.config()
	local formatters = require("format-on-save.formatters")

	require("format-on-save").setup {
		exclude_path_patterns = {
			"/node_modules/",
			".local/share/nvim/lazy",
		},
		formatter_by_ft = {
			go = formatters.lsp,
			lua = formatters.lsp,
		},
	}
end

return M
