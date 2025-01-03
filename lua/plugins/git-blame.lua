local M = {
	"f-person/git-blame.nvim",
	event = "VeryLazy",
}

function M.config()
	require("gitblame").setup {
		enable = true,
		message_template = "<author> <<date>> : <summary>",
		date_format = "%Y-%m-%d %X",
	}
end

return M
