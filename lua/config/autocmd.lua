-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
-- 	callback = function(args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
--
-- 		-- 检查 LSP 客户端是否支持格式化
-- 		if client and client:supports_method("textDocument/formatting") then
-- 			vim.api.nvim_create_autocmd("BufWritePre", {
-- 				buffer = args.buf,
-- 				callback = function()
-- 					vim.lsp.buf.format({
-- 						bufnr = args.buf,
-- 						id = client.id,
-- 						-- 设置超时时间（毫秒）
-- 						timeout_ms = 2000
-- 					})
-- 				end,
-- 			})
-- 		end
-- 	end,
-- })

vim.api.nvim_create_autocmd('LspProgress', {
	callback = function(ev)
		local value = ev.data.params.value
		local msg = value.message or "done"

		-- rust analyszer in particular has really long LSP messages so truncate them
		if #msg > 40 then
			msg = msg:sub(1, 37) .. "..."
		end

		vim.api.nvim_echo({ { msg } }, false, {
			id = 'lsp',
			kind = 'progress',
			source = 'vim.lsp',
			title = value.title,
			status = value.kind ~= 'end' and 'running' or 'success',
			percent = value.percentage,
		})
	end,
})
