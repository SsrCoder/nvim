local config_group = vim.api.nvim_create_augroup("Go language config", { clear = true })

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "go",
	group = config_group,

	callback = function()
		local ok, go = pcall(require, "go")

		if not ok then
			return
		end

		vim.api.nvim_set_keymap("n", "<Leader>lc", ":GoCmt<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<Leader>ls", ":GoFillStruct<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<Leader>lw", ":GoFillSwitch<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<Leader>le", ":GoIfErr<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<Leader>lp", ":GoFixPlurals<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<Leader>li", ":GoInstallBinaries<CR>", { noremap = true, silent = true })

		vim.api.nvim_set_keymap("n", "<Leader>ltj", ":GoAddTag json<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<Leader>ltt", ":GoAddTag toml<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<Leader>ltr", ":GoRmTag ", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<Leader>ltc", ":GoClearTag ", { noremap = true, silent = true })

		go.setup({
			comment_placeholder = "ﳑ ", -- comment_placeholder your cool placeholder e.g. ﳑ    
		})
	end,
})
