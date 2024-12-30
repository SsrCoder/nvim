local nord_module = {
	"shaunsingh/nord.nvim",
	lazy = false,
	priority = 1000,
}

function nord_module.config()
	-- Example config in lua
	vim.g.nord_contrast = true
	vim.g.nord_borders = false
	vim.g.nord_disable_background = false
	vim.g.nord_italic = false
	vim.g.nord_uniform_diff_background = true
	vim.g.nord_bold = false

	-- Load the colorscheme
	require('nord').set()
end

-- TODO: lualine nord theme


local tokyonight_module = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
}

function tokyonight_module.config()
	vim.cmd.colorscheme(COLORSCHEME)
end

local COLORSCHEME_PACKAGE_MAP = {
	nord = nord_module,
	tokyonight = tokyonight_module,
}

return COLORSCHEME_PACKAGE_MAP[COLORSCHEME]
