require 'basic.launch'

COLORSCHEME = "tokyonight" -- options: nord, tokyonight

Language 'go'
Language 'lua'

require 'basic.options'
require 'basic.keymaps'
require 'basic.autocmd'


Plugin 'plugins.colorscheme'
Plugin 'plugins.which-key'
Plugin 'plugins.dressing'
Plugin 'plugins.mason'
Plugin 'plugins.blink'
Plugin 'plugins.lspconfig'
Plugin 'plugins.lsp-progress'
Plugin 'plugins.lsp_signature'
Plugin 'plugins.inc-rename'
Plugin 'plugins.inlay-hints'
Plugin 'plugins.neo-tree'
Plugin 'plugins.bufferline'
Plugin 'plugins.lualine'
Plugin 'plugins.treesitter'
-- Plugin 'plugins.telescope'
Plugin 'plugins.fzf-lua'
Plugin 'plugins.markdown'
Plugin 'plugins.format-on-save'
Plugin 'plugins.snacks'
Plugin 'plugins.flash'
Plugin 'plugins.autopairs'
-- Plugin 'plugins.dashboard'
Plugin 'plugins.git-blame'
Plugin 'plugins.todo-comments'
Plugin 'plugins.copilot'

require 'basic.lazy'
