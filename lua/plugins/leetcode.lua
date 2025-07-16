---@See https://github.com/kawre/leetcode.nvim
local M = {
	"kawre/leetcode.nvim",
	lazy = true,
	cmd = { "Leet" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<Leader>lt", ":Leet test<CR>",   desc = "[Leet] Run Test",             silent = true, },
		{ "<Leader>ls", ":Leet submit<CR>", desc = "[Leet] Submit",               silent = true, },
		{ "<Leader>lo", ":Leet open<CR>",   desc = "[Leet] Open in Browser",      silent = true, },
		{ "<Leader>ld", ":Leet daily<CR>",  desc = "[Leet] Open Daily Question",  silent = true, },
		{ "<Leader>ll", ":Leet list<CR>",   desc = "[Leet] List All Questions",   silent = true, },
		{ "<Leader>lr", ":Leet reset<CR>",  desc = "[Leet] Reset Code",           silent = true, },
	},
	---@module "leetcode.config"
	---@type lc.UserConfig
	opts = {
		lang = "golang",

		cn = {
			enabled = true,
		},

		injector = {
			["golang"] = {
				imports = function()
					return { "package leetcode", }
				end,
			},
		},

		image_support = true,
	},
}

return M
