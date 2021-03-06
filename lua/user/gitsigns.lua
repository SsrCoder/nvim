local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

vim.api.nvim_set_keymap("n", "<leader>gj", "<cmd>Gitsigns next_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gk", "<cmd>Gitsigns prev_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gw", "<cmd>Gitsigns toggle_word_diff<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gU", "<cmd>Gitsigns undo_stage_buffer<CR>", { noremap = true, silent = true })

gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 0,
		ignore_whitespace = false,
	},
	current_line_blame_formatter_opts = {
		relative_time = false,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
})
