local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- map leader
keymap("n", "<Space>", "<NOP>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keymap("v", "<C-c>", ":OSCYank<CR>", opts)
keymap("v", "<C-c>", '"+y', opts)

keymap("i", "jj", "<Esc>", opts)

keymap("n", "J", "5j", opts)
keymap("n", "K", "5k", opts)
keymap("v", "J", "5j", opts)
keymap("v", "K", "5k", opts)
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)

keymap("n", ";", ":", opts)
keymap("n", "<Space><CR>", ":nohlsearch<CR>", opts)

-- window movement
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Move text up and down
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)

-- tab switch buffer
-- keymap("n", "<Tab>", ":bnext<CR>", opts)
-- keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- tab complete
keymap("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { noremap = true, silent = true, expr = true })
keymap("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { noremap = true, silent = true, expr = true })
