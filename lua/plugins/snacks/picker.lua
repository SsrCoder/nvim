-- @see: https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#general
local M = {
	"folke/snacks.nvim",
	---@module 'snacks'
	---@type snacks.Config
	opts = {
		picker = {
			-- your picker configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	keys = {
		{ "gd",    function() Snacks.picker.lsp_definitions() end,     desc = "Goto Definition", nowait = true, },
		{ "gr",    function() Snacks.picker.lsp_references() end,      desc = "Goto References", nowait = true, },
		{ "gi",    function() Snacks.picker.lsp_implementations() end, desc = "Goto Implement",  nowait = true, },

		{ "<C-f>", function() Snacks.picker.grep() end,                desc = "LiveGrep", },
		{ "<C-p>", function() Snacks.picker.files() end,               desc = "Find Files", },
	},
}

return M
