local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
	return
end

local ui_ok, dapui = pcall(require, "dapui")
if not ui_ok then
	return
end

dapui.setup({
	sidebar = {
		position = "right",
	},
})

-- 如果开启或关闭调试，则自动打开或关闭调试界面
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
	dap.repl.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
	dap.repl.close()
end

-- 显示或隐藏调试界面
vim.api.nvim_set_keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", { noremap = true, silent = true })
