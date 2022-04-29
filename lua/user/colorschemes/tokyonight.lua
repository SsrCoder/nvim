if vim.g.colors_name ~= "tokyonight" then
	return
end

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true

vim.cmd([[colorscheme tokyonight]])
