-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("i", "jj", "<Esc>", opts)
map("n", "<C-p>", ":lua require('fzf-lua').files({ cwd_prompt = false, prompt = 'Files❯ '})<CR>", opts)
map("n", "<C-f>", ":lua require('fzf-lua').live_grep({ cwd_prompt = false, prompt = 'LiveGrep❯ '})<CR>", opts)
