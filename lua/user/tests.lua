require("ultest").setup({
	builders = {
		["go#gotest"] = function(cmd)
			local args = {}
			for i = 3, #cmd - 1, 1 do
				local arg = cmd[i]
				if vim.startswith(arg, "-") then
					-- Delve requires test flags be prefix with 'test.'
					arg = "-test." .. string.sub(arg, 2)
				end
				args[#args + 1] = arg
			end
			return {
				dap = {
					type = "go",
					request = "launch",
					mode = "test",
					-- program = "${workspaceFolder}",
					program = "./${relativeFileDirname}",
					dlvToolPath = vim.fn.exepath("dlv"),
					args = args,
				},
				parse_result = function(lines)
					return lines[#lines] == "FAIL" and 1 or 0
				end,
			}
		end,
	},
})
