local M = {
	"Exafunction/codeium.vim",
	event = "InsertEnter",
}

function M.config()
	vim.g.codeium_disable_bindings = 1

	vim.keymap.set('i', '<C-l>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
	vim.keymap.set('i', '<C-]>', function() return vim.fn['codeium#CycleCompletions'](1) end,
		{ expr = true, silent = true, noremap = true })
	vim.keymap.set('i', '<C-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
		{ expr = true, silent = true, noremap = true })
	vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
end

return M
