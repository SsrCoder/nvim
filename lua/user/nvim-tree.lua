local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<Space>e", ":NvimTreeFindFileToggle<CR>", opts)

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	auto_reload_on_write = true,
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
			},
		},
		number = false,
		relativenumber = false,
	},
	actions = {
		open_file = {
			quit_on_open = true, -- closes the explorer when opening a file
			resize_window = true,
		},
		change_dir = {
			enable = false,
			global = false,
			restrict_above_cwd = false,
		},
	},
	renderer = {
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
})

vim.cmd([[
augroup AutoCloseNvimTree
	autocmd!
	autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
augroup END
]])
