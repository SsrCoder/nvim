local M = {
	"goolord/alpha-nvim",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
}

function M.config()
	require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
end

return M
