local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
	}
}

local ensure_installed = {}

local lang = require "basic.languages"
if lang.is_enabled(lang.Go) then
	table.insert(ensure_installed, "go")
end

if lang.is_enabled(lang.Python) then
	table.insert(ensure_installed, "python")
end

if lang.is_enabled(lang.Lua) then
	table.insert(ensure_installed, "lua")
end

function M.config()
	require("nvim-treesitter.configs").setup {
		-- ensure_installed = { "lua", "go", "rust", "json", "jsonc", "markdown", "markdown_inline", "bash", "python" },
		ensure_installed = ensure_installed,
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
