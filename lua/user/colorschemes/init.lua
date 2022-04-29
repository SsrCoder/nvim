local colorscheme = "tokyonight"

local ok = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

require("user.colorschemes.tokyonight")
