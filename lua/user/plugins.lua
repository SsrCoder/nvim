local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("lewis6991/impatient.nvim") -- Speed up loading Lua modules
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- chinese document
	use("yianwillis/vimcdoc")

	-- colorschemes
	use("lunarvim/darkplus.nvim")
	use("folke/tokyonight.nvim")

	-- cmp
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("f3fora/cmp-spell") -- spell completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use({ "tzachar/cmp-tabnine", run = "./install.sh" }) -- tabnine completions
	use("lukas-reineke/cmp-under-comparator") -- A tiny function for nvim-cmp to better sort completion items that start with one or more underlines.
	use("onsails/lspkind-nvim")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- lsp
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tami5/lspsaga.nvim") -- lsp ui
	use("ray-x/lsp_signature.nvim") -- Show function signature when you type
	use("j-hui/fidget.nvim") -- Standalone UI for nvim-lsp progress.

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-live-grep-args.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")
	use("tom-anders/telescope-vim-bookmarks.nvim")
	-- use("nvim-telescope/telescope-media-files.nvim") -- only support on linux

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- Debugger
	use("mfussenegger/nvim-dap")
	use("Pocco81/DAPInstall.nvim")
	use({
		"theHamsta/nvim-dap-virtual-text",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("user.dap.virtual-text")
		end,
	})
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("user.dap.ui")
		end,
	})
	use("leoluz/nvim-dap-go")

	-- Languages
	use("ray-x/go.nvim")

	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("lewis6991/gitsigns.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("nvim-lualine/lualine.nvim") -- a plugin likes airline in lua
	use("akinsho/toggleterm.nvim")
	use("lukas-reineke/indent-blankline.nvim") -- indent line
	use("goolord/alpha-nvim")
	use("folke/which-key.nvim")
	use("github/copilot.vim") -- github auto complete plugin
	use("kevinhwang91/nvim-hlslens")
	use("AndrewRadev/switch.vim")
	use("phaazon/hop.nvim")
	use("ur4ltz/surround.nvim")
	use("lewis6991/spellsitter.nvim")
	use("Pocco81/AutoSave.nvim")
	use("ethanholz/nvim-lastplace")
	use("rcarriga/nvim-notify")
	use("kosayoda/nvim-lightbulb")
	use("Shatur/neovim-session-manager")
	use({ "beloglazov/vim-textobj-quotes", requires = { "kana/vim-textobj-user" } }) -- text object for quotes
	use("MattesGroeger/vim-bookmarks")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
