---@See https://github.com/ibhagwan/fzf-lua/wiki
local M = {
	"neovim/nvim-lspconfig",
	-- lazy = true,
	-- event = "VeryLazy",
	dependencies = { "saghen/blink.cmp" },
}

LANGUAGE_SERVER_CONFIGS = {

	lua_ls = {
		cmd = {
			'lua-language-server',
			-- '--locale="zh-cn"',
		},
		settings = {
			Lua = {
				workspace = {
					library = {
						[vim.fn.expand "$VIMRUNTIME/lua"] = true,
						[vim.fs.joinpath(vim.fn.stdpath "config", "lua")] = true,
						[vim.fs.joinpath(vim.fn.stdpath "data", "lazy")] = true,
					},
				},
				hint = {
					enable = true,
				},
			},
		},
	},

	gopls = {
		settings = {
			gopls = {
				---@See https://github.com/golang/tools/blob/master/gopls/doc/inlayHints.md
				hints = {
					rangeVariableTypes = true,
					parameterNames = true,
					constantValues = true,
					assignVariableTypes = true,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					functionTypeParameters = true,
				},
			}
		},
		on_attach = function(client, bufnr)
			require "lsp_signature".on_attach({}, bufnr) -- Note: add in lsp client on-attach
		end,
	},

	rust_analyzer = {
		cmd = {
			'rust-analyzer',
		},
	},

	pyright = {},

	jsonls = {},
}

function M.config()
	-- local opts = { noremap = true, silent = true }
	-- local keymap = vim.api.nvim_buf_set_keymap

	-- keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	-- keymap(bufnr, "n", "<C-d>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	-- keymap(bufnr, "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

	local lspconfig = require("lspconfig")
	for server, config in pairs(LANGUAGE_SERVER_CONFIGS) do
		config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
		lspconfig[server].setup(config)
	end

	require("which-key").add {
		{ 'g',  group = 'Goto...' },
		{ 'gd', ':lua require("fzf-lua").lsp_definitions({ jump_to_single_result = true })<CR>',                                                         desc = 'Goto Definition' },
		{ 'gr', ':lua require("fzf-lua").lsp_references({ ignore_current_line = false, includeDeclaration = false, jump_to_single_result = true })<CR>', desc = 'Goto References' },
		{ 'gi', ':lua require("fzf-lua").lsp_implementations()<CR>',                                                                                     desc = 'Goto Implementations' },
		{ 'ga', ':lua require("fzf-lua").lsp_code_actions()<CR>',                                                                                        desc = 'Goto Code Actions' },
		{ 'gf', ':lua vim.lsp.buf.format()<CR>',                                                                                                         desc = 'Code Fromat' },
		{ 'gw', hidden = true },
	}
end

return M
