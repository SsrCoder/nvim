vim.pack.add {
	"https://github.com/lewis6991/gitsigns.nvim"
}

require('gitsigns').setup {
	current_line_blame = true,
}

-- :Gitsigns preview_hunk
vim.api.nvim_create_user_command('GitPreviewHunk', ':Gitsigns preview_hunk<CR>', {})
