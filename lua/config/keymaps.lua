local opts = { noremap = true, silent = true, }

vim.keymap.set("i", "jj", "<Esc>", opts)

vim.keymap.set("i", "<C-h>", "<Left>", opts)
vim.keymap.set("i", "<C-l>", "<Right>", opts)
vim.keymap.set("i", "<C-j>", "<Down>", opts)
vim.keymap.set("i", "<C-k>", "<Up>", opts)

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)

vim.keymap.set("x", ">", ">gv", opts)
vim.keymap.set("x", "<", "<gv", opts)

vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)

-- abort replace clipboard register ", see: help v_p
vim.keymap.set("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end, { noremap = true, expr = true })

-- system clipboard
vim.keymap.set("x", "gy", '"+y', opts)
vim.keymap.set("n", "gy", '"+yy', opts)
vim.keymap.set("n", "gp", '"+p', opts)


vim.keymap.set("n", "gy", '"+yy', opts)
vim.keymap.set("n", "gy", '"+yy', opts)
