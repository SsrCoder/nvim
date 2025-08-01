local M = {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp", "lukas-reineke/lsp-format.nvim" },
	-- dependencies = { "saghen/blink.cmp" },
	event = { "BufReadPre", "BufNewFile" },
}

local support_lsp = {
	'lua_ls',
	'gopls',
	'clangd',
	'jsonls',
	'astro',
	'cssls',
	'ts_ls',
	'rust_analyzer',
	'tailwindcss',
}

function M.config()
	vim.diagnostic.config({
		virtual_text = true,
	})

	local capabilities = require("blink.cmp").get_lsp_capabilities()
	local lspconfig = require("lspconfig")

	local on_attach = require("lsp-format").on_attach


	for _, value in ipairs(support_lsp) do
		lspconfig[value].setup({ capabilities = capabilities, on_attach = on_attach })
	end


	-- lspconfig['lua_ls'].setup({ capabilities = capabilities, on_attach = on_attach })
	-- lspconfig['gopls'].setup({ capabilities = capabilities, on_attach = on_attach })
	-- lspconfig['clangd'].setup({ capabilities = capabilities, on_attach = on_attach })
	-- lspconfig['jsonls'].setup({ capabilities = capabilities, on_attach = on_attach })
	-- lspconfig['astro'].setup({ capabilities = capabilities, on_attach = on_attach })
	-- lspconfig['cssls'].setup({ capabilities = capabilities, on_attach = on_attach })
	-- lspconfig['ts_ls'].setup({ capabilities = capabilities, on_attach = on_attach })
	-- lspconfig['tailwindcss'].setup({ capabilities = capabilities, on_attach = on_attach })
	-- lspconfig['rust_analyzer'].setup({ capabilities = capabilities, on_attach = on_attach })
	-- lspconfig['lua_ls'].setup({ capabilities = capabilities })

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float,
				{ buffer = ev.buf, desc = "[LSP] Show diagnostic" })
			vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[LSP] Rename" })
			vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action,
				{ desc = "[LSP] Show Code Actions", buffer = ev.buf, noremap = true, silent = true })
		end,
	})
end

return M
