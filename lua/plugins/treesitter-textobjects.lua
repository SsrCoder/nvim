--@See: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
local M = {
	"nvim-treesitter/nvim-treesitter-textobjects"
}

function M.config()
	require 'nvim-treesitter.configs'.setup {
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>sp"] = "@parameter.inner",
				},
				-- swap_previous = {
				-- 	["<leader>spp"] = "@parameter.inner",
				-- },
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]f"] = "@function.outer",
					["]p"] = "@parameter.inner",
				},
				goto_next_end = {
					["]F"] = "@function.outer",
				},
				goto_previous_start = {
					["[f"] = "@function.outer",
					["[p"] = "@parameter.inner",
				},
				goto_previous_end = {
					["[F"] = "@function.outer",
				},
				goto_next = {
				},
				goto_previous = {
				}
			},
		},
	}
end

function test(c, b, a)
	print(b, c, a)
end

return M
