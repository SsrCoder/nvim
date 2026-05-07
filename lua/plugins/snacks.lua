vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

local ok, snacks = pcall(require, "snacks")

if not ok then return end

---@type snacks.plugins.Config
local opts = {
	-- animate = {},
	explorer = {},
	terminal = {
		win = {
			position = "float",
			border = "rounded",
			wo = { winhighlight = "Normal:Normal,NormalFloat:Normal,FloatBorder:Normal" },
		},
	},
	statuscolumn = {},
	profiler = {},
	indent = { enabled = true },
	words = { enabled = true },
}

snacks.setup(opts)

-- explorer
vim.keymap.set('n', '<leader>e', function() Snacks.explorer() end)

-- picker
vim.keymap.set('n', '<C-p>', function() Snacks.picker.files() end)
vim.keymap.set('n', '<C-f>', function() Snacks.picker.grep() end)

-- terminal
vim.keymap.set({ 'n', 't' }, '<C-\\>', function() Snacks.terminal() end)

-- git
vim.keymap.set('n', '<leader>gb', function() Snacks.git.blame_line() end)
vim.keymap.set('n', '<leader>gB', function() Snacks.gitbrowse() end)

-- lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }
		vim.keymap.set('n', 'gd', function() Snacks.picker.lsp_definitions() end, opts)
		vim.keymap.set('n', 'gr', function() Snacks.picker.lsp_references() end, opts)
		vim.keymap.set('n', 'gi', function() Snacks.picker.lsp_implementations() end, opts)
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
	end,
})
