local M = {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			lazy = true
		},
		{
			"nvim-telescope/telescope-project.nvim",
		},
		{
			"nvim-telescope/telescope-file-browser.nvim"
		},
		{
			"nvim-lua/plenary.nvim",
		},
	},
}

key_table {
	{ "<C-f>",     "<cmd>Telescope live_grep<cr>",    desc = "Find string fzf" },
	{ "<C-p>",     "<cmd>Telescope find_files<cr>",   desc = "Find files" },

	{ "<Space>fs", "<cmd>Telescope grep_string<cr>",  desc = "Find string under your cursor" },
	{ "<Space>fk", "<cmd>Telescope keymaps<cr>",      desc = "Keymaps" },
	{ "<Space>fo", "<cmd>Telescope colorscheme<cr>",  desc = "Colorscheme" },
	{ "<Space>fc", "<cmd>Telescope commands<cr>",     desc = "Commands" },
	{ "<Space>fp", "<cmd>Telescope project<cr>",      desc = "Projects" },
	{ "<Space>fl", "<cmd>Telescope resume<cr>",       desc = "Last search" },
	{ "<Space>fr", "<cmd>Telescope oldfiles<cr>",     desc = "Recent file" },
	{ "<Space>fb", "<cmd>Telescope buffers<cr>",      desc = "Buffers" },
	{ "<Space>fe", "<cmd>Telescope file_browser<cr>", desc = "Buffers" },
	{ "<Space>ft", "<cmd>TodoTelescope<cr>",          desc = "TODOs" },

	{ "<Space>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
	{ "<Space>gs", "<cmd>Telescope git_status<cr>",   desc = "Open changed file" },
	{ "<Space>gc", "<cmd>Telescope git_commits<cr>",  desc = "Checkout commit" },
}


function M.config()
	local icons = require "basic.icons"
	local actions = require "telescope.actions"

	local telescope = require("telescope")
	telescope.setup {
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,
				},
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	}

	telescope.load_extension('project')
	telescope.load_extension('file_browser')
end

return M
