require "helper.profiler"

require "config.options"
require "config.keymaps"
require "config.ui2"
require "config.osc52"
require "config.autocmd"

require "themes.catppuccin"

require "lsp.lua_ls"
require "lsp.gopls"
require "plugins.lspconfig"
require "plugins.autopairs"
require "plugins.snacks"
require "plugins.blink"

-- test
vim.api.nvim_create_user_command('Reload', ':restart', {})
