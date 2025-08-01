---@See: https://github.com/chrisgrieser/nvim-origami
local M = {
	"chrisgrieser/nvim-origami",
	event = { "BufReadPost", "BufNewFile" },

	init = function()
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
	end,

	opts = {
		useLspFoldsWithTreesitterFallback = true,
		autoFold = {
			enabled = false,
		},
		foldKeymaps = {
			setup = false, -- modifies `h` and `l`
			hOnlyOpensOnFirstColumn = false,
		},
	},
}

return M
