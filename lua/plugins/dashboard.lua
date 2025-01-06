local M = {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}

function M.config()
	require("dashboard").setup {
		theme = 'hyper',
		config = {
			project = {
				enable = true,
				action = function(path)
					local fzf_ok, fzf = pcall(require, "fzf-lua")
					if fzf_ok then
						fzf.files({ cwd_prompt = false, prompt = 'Files❯ ' })
					elseif pcall(require, "telescope") then
						vim.cmd('Telescope find_files cwd=' .. path)
					end
					vim.fn.chdir(path)
				end
			},
		},
	}
end

return M
