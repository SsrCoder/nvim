local M = {
	"numToStr/Comment.nvim",
	-- lazy = false,
	event = "VeryLazy",
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			event = "VeryLazy",
		},
	}
}

-- key("gcc", { "<Plug>(comment_toggle_linewise_current)", "Commnet" })
-- key("gc", { "<Plug>(comment_toggle_linewise_visual)", "Commnet", mode = "v" })

function M.config()
	vim.g.skip_ts_context_commentstring_module = true
	require("ts_context_commentstring").setup {
		enable_autocmd = false,
	}

	require("Comment").setup {
		pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
	}

end

return M
