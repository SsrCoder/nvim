vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

---@type snacks.plugins.Config
local opts = {
	animate = {},
	dashboard = { enabled = false },
	explorer = {},
	terminal = {
		win = {
			style = "terminal",
		},
	},
	statuscolumn = {},
	profiler = {},
	picker = {},
	indent = { enabled = true },
	words = { enabled = true },
	notifier = { enabled = true },
	styles = {
		terminal = {
			position = "float",
			border = "rounded",
			wo = { winhighlight = "Normal:Normal,NormalFloat:Normal,FloatBorder:Normal" },
		},
	},
	-- image require magick command
	--  Install:
	--		MacOS: `brew install imagemagick`
	image = {
		enabled = true,
		doc = {
			enabled = true,
			inline = true,
		},
		resolve = function(file, src)
			-- 1. 如果是网络图片，直接返回 URL 字符串
			if vim.startswith(src, "http://") or vim.startswith(src, "https://") then
				return src
			end
			-- 2. 否则，将相对路径转换为绝对路径
			local abs = vim.fn.expandcmd(src)
			if vim.fn.filereadable(abs) == 1 then
				return abs
			end
			-- 3. 如果以上都不行，尝试以当前文件所在目录为基准进行解析
			local basedir = vim.fn.expand("%:p:h")
			local resolved = basedir .. "/" .. src
			if vim.fn.filereadable(resolved) == 1 then
				return resolved
			end
			-- 4. 都失败了就返回 nil，Snacks 会跳过这个链接
			return nil
		end,
	},
}

require('snacks').setup(opts)

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

-- -- lsp keymaps
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(args)
-- 		local opts = { buffer = args.buf }
-- 		vim.keymap.set('n', 'gd', function() Snacks.picker.lsp_definitions() end, opts)
-- 		vim.keymap.set('n', 'gr', function() Snacks.picker.lsp_references() end, opts)
-- 		vim.keymap.set('n', 'gi', function() Snacks.picker.lsp_implementations() end, opts)
-- 		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
-- 	end,
-- })
