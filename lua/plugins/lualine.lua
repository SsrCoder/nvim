local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"AndreM222/copilot-lualine",
		event = "VeryLazy",
	},
}

function M.config()
	require("lualine").setup {
		options = {
			ignore_focus = { "NvimTree" },
		},
		sections = {
			lualine_c = {
				require("lsp-progress").progress,
			},
			lualine_z = { "copilot", "filetype" },
		},
		extensions = { "quickfix", "man", "fugitive" },
	}
end

return M
