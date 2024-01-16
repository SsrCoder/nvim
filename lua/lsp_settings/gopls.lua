return {
	-- keys = {
	-- 	-- Workaround for the lack of a DAP strategy in neotest-go: https://github.com/nvim-neotest/neotest-go/issues/12
	-- 	{ '<leader>td', "<cmd>lua require('dap-go').debug_test()<CR>", desc = 'Debug Nearest (Go)' },
	-- },
	settings = {
		-- https://github.com/golang/tools/blob/master/gopls/doc/settings.md
		gopls = {
			gofumpt = true,
			usePlaceholders = true,
			completeUnimported = true,
			staticcheck = true,
			directoryFilters = {
				'-.git',
				'-.vscode',
				'-.idea',
				'-.vscode-test',
				'-node_modules',
			},
			semanticTokens = true,
			codelenses = {
				gc_details = false,
				generate = true,
				regenerate_cgo = true,
				run_govulncheck = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			-- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
			analyses = {
				fieldalignment = true,
				nilness = true,
				unusedparams = true,
				unusedwrite = true,
				useany = true,
				-- fillreturns = true,
				-- nonewvars = true,
				-- shadow = true,
				-- undeclaredname = true,
				-- unusedvariable = true,
				-- ST1000 = false,
				-- ST1005 = false,
			},
		},
	},
}
