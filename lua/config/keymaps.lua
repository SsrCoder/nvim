local opts = { noremap = true, silent = true, }

vim.keymap.set("i", "jj", "<Esc>", opts)

vim.keymap.set("i", "<C-h>", "<Left>", opts)
vim.keymap.set("i", "<C-l>", "<Right>", opts)
vim.keymap.set("i", "<C-j>", "<Down>", opts)
vim.keymap.set("i", "<C-k>", "<Up>", opts)

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)

vim.keymap.set("x", ">", ">gv", opts)
vim.keymap.set("x", "<", "<gv", opts)

vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)

-- abort replace clipboard register ", see: help v_p
vim.keymap.set("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end, { noremap = true, expr = true })

-- system clipboard
vim.keymap.set("x", "gy", '"+y', opts)
vim.keymap.set("n", "gy", '"+yy', opts)
vim.keymap.set("n", "gp", '"+p', opts)


vim.keymap.set("n", "gy", '"+yy', opts)
vim.keymap.set("n", "gy", '"+yy', opts)



local line_suffix_map = {
	["c"] = ";",
	["rust"] = ";",
	["java"] = ";",
}

local function append_suffix_and_newline()
	local ft = vim.bo.filetype
	local current_row = vim.api.nvim_win_get_cursor(0)[1]
	local line_content = vim.api.nvim_buf_get_lines(0, current_row - 1, current_row, false)[1]
	local line_length = string.len(line_content)

	vim.api.nvim_win_set_cursor(0, { current_row, line_length + 1 })

	local line_suffix = line_suffix_map[ft]
	if line_suffix == nil then
		return
	end


	if not string.match(line_content, line_suffix .. "$")
		and not string.match(line_content, "^%s+$")
	then
		-- vim.api.nvim_put({ line_suffix }, "c", true, true)
		vim.fn.feedkeys(line_suffix, 'n')
	end

	local enter_key = vim.api.nvim_replace_termcodes('<CR>', true, false, true)
	vim.fn.feedkeys(enter_key, 'n')

	-- TODO: support line comment
end

vim.keymap.set({ "i", "n" }, "<C-Enter>", append_suffix_and_newline, opts)
