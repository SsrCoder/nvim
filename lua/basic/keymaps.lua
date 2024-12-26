opt = { noremap = true, silent = true }
vim.keymap.set("i", "jj", "<Esc>", opt)

vim.keymap.set({ "n", "x" }, "gy", '"+y', opt) -- copy to clipboard
vim.keymap.set({ "n", "x" }, "gp", '"+p', opt) -- parse from clipboard


vim.keymap.set({'n', 'x'}, 'x', '"_x', opt)
vim.keymap.set({'n', 'x'}, 'X', '"_d', opt)


