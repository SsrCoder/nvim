---@See https://cmp.saghen.dev/
local M = {
	"saghen/blink.cmp",
	version = "*",
	event = { "VeryLazy" },
	dependencies = { "rafamadriz/friendly-snippets" },

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "enter",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			cmdline = {},
		},
	},
	opts_extend = { "sources.default" }

}

return M
