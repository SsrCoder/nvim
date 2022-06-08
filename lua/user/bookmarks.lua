vim.g.bookmark_no_default_key_mappings = 1

-- toggle bookmark
vim.api.nvim_set_keymap("n", "<Leader>mm", "<Plug>BookmarkToggle", { noremap = true, silent = true })
