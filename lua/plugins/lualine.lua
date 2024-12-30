local M = {
	'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}

function M.config()
	require('lualine').setup {}
end

-- FIXME: disable lualine in neotree window

return M

