local switch_words = {
	{ "true", "false" },
	{ "on", "off" },
	{ "yes", "no" },
	{ "disable", "enable" },
	{ "+", "-" },
	{ ">", "<" },
	{ "=", "!=" },
}

local push_words = {}
for _, value in ipairs(switch_words) do
	local w1, w2 = value[1], value[2]
	-- 全小写
	table.insert(push_words, value)
	-- 全大写
	table.insert(push_words, { string.upper(w1), string.upper(w2) })
	-- 首字母大写，%l 代表小写字母，只取第一个
	w1, _ = string.gsub(w1, "^%l", string.upper)
	w2, _ = string.gsub(w2, "^%l", string.upper)
	table.insert(push_words, { w1, w2 })
end

vim.g.switch_custom_definitions = push_words

-- 快速取反意单词，如 true 变为 false
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "gs", ":Switch<CR>", opts)
