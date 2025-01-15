local M = {
	'akinsho/bufferline.nvim',
	event = { "BufEnter" },
	dependencies = 'nvim-tree/nvim-web-devicons',
}

function M.config()
	require('bufferline').setup {
		options = {
			mode = 'buffers', -- tabs, buffers
		},
	}
end

return M
