local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		require "plugins.treesitter-textobjects",
	}
}

function M.config()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
		auto_install = true,
		-- ensure_installed = { "lua" },
		sync_install = false,
		highlight = {
			enable = true,
			disable = { "lua" },
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true },
	})
end

return M
