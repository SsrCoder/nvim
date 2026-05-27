vim.pack.add {
	"https://github.com/folke/which-key.nvim",
}

require("which-key").setup {
	-- delay before which-key pops up (ms)
	delay = 300,
	-- show all keymaps matching the prefix
	spec = {},
	-- replace <leader> with this icon
	icons = {
		breadcrumb = "»",
		separator = "→",
		group = "+",
	},
}
