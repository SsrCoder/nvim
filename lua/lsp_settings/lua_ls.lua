return {
  settings = {
    Lua = {
      format = {
        enable = true,
      },
      diagnostics = {
        globals = { "vim", "spec" },
      },
      runtime = {
        version = "LuaJIT",
        special = {
          plugin = "require",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
			hint = {
				enable = true,
				arrayIndex = "Disable",
				await = true,
				paramName = "Literal",
				paramType = true,
				semicolon = "All",
				setType = false,
			},
      telemetry = {
        enable = false,
      },
    },
  },
}
