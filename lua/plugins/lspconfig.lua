local M = {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp", "lukas-reineke/lsp-format.nvim" },
	-- dependencies = { "saghen/blink.cmp" },
	event = { "BufReadPre", "BufNewFile" },
}

function M.config()
	vim.diagnostic.config({
		virtual_text = true,
	})

	local capabilities = require("blink.cmp").get_lsp_capabilities()
	local lspconfig = require("lspconfig")

	local on_attach = require("lsp-format").on_attach
	lspconfig['lua_ls'].setup({ capabilities = capabilities, on_attach = on_attach })
	lspconfig['gopls'].setup({ capabilities = capabilities, on_attach = on_attach })
	-- lspconfig['lua_ls'].setup({ capabilities = capabilities })

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float,
				{ buffer = ev.buf, desc = "[LSP] Show diagnostic" })
			vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[LSP] Rename" })
		end,
	})
end

return M
