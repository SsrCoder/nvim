local M = {
	'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}

function M.config()
	require('lualine').setup {
		sections = {
			lualine_c = {
				function()
					return require("lsp-progress").progress()
				end,
			},
		},
	}

	-- listen lsp-progress event and refresh lualine
	vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
	vim.api.nvim_create_autocmd("User", {
	  group = "lualine_augroup",
	  pattern = "LspProgressStatusUpdated",
	  callback = require("lualine").refresh,
	})
end

-- FIXME: disable lualine in neotree window

return M

