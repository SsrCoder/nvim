local M = {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp", "lukas-reineke/lsp-format.nvim" },
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

	vim.lsp.config('*', {
		capabilities = capabilities,
	})

	for _, value in ipairs(support_lsp) do
		vim.lsp.enable(value, true)
	end

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			local bufnr = ev.buf
			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			if not client then
				return
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float,
				{ buffer = ev.buf, desc = "[LSP] Show diagnostic" })
			vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[LSP] Rename" })
			vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action,
				{ desc = "[LSP] Show Code Actions", buffer = ev.buf, noremap = true, silent = true })

			local on_attach = require("lsp-format").on_attach
			on_attach(client, bufnr)
		end,
	})
end

return M
