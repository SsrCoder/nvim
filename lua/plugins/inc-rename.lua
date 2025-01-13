local M = {
	"smjonas/inc-rename.nvim",
	event = "VeryLazy",
	cmd = "IncRename",
}

function M.config()
	require("inc_rename").setup {
		input_buffer_type = "dressing",
	}

	require("which-key").add {
		{ "<leader>rn", function()
			return ":IncRename " .. vim.fn.expand("<cword>")
		end
		, desc = "Rename", expr = true }
	}
end

return M
