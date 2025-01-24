local M = {
	"zbirenbaum/copilot.lua",
	build = ":Copilot auth",
	cmd = { "Copilot" },
	event = "InsertEnter",
}

function M.config()
	require("copilot").setup {
		panel = {
			enable = false,
			auto_fresh = true,
		},
		suggestion = {
			enable = false,
			auto_trigger = false,
		},
		filetypes = {
			markdown = true,
			help = true,
		},
	}
end

return M
