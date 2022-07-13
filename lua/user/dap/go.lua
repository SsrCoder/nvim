local ok, dap_go = pcall(require, "dap-go")
if not ok then
	return
end

vim.api.nvim_set_keymap("n", "<leader>td", ":lua require('dap-go').debug_test()<CR>", { noremap = true, silent = true })
dap_go.setup({})
