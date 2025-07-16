local M = {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		ignored_next_char = "[%w%.]",
	},
}

return M
