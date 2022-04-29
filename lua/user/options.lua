-- :help options

local options = {
	number = true,
	relativenumber = true,
	cursorline = true,
	encoding = "utf-8",
	fileencoding = "utf-8",
	hidden = true, -- hidden the save message when switch the buffer displayed which is not saved
	mouse = "a",
	hlsearch = true,
	showmatch = true,
	showcmd = true,
	showmode = false,
	wildmenu = true,
	showtabline = 2, -- always show tabs
	termguicolors = true,
	updatetime = 200,
	autoindent = true,
	smartindent = true,
	scrolloff = 5,
	tabstop = 4, -- set tab width
	shiftwidth = 4, -- set width when tap the tab key
	softtabstop = 4,
	expandtab = false,
	ignorecase = true,
	smartcase = true,
	spell = true,
	spelllang = "en_us,cjk",
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	undofile = true, -- enable persistent undo
	wrap = false, -- disable auto wrap line
	completeopt = { "menu", "menuone", "noselect" },
	-- cmdheight = 2,
	sidescroll = 1, -- The cursor moves smoothly to the left and right boundaries
	sidescrolloff = 20,
	maxmempattern = 2000000, -- set the max character when search pattern
	list = true,
	backup = false,
	-- clipboard = 'unnamedplus',
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	-- completeopt = "menuone,noinsert,noselect",
	foldenable = true,
	foldmethod = "indent",
	foldlevel = 100,
	signcolumn = "yes",
	syntax = "enable",
	colorcolumn = "80",
	autoread = true,
	whichwrap = "<,>,[,]",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.shortmess:append("c")
-- vim.opt.listchars:append("tab:»·")
-- vim.opt.listchars:append("trail:·")
-- vim.opt.listchars:append("space:·")
-- vim.opt.listchars:append("nbsp:·")
-- vim.opt.listchars:append("eol:¬")

-- indent line on tab
-- vim.cmd [[set list lcs=tab:\▏\ ]]
vim.cmd([[set whichwrap+=<,>,[,],h,l]])
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]])
