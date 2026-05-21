vim.pack.add {
	"https://github.com/dnlhc/glance.nvim"
}

require('glance').setup {
	border = {
		enable = true,
	},
	hooks = {
		before_open = function(results, open, jump, method)
			if #results == 1 then
				jump(results[1])
			else
				open(results)
			end
		end,
	}
}

-- lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }
		vim.keymap.set('n', 'gd', '<CMD>Glance definitions<CR>', opts)
		vim.keymap.set('n', 'gr', '<CMD>Glance references<CR>', opts)
		vim.keymap.set('n', 'gi', '<CMD>Glance implementations<CR>', opts)
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
	end,
})
