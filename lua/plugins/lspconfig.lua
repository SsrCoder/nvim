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

local function on_attach(client, bufnr)
	vim.keymap.set("n", "K", vim.lsp.buf.hover)
	vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float,
		{ buffer = bufnr, desc = "[LSP] Show diagnostic" })
	vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "[LSP] Rename" })
	vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action,
		{ desc = "[LSP] Show Code Actions", buffer = bufnr, noremap = true, silent = true })

	-- https://www.reddit.com/r/neovim/comments/1eyckqj/starting_with_inlay_hints_on_in_rust/
	vim.defer_fn(function()
		vim.lsp.inlay_hint.enable()
	end, 500)
end

function M.config()
	vim.diagnostic.config({
		virtual_text = true,
	})

	local capabilities = require("blink.cmp").get_lsp_capabilities()
	vim.lsp.config("*", {
		capabilities = capabilities,
	})

	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('LspConfigGroup', { clear = true }),
		callback = function(args)
			local bufnr = args.buf
			-- 通过 client_id 获取当前连接的 LSP 客户端
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if not client then
				return
			end

			on_attach(client, bufnr)
		end,
	})

	vim.lsp.enable(support_lsp, true)
end

return M
