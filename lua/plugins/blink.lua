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
		completion = {
			menu = {
				auto_show = function(ctx) return ctx.mode ~= 'cmdline' end,
				draw = {
					columns = {
						{ "label",     "label_description", gap = 2 },
						{ "kind_icon", "kind",              gap = 1 },
					},
				},
			},
			ghost_text = {
				enabled = false, -- disable when copilot enable
			},
		},

		-- completion = {
		-- 	list = {
		-- 		selection = {
		-- 			preselect = function(ctx) return ctx.mode ~= 'cmdline' end,
		-- 			auto_insert = function(ctx) return ctx.mode ~= 'cmdline' end,
		-- 		}
		-- 	}
		-- }
	},
	opts_extend = { "sources.default" }

}

return M
