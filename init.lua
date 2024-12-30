require 'basic.launch'

COLORSCHEME = "nord" -- options: nord, tokyonight

Language 'go'
Language 'lua'

require 'basic.options'
require 'basic.keymaps'

Plugin 'plugins.colorscheme'
Plugin 'plugins.mason'

Plugin 'plugins.lspconfig'
Plugin 'plugins.neo-tree'
Plugin 'plugins.bufferline'
Plugin 'plugins.lualine'
Plugin 'plugins.treesitter'
Plugin 'plugins.telescope'


require 'basic.lazy'
