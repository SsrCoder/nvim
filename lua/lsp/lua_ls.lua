-- Install: 
--		MacOS: `brew install lua-language-server`

vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			diagnostics = {
				globals = { 'vim', 'Snacks' },
			},
		},
	},
})

vim.lsp.enable('lua_ls')
