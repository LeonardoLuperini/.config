local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- WARNINGS: this auto-command doesn't work if you save an quit in one command like :wq
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
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

	-- Autopairs
	use {
		"windwp/nvim-autopairs", -- Need to say what this plugin does?
		config = function() require("nvim-autopairs").setup { map_cr = true } end
	}

	-- Telescope
	use { "nvim-telescope/telescope.nvim", branch = '0.1.x' } -- Highly extendable fuzzy finder over lists
	use "nvim-telescope/telescope-file-browser.nvim" -- Extension for telescope

	-- Tree-sitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- LSP
	use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"

	-- Completion
	use 'hrsh7th/cmp-nvim-lsp' -- Completion using LSP
	use 'hrsh7th/cmp-buffer' -- Completion using things in buffer
	use 'hrsh7th/cmp-path' -- Completion using things in path
	use 'hrsh7th/cmp-cmdline' -- Completion for the commands
	use 'hrsh7th/nvim-cmp' -- Base plugin
	use { "L3MON4D3/LuaSnip", run = "make install_jsregexp" } -- Snippet engine
	use 'saadparwaiz1/cmp_luasnip' -- make luasnip and cmp comunicate 

	-- My colorscheme here
	-- use "ellisonleao/gruvbox.nvim" -- Gruvbox lua port 
	use "morhetz/gruvbox" -- Gruvbox original

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
