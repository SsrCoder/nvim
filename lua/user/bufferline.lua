local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-q>", "<cmd>Bdelete!<CR>", opts)
-- keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)
-- keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", opts) -- this will cause <C-i> works wrong

keymap("n", "<Leader>bd", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<Leader>bp", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "<Leader>bn", "<cmd>BufferLineCycleNext<CR>", opts)

keymap("n", "<Leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<Leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<Leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<Leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<Leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<Leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<Leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<Leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<Leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", opts)

bufferline.setup({
	options = {
		numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		-- NOTE: this plugin is designed with this icon in mind,
		-- and so changing this is NOT recommended, this is intended
		-- as an escape hatch for people who cannot bear it for whatever reason
		indicator_icon = "▎",
		buffer_close_icon = "",
		-- buffer_close_icon = '',
		modified_icon = "●",
		close_icon = "",
		-- close_icon = '',
		left_trunc_marker = "",
		right_trunc_marker = "",
		--- name_formatter can be used to change the buffer's label in the bufferline.
		--- Please note some names can/will break the
		--- bufferline so use this at your discretion knowing that it has
		--- some limitations that will *NOT* be fixed.
		-- name_formatter = function(buf)	-- buf contains a "name", "path" and "bufnr"
		--	 -- remove extension from markdown files for example
		--	 if buf.name:match('%.md') then
		--		 return vim.fn.fnamemodify(buf.name, ':t:r')
		--	 end
		-- end,
		max_name_length = 30,
		max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
		tab_size = 21,
		diagnostics = false, -- | "nvim_lsp" | "coc",
		diagnostics_update_in_insert = false,
		-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
		--	 return "("..count..")"
		-- end,
		-- NOTE: this will be called a lot so don't do any heavy processing here
		-- custom_filter = function(buf_number)
		--	 -- filter out filetypes you don't want to see
		--	 if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
		--		 return true
		--	 end
		--	 -- filter out by buffer name
		--	 if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
		--		 return true
		--	 end
		--	 -- filter out based on arbitrary rules
		--	 -- e.g. filter out vim wiki buffer from tabline in your work repo
		--	 if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
		--		 return true
		--	 end
		-- end,
		offsets = { { filetype = "NvimTree", text = "NvimTree", padding = 1 } },
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = "slant", -- "padded_slant" | "thick" | "thin" | { "any", "any" },
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		-- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
		--	 -- add custom logic
		--	 return buffer_a.modified > buffer_b.modified
		-- end
	},
})
