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

	vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
end

return M
