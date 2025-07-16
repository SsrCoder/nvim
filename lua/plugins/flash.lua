---@See https://github.com/folke/flash.nvim
local M = {
	"folke/flash.nvim",
	event = { "BufReadPost", "BufNewFile" },
	---@module "flash"
	---@type Flash.Config
	opts = {},
	keys = {

	},
}

return M
