local M = {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = true,
	cmd = { "Neotree" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
}

vim.keymap.set('n', '<Leader>e', ':Neotree toggle position=left<CR>', { noremap = true, silent = true })

function M.config()
	require('neo-tree').setup {}
end

-- FIXME: close neotree window when enter a file
-- FIXME: close neotree window when close other windows

return M
