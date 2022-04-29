local ok, hop = pcall(require, "hop")
if not ok then
	return
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- 搜索并跳转到单词
keymap("n", "<leader>hw", "<cmd>HopWord<CR>", opts)
-- 搜索并跳转到行
keymap("n", "<leader>hl", "<cmd>HopLine<CR>", opts)
-- 搜索并跳转到字符
keymap("n", "<leader>hc", "<cmd>HopChar1<CR>", opts)

hop.setup({
	keys = "etovxqpdygfblzhckisuran",
})
