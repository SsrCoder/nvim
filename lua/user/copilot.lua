local keymap = vim.api.nvim_set_keymap

keymap("i", "<C-l>", 'copilot#Accept("\\<CR>")', { noremap = true, silent = true, expr = true, script = true })
vim.g.copilot_no_tab_map = true
