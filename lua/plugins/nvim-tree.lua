local M = {
	"nvim-tree/nvim-tree.lua",
	-- event = "VeryLazy",
	cmd = { "NvimTreeToggle" }
}

key("<Space>e", { "<cmd>NvimTreeToggle<CR>", "Explorer" })

-- local wk = require "which-key"
-- wk.register {
-- 	["<Space>e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" }
-- }

function M.config()
	require("nvim-tree").setup {
		disable_netrw = true,
		sync_root_with_cwd = true,
	}
end

return M
