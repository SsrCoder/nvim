local M = {
    'nvim-telescope/telescope.nvim',
	event = { "VeryLazy" },
	dependencies = { 'nvim-lua/plenary.nvim' },
}

function M.config()
	local builtin = require('telescope.builtin')
	
	vim.keymap.set('n', '<C-p>', builtin.find_files)
	vim.keymap.set('n', '<C-f>', builtin.live_grep)

	local actions = require('telescope.actions')

	require('telescope').setup {
		defaults = {
			mappings = {
				i = {
					['<C-j>'] = actions.move_selection_next,
					['<C-k>'] = actions.move_selection_previous,
					['<C-l>'] = actions.select_default,
				},
			},
			pickers = {
				find_files = {
					file_ignore_patterns = {
						"node_modules",
						".git",
						".venv",
					},
					hidden = true,
				},
			},
		},
	}
end

return M
