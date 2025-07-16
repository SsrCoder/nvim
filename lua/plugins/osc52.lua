local M = {
	"ojroques/nvim-osc52",

	keys = {
		{ "gy", require('osc52').copy_visual, mode = "x", desc = "[OSC52] Copy To Clipboard", silent = true, },
	}
}

return M
