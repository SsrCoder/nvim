require "helper.profiler"

require "config.options"
require "config.osc52"
require "config.keymaps"
require "config.autocmd"

require "themes.catppuccin"

require "lsp.lua_ls"
require "plugins.lspconfig"
require "plugins.autopairs"
require "plugins.snacks"
require "plugins.blink"

-- test
vim.api.nvim_create_user_command('Reload', ':restart', {})
