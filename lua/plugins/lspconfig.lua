local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "folke/neodev.nvim" },
		{ "lukas-reineke/lsp-format.nvim", lazy = true, cmd = "Format" },
	},
}

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap

	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "<C-d>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap(bufnr, "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	require("lsp-format").on_attach(client, bufnr)

	if client.name == 'gopls' then
		vim.api.nvim_command(
			"au BufWritePre <buffer> lua vim.lsp.buf.code_action({ source = { organizeImports = true } })")
	end

	-- there occur an error when edit a new file, so comment these lines unitl fix it
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(bufnr, true)
	end
end

local servers = {
	"lua_ls",
	"pyright",
	"gopls",
	"jsonls",
	"bashls",
	"rust_analyzer",
}

function M.common_capabilities()
	local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if status_ok then
		return cmp_nvim_lsp.default_capabilities()
	end

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return capabilities
end

local icons = require "basic.icons"
local default_diagnostic_config = {
	signs = {
		active = true,
		values = {
			{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
			{ name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
			{ name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
			{ name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
		},
	},
	virtual_text = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

function M.config()
	local lspconfig = require "lspconfig"

	-- repeat save noti when multi windows, so comment this
	-- format on save sync when :wq command
	require("lsp-format").setup {}
	vim.cmd [[cabbrev wq execute "Format sync" <bar> wq]]

	vim.diagnostic.config(default_diagnostic_config)
	for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config() or {}, "signs", "values") or {}) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	end

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

	require("lspconfig.ui.windows").default_options.border = "rounded"

	for _, server in pairs(servers) do
		local opts = {
			on_attach = M.on_attach,
			capabilities = M.common_capabilities(),
		}

		local require_ok, settings = pcall(require, "lsp_settings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", settings, opts)
		end

		if server == "lua_ls" then
			require("neodev").setup {}
		end

		lspconfig[server].setup(opts)
	end
end

return M
