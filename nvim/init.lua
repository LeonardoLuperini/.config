require "modules.options"
require "modules.keymaps"
require "modules.plugins"
require "modules.autocommands"

-- Colorscheme

-- vim.o.background = "dark" -- or "light" for light mode -- if  gruvbox lua port
vim.cmd([[let g:gruvbox_contrast_dark = 'hard']]) -- if guvbox original

vim.cmd([[colorscheme gruvbox]])
