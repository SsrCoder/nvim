local M = {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = true,
	cmd = { "Neotree" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
}

return M