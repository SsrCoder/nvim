local M = {
	"chrisgrieser/nvim-origami",
	event = { "BufReadPost", "BufNewFile" },

	init = function()
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
	end,

	opts = {
		useLspFoldsWithTreesitterFallback = true,
	},
}

return M
