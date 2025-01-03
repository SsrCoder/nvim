local M = {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}

function M.config()
	require("dashboard").setup {
		theme = 'hyper',
		config = {
			project = {
				enable = true,
				action = function(path)
					vim.cmd('Telescope find_files cwd=' .. path)
					vim.fn.chdir(path)
				end
			},
		},
	}
end

return M
