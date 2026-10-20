-- Install:
--	npm install -g yaml-language-server

vim.lsp.config('yamlls', {
	-- cmd = { 'jsonnet-language-server' },
	-- filetypes = { "jsonnet", "libsonnet" },
	-- settings = {
	-- },
})

vim.lsp.enable('yamlls')
