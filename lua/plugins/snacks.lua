---@See https://github.com/folke/snacks.nvim
local M = {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		scope = {
			enabled = true,
		},
		---@See https://github.com/folke/snacks.nvim/blob/main/docs/indent.md
		indent = {
			enabled = true,
			---@class snacks.indent.Scope.Config: snacks.scope.Config
			scope = {
				enabled = true, -- enable highlighting the current scope
				priority = 200,
				char = "│",
				underline = false, -- underline the start of the scope
				only_current = false, -- only show scope in the current window
				hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
			},
			chunk = {
				enable = false,
				priority = 200,
				hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
				char = {
					corner_top = "┌",
					corner_bottom = "└",
					-- corner_top = "╭",
					-- corner_bottom = "╰",
					horizontal = "─",
					vertical = "│",
					arrow = ">",
				},
			},
		},
	},
}

return M
