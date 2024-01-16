local M = {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
}

function M.config()
	local notify = require "notify"
	vim.notify = notify

	notify.setup {}
end

return M
