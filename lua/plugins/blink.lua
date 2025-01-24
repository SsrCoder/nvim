---@See https://cmp.saghen.dev/
local M = {
	"saghen/blink.cmp",
	version = "*",
	event = { "VeryLazy" },
	dependencies = {
		"rafamadriz/friendly-snippets",
		"fang2hou/blink-copilot",
	},

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
		},
		keymap = {
			preset = "enter",
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},
		sources = {
			-- default = { "lsp", "path", "snippets", "buffer" },
			default = { "copilot", "lsp", "path", "buffer" },
			cmdline = {},
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					score_offset = 100,
					async = true,
					opts = {
						max_completions = 3,
						max_attempts = 4,
					}
				},
			},
		},
		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				auto_show = function(ctx) return ctx.mode ~= 'cmdline' end,
				draw = {
					columns = {
						{ "label",     "label_description", gap = 2 },
						{ "kind_icon", "kind",              gap = 1 },
					},
					treesitter = { "lsp" },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
			},
			ghost_text = {
				enabled = true,
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
	opts_extend = {
		"sources.completion.enabled_providers",
		"sources.compat",
		"sources.default",
	}

}

return M
