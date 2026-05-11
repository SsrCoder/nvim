vim.pack.add {
	'https://github.com/xzbdmw/colorful-menu.nvim',
	'https://github.com/saghen/blink.lib',
	'https://github.com/saghen/blink.cmp',
}
local cmp = require('blink.cmp')
cmp.build():wait(60000)

cmp.setup {
	-- See :h blink-cmp-config-keymap for defining your own keymap
	keymap = {
		preset = 'none',

		['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
		['<C-k>'] = { 'show_signature', 'hide_documentation', 'fallback' },

		['<Up>'] = { 'select_prev', 'fallback' },
		['<Down>'] = { 'select_next', 'fallback' },

		['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
		['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },

		['<C-n>'] = { 'scroll_documentation_down', 'fallback' },
		['<C-p>'] = { 'scroll_documentation_up', 'fallback' },

		['<CR>'] = { 'accept', 'fallback' },
	},

	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = 'mono'
	},

	completion = {
		keyword = {
			range = 'full',
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 0,
		},
		list = {
			selection = {
				preselect = false,
				auto_insert = true,
			},
		},
		menu = {
			draw = {
				-- columns = {
				-- 	{ "label",     "label_description", gap = 1, },
				-- 	{ "kind_icon", "kind",              gap = 1, }
				-- },
				columns = { { "kind_icon" }, { "label", gap = 1 } },
				components = {
					label = {
						text = function(ctx)
							return require("colorful-menu").blink_components_text(ctx)
						end,
						highlight = function(ctx)
							return require("colorful-menu").blink_components_highlight(ctx)
						end,
					},
				},
			},
		},
		ghost_text = {
			enabled = true,
		},
		trigger = {
			prefetch_on_insert = true,
			show_on_keyword = true,
			show_on_trigger_character = true,
		},
	},

	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer' },
		providers = {
			snippets = { score_offset = 3, },
			path = { score_offset = 2, },
			lsp = { score_offset = 1, },
			buffer = { score_offset = 0, },
		},
	},

	-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
	-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
	-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
	--
	-- See the fuzzy documentation for more information
	fuzzy = { implementation = "prefer_rust_with_warning" },

	cmdline = {
		completion = {
			list = {
				selection = {
					preselect = false,
				},
			},
		},

		keymap = {
			['<CR>'] = { 'select_accept_and_enter', 'fallback' },
		},
	},

	enabled = function()
		return not vim.tbl_contains({ "markdown", }, vim.bo.filetype) and
			vim.bo.buftype ~= "prompt" and
			vim.b.completion ~= false
	end
}

