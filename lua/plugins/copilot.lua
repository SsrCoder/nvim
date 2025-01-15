local M = {
	"zbirenbaum/copilot.lua",
	build = ":Copilot auth",
	cmd = { "Copilot" },
	event = "InsertEnter",
}

function M.config()
	require("copilot").setup {
		panel = {
			enable = true,
			auto_fresh = true,
		},
		suggestion = {
			enable = true,
			auto_trigger = true,
		}
	}
end

return M
