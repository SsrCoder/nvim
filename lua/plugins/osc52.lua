local M = {
	"ojroques/nvim-osc52",
}


function M.config()
	vim.keymap.set('v', '<C-c>', require('osc52').copy_visual)
	require("osc52").setup {}
end

return M
