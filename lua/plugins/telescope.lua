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
			"nvim-lua/plenary.nvim",
		},
	},
}

key_table {
	["<C-f>"] = { "<cmd>Telescope live_grep<cr>", "Find string fzf" },
	["<C-p>"] = { "<cmd>Telescope find_files<cr>", "Find files" },

	["<Space>fs"] = { "<cmd>Telescope grep_string<cr>", "Find string under your cursor" },
	["<Space>fk"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	["<Space>ft"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
	["<Space>fc"] = { "<cmd>Telescope commands<cr>", "Commands" },
	["<Space>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Commands" },
	["<Space>fl"] = { "<cmd>Telescope resume<cr>", "Last search" },
	["<Space>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent file" },
	["<Space>fb"] = { "<cmd>Telescope buffers<cr>", "Buffers" },

	["<Space>gb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	["<Space>gs"] = { "<cmd>Telescope git_status<cr>", "Open changed file" },
	["<Space>gc"] = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
}


function M.config()
	local icons = require "basic.icons"
	local actions = require "telescope.actions"

	require("telescope").setup {
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
end

return M
