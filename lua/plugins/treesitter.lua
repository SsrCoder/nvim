local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
}

function M.config()
	require('nvim-treesitter.configs').setup {
		ensure_installed = { 'lua' },
		sync_install = false,
		auto_install = true,
	}
end

return M

