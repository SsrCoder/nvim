vim.pack.add {
	"https://github.com/folke/trouble.nvim",
}

require("trouble").setup {}

vim.keymap.set("n", "<leader>xx", function()
	Trouble.toggle()
end, { desc = "Toggle diagnostics" })

vim.keymap.set("n", "<leader>xw", function()
	Trouble.toggle("workspace_diagnostics")
end, { desc = "Workspace diagnostics" })

vim.keymap.set("n", "<leader>xd", function()
	Trouble.toggle("document_diagnostics")
end, { desc = "Document diagnostics" })

vim.keymap.set("n", "<leader>xq", function()
	Trouble.toggle("quickfix")
end, { desc = "Quickfix list" })

vim.keymap.set("n", "<leader>xl", function()
	Trouble.toggle("loclist")
end, { desc = "Location list" })

vim.keymap.set("n", "gR", function()
	Trouble.toggle("lsp_references")
end, { desc = "LSP references" })
