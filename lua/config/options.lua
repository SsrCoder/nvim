vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.termguicolors = true
vim.opt.wrap = false

-- number
vim.opt.number = true
vim.opt.relativenumber = true

-- tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
-- vim.opt.expandtab = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- scroll
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

-- show whitespace
-- vim.opt.list = true

vim.wo.cursorline = true
vim.opt.colorcolumn = { 100 }

local hasOSC52, _ = pcall(require, "vim.ui.clipboard.osc52")
if hasOSC52 then
	vim.g.clipboard = {
		name = 'OSC 52',
		copy = {
			['+'] = require('vim.ui.clipboard.osc52').copy('+'),
			['*'] = require('vim.ui.clipboard.osc52').copy('*'),
		},
		paste = {
			['+'] = require('vim.ui.clipboard.osc52').paste('+'),
			['*'] = require('vim.ui.clipboard.osc52').paste('*'),
		},
	}
end
