local M = {
	"rmagatti/auto-session",
}

function M.config()
	require("auto-session").setup {
		-- auto_restore_enabled = true,
		-- auto_session_enable_last_session = true,
	}
end

return M
