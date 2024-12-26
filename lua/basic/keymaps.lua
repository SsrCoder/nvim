opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "x" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("i", "jj", "<Esc>", opts)

vim.keymap.set({ "n", "x" }, "gy", '"+y', opts) -- copy to clipboard
vim.keymap.set({ "n", "x" }, "gp", '"+p', opts) -- parse from clipboard

vim.keymap.set({'n', 'x'}, 'x', '"_x', opts) -- keep registers
vim.keymap.set({'n', 'x'}, 'X', '"_d', opts) -- keep registers

vim.keymap.set('v', 'p', '"_dP', opts) -- keep yink text

vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- resize window
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<Leader>x', ':bdelete!<CR>', opts)
vim.keymap.set('n', '<Leader>b', ':enew<CR>', opts)

-- diagnostic
vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, opts)
