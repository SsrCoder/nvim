local nord_module = {
	"shaunsingh/nord.nvim",
	lazy = false,
	priority = 1000,
}

function nord_module.config()
	vim.cmd.colorscheme(colorscheme)
end

-- TODO: lualine nord theme


local tokyonight_module = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
}

function tokyonight_module.config()
	vim.cmd.colorscheme(colorscheme)
end

local COLORSCHEME_PACKAGE_MAP = {
	nord = nord_module,
	tokyonight = tokyonight_module,
}

return COLORSCHEME_PACKAGE_MAP[colorscheme]
