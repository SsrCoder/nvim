vim.pack.add {
	"https://github.com/folke/todo-comments.nvim",
}

require("todo-comments").setup {}

-- search TODOs with snacks.picker
vim.keymap.set("n", "<leader>st", function()
	Snacks.picker.grep({ search = "TODO|FIXME|HACK|PERF|NOTE|WARN" })
end, { desc = "Search TODOs" })
