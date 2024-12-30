-- Maybe you will confuse about why <C-i> can not jump to forward anymore,
-- As a terminal emulator, when user press a button, the application got some ascii code,
-- <Tab> button and <C-i> button will got the same ascii text, and cannot separate.
--
-- To separate <C-i> from <tab>, you need your terminal support:
--		Windows Terminal: edit your settings.json, and add the following text in the list "actions": { "command": { "action": "sendInput", "input": "\u001b[105;5u" }, "keys": "ctrl+i"}
--
-- Or, you can map <C-i> to a button unused like 'F12' in your system, an remap 'F12' as <C-i> in your vim config

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

vim.keymap.set('n', '<C-i>', '<C-i>', opts)
