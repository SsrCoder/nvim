local M = {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
	require("todo-comments").setup {}

	require("which-key").add {
		{ "<Leader>t", ":TodoFzfLua<CR>", desc = "List Todos" },
	}
end

return M
