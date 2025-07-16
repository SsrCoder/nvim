---@See https://github.com/3rd/image.nvim
---You should use a terminal supports Kitty's Graphics Protocol
---You may need to install magick_cli with command `brew install imagemagick`
local M = {
	"3rd/image.nvim",
	build = false,
	event = "VeryLazy",
	opts = {
		backend = "kitty",
		processor = "magick_cli",
		-- ... 其他配置 ...
		editor_integrations = {
			enabled = true,
			-- 对于 Neovim 弹出窗口的配置
			float_options = {
				-- 尝试设置 style 为 "minimal" 或 "transparent"
				-- 注意：这可能需要 image.nvim 的新版本支持
				style = "minimal", -- 或许能帮助，但更重要的是 highlight
				-- 设置浮动窗口的背景高亮组
				-- 尝试将其设置为你的 Neovim 默认背景高亮组
				-- 例如 "Normal" 或 "NormalFloat"
				border = "none", -- 如果不想要边框
				focusable = false,
				-- 关键是这里：设置背景高亮组
				winhighlight = "Normal:Normal,NormalFloat:NormalFloat,FloatBorder:NormalFloat",
				-- 或者直接设置为 Normal，让其继承 Neovim 主窗口的背景色
				-- winhighlight = "Normal:Normal",
			},
		},
		-- 如果你是通过 markdown 预览触发的，也要检查 markdown 集成设置
		integrations = {
			markdown = {
				enabled = true,
				floating_windows = true, -- 确保使用浮动窗口
				-- 如果 floating_windows 为 true，上面的 float_options 会生效
			},
		},
		-- 尝试禁用所有边框，有时边框的背景色会影响
		border_type = "none",
	},
}

return M
