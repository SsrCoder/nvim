local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
			event = "InsertEnter",
		},
		-- {
		-- 	"hrsh7th/cmp-emoji",
		-- 	event = "InsertEnter",
		-- },
		-- {
		-- 	"hrsh7th/cmp-buffer",
		-- 	event = "InsertEnter",
		-- },
		{
			"hrsh7th/cmp-path",
			event = "InsertEnter",
		},
		{
			"hrsh7th/cmp-cmdline",
			event = "InsertEnter",
		},
		-- {
		-- 	"saadparwaiz1/cmp_luasnip",
		-- 	event = "InsertEnter",
		-- },
		{
			"L3MON4D3/LuaSnip",
			event = "InsertEnter",
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
		},
		{
			"onsails/lspkind.nvim",
			event = "InsertEnter",
		},
		{
			"hrsh7th/cmp-nvim-lua",
		},

		{
			"zbirenbaum/copilot-cmp",
			event = "InsertEnter",
			config = function()
				require("copilot_cmp").setup {};
			end,
			dependencies = {
				{
					"zbirenbaum/copilot.lua",
					cmd = "Copilot",
					event = "InsertEnter",
					config = function()
						require("copilot").setup {
							panel = {
								keymap = {
									jump_next = "<c-j>",
									jump_prev = "<c-k>",
									accept = "<c-l>",
									refresh = "r",
									open = "<M-CR>",
								},
							},
							suggestion = {
								enabled = true,
								auto_trigger = true,
								keymap = {
									accept = "<c-l>",
									next = "<c-j>",
									prev = "<c-k>",
									dismiss = "<c-h>",
								},
							},
							filetypes = {
								markdown = true,
								help = false,
								gitcommit = false,
								gitrebase = false,
								hgcommit = false,
								svn = false,
								cvs = false,
								["."] = false,
							},
							copilot_node_command = "node",
						}

						local opts = { noremap = true, silent = true }
						vim.api.nvim_set_keymap("n", "<c-s>",
							":lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)

						-- require("copilot_cmp").setup()
					end,
				}
			}
		},
	},
}

function M.config()
	vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
	vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
	vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" })
	vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })

	local cmp = require "cmp"
	local luasnip = require "luasnip"
	require("luasnip/loaders/from_vscode").lazy_load()
	require("luasnip").filetype_extend("typescriptreact", { "html" })

	local check_backspace = function()
		local col = vim.fn.col "." - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
	end

	local icons = require "basic.icons"
	local lspkind = require "lspkind"


	cmp.setup {
		-- preselect = cmp.PreselectMode.Item,
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		mapping = cmp.mapping.preset.insert {
			["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-e>"] = cmp.mapping {
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			},
			-- Accept currently selected item. If none selected, `select` first item.
			-- Set `select` to `false` to only confirm explicitly selected items.
			["<CR>"] = cmp.mapping.confirm { select = true },
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expandable() then
					luasnip.expand()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif check_backspace() then
					fallback()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
		},
		sorting = {
			comparators = {
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
			priority_weight = 2,
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				vim_item.kind = icons.kind[vim_item.kind]
				vim_item.menu = ({
					nvim_lsp = "",
					nvim_lua = "",
					luasnip = "",
					buffer = "",
					path = "",
					emoji = "",
				})[entry.source.name]
				if entry.source.name == "copilot" then
					vim_item.kind = icons.git.Octoface
					vim_item.kind_hl_group = "CmpItemKindCopilot"
				end

				if entry.source.name == "cmp_tabnine" then
					vim_item.kind = icons.misc.Robot
					vim_item.kind_hl_group = "CmpItemKindTabnine"
				end

				if entry.source.name == "crates" then
					vim_item.kind = icons.misc.Package
					vim_item.kind_hl_group = "CmpItemKindCrate"
				end

				if entry.source.name == "lab.quick_data" then
					vim_item.kind = icons.misc.CircuitBoard
					vim_item.kind_hl_group = "CmpItemKindConstant"
				end

				if entry.source.name == "emoji" then
					vim_item.kind = icons.misc.Smiley
					vim_item.kind_hl_group = "CmpItemKindEmoji"
				end

				return vim_item
			end,
		},
		sources = {
			{ name = "copilot" },
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			-- { name = "cmp_tabnine" },
			{ name = "nvim_lua" },
			-- { name = "buffer" },
			{ name = "path" },
			{ name = "calc" },
			-- { name = "emoji" },
			{ name = "treesitter" },
			{ name = "crates" },
			{ name = "tmux" },
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		window = {
			completion = {
				border = "rounded",
				winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
				col_offset = -3,
				side_padding = 1,
				scrollbar = false,
				scrolloff = 8,
			},
			documentation = {
				border = "rounded",
				winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
			},
		},
		experimental = {
			ghost_text = false,
		},
	}
end

return M
