local M = {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
	local fzf = require("fzf-lua")
	fzf.setup {}
	opts = { noremap = true, silent = true }
	-- vim.keymap.set('n', '<C-f>', ':')
	vim.keymap.set('n', '<C-p>', function() fzf.files({ cwd_prompt = false, prompt = "Files❯ " }) end, opts)
	vim.keymap.set('n', '<C-f>', function() fzf.live_grep({ cwd_prompt = false, prompt = "LiveGrep❯ " }) end, opts)
end

return M
