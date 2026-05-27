require "helper.profiler"

require "config.options"
require "config.keymaps"
require "config.ui2"
require "config.osc52"
require "config.autocmd"

require "themes.catppuccin"

require "lsp.lua_ls"
require "lsp.gopls"
require "plugins.mini_icons"
require "plugins.lspconfig"
require "plugins.autopairs"
require "plugins.snacks"
require "plugins.blink"
require "plugins.lsp-format"
require "plugins.tree-sitter-manager"
require "plugins.glance" -- VSCode-like peek preview functionality for LSP locations
require "plugins.oil"
require "plugins.render-markdown"
require "plugins.gitsigns"
require "plugins.mini_surround"
require "plugins.todo-comments"
require "plugins.trouble"
require "plugins.which-key"

-- test
vim.api.nvim_create_user_command('Reload', ':restart', {})
vim.api.nvim_create_user_command('PluginsUpdate', function() vim.pack.update() end, {})
