local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
}

function M.config()
	require('nvim-treesitter.configs').setup {
		-- ensure_installed = { 'lua' },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ap"] = "@parameter.outer",
					["ip"] = "@parameter.inner",
					["ab"] = "@block.outer",
					["ib"] = "@block.inner",
				},
				include_surrounding_whitespace = true,
			},
		},
	}
end

return M
