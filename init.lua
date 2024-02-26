require "basic.launch"
require "basic.options"
require "basic.keymaps"

plugin "plugins.colorscheme"
plugin "plugins.devicons"
plugin "plugins.treesitter"
plugin "plugins.mason"
plugin "plugins.mason-lspconfig"
plugin "plugins.schemastore"
plugin "plugins.lspconfig"
plugin "plugins.cmp"
plugin "plugins.flash"
-- plugin "plugins.copilot"
plugin "plugins.none-ls"
plugin "plugins.telescope"
plugin "plugins.nvim-tree"
plugin "plugins.comment"
plugin "plugins.todo-comments"
plugin "plugins.bufferline"
plugin "plugins.lualine"
plugin "plugins.breadcrumbs"
plugin "plugins.navic"
plugin "plugins.harpoon"
plugin "plugins.indent-blankline"
plugin "plugins.autopairs"
plugin "plugins.notify"
plugin "plugins.trouble"
-- plugin "plugins.noice"
plugin "plugins.osc52"
plugin "plugins.alpha"
plugin "plugins.wezterm"
plugin "plugins.auto-session"
plugin "plugins.lsp-progress"
plugin "plugins.gitsigns"
-- plugin "plugins.codeium"

-- bottom of all plugins
plugin "plugins.whichkey"
require "basic.lazy"
