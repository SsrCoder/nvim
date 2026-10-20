-- Install:
--	npm install -g yaml-language-server

vim.lsp.config('jsonnet_ls', {
	cmd = { 'jsonnet-language-server' },
	filetypes = { "jsonnet", "libsonnet" },
	settings = {
	},
})

vim.lsp.enable('jsonnet_ls')
