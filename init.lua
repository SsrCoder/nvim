require "helper"
require "config.options"
require "config.keymaps"


ColorScheme 'themes.tokyonight'
-- ColorScheme 'themes.catppuccin'

-- ui
Plugin "plugins.mini_icons"
Plugin "plugins.lualine"
Plugin "plugins.barbar"

Plugin "plugins.lspconfig"
Plugin "plugins.conform"
-- Plugin "plugins.lsp_format"

Plugin "plugins.snacks.picker"
Plugin "plugins.snacks.dashboard"
Plugin "plugins.snacks.animate"
Plugin "plugins.snacks.explorer"
Plugin "plugins.snacks.indent"
Plugin "plugins.snacks.notifier"
Plugin "plugins.snacks.scope"
Plugin "plugins.snacks.terminal"
-- Plugin "plugins.snacks.profiler"

Plugin "plugins.autopairs"
Plugin "plugins.treesitter"
Plugin "plugins.mason"
Plugin "plugins.blink"
Plugin "plugins.leetcode"
Plugin "plugins.lazydev"
-- Plugin "plugins.indent_blankline"
Plugin "plugins.which-key"
Plugin "plugins.oil"
Plugin "plugins.image"
Plugin "plugins.flash"
Plugin "plugins.store"    -- some plugins info, use ":Store"
Plugin "plugins.vim-cool" -- auto remove search highlight when cursor removed
Plugin "plugins.render-markdown"
Plugin "plugins.origami"
-- Plugin "plugins.osc52" -- copy to clipboard, can pass through tmux and ssh

require "lazy_nvim"
