local M = {
	'MeanderingProgrammer/render-markdown.nvim',
	cmd = { "RenderMarkdown" },
	event = { "VeryLazy" },
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons'
	},
}

function M.config()
	vim.cmd [[RenderMarkdown]]

	require("render-markdown").setup {
		enable = true,
		file_types = { "markdown" },
	}
end

return M
