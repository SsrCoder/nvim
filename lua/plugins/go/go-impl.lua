local M = {
	"fang2hou/go-impl.nvim",
	ft = "go",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"ibhagwan/fzf-lua",
		"nvim-lua/plenary.nvim",
	},
	opts = {},
	build = ":!go install github.com/josharian/impl@latest",
	keys = {
		{
			"gI",
			function()
				require("go-impl").open()
			end,
			mode = { "n" },
			desc = "Go Impl",
		},
	},
}

return M
