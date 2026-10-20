-- Install:
--	brew install rust-analyzer

vim.lsp.config('rust_analyzer', {
	-- cmd = { '/opt/homebrew/bin/rust-analyzer' },
	settings = {
		['rust-analyzer'] = {
			check = {
				command = 'clippy',
			},
			procMacro = {
				enable = true,
			},
			diagnostics = {
				enable = true,
			},
		},
	},
})

vim.lsp.enable('rust_analyzer')
