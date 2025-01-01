require 'basic.launch'

COLORSCHEME = "nord" -- options: nord, tokyonight

Language 'go'
Language 'lua'

require 'basic.options'
require 'basic.keymaps'
Plugin 'plugins.colorscheme'
Plugin 'plugins.mason'
Plugin 'plugins.blink'
Plugin 'plugins.lspconfig'
Plugin 'plugins.lsp-progress'
Plugin 'plugins.inlay-hints'
Plugin 'plugins.neo-tree'
Plugin 'plugins.bufferline'
Plugin 'plugins.lualine'
Plugin 'plugins.treesitter'
Plugin 'plugins.telescope'
Plugin 'plugins.markdown'

require 'basic.lazy'
