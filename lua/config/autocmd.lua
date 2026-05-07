vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		-- 检查 LSP 客户端是否支持格式化
		if client and client:supports_method("textDocument/formatting") then
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({
						bufnr = args.buf,
						id = client.id,
						-- 设置超时时间（毫秒）
						timeout_ms = 2000
					})
				end,
			})
		end
	end,
})


vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		vim.defer_fn(function()
			vim.diagnostic.show(nil, 0) -- 0 表示当前缓冲区
		end, 100)              -- 100ms 延迟通常足够
	end,
})
