local ok, autosave = pcall(require, "autosave")
if not ok then
	vim.notify("Could not load autosave module")
	return
end

autosave.setup({
	enabled = true,
	-- 触发自动保存的事件（退出插入模式或者普通模式下文本内容发生改变）
	-- events = { "InsertLeave", "TextChanged" },
	events = { "InsertLeave" },
	-- 自动保存时的提示信息
	execution_message = "",
	conditions = {
		exists = true,
		-- 忽略自动保存的文件名字或文件类型
		filename_is_not = { "plugins.lua" },
		filetype_is_not = {},
		modifiable = true,
	},
	-- 保存时写入全部的 Buffer
	write_all_buffers = false,
	on_off_commands = true,
	clean_command_line_interval = 0,
	debounce_delay = 135,
})
