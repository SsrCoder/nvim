local M = {
	"stevearc/conform.nvim",
	event = { "LspAttach", "BufNewFile", "BufReadPre" },
	opts = {
		formatters_by_ft = {
			markdown = { "prettierd" },
		},
		format_on_save = {
			lsp_fallback = true, -- 如果 conform 没有找到格式化器，则回退到 LSP 格式化
			async = false, -- 同步格式化，避免保存后文件内容跳动
			timeout_ms = 1000,
		},
	},
}

return M
