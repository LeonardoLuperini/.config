-- Basics stuff
local status, _ = pcall(require, "modules.options")
if not status then print("Problems with options in init.lua file") end

status, _ = pcall(require, "modules.keymaps")
if not status then print("Problems with keymaps in init.lua file") end

status, _ = pcall(require, "modules.plugins")
if not status then print("Problems with plugins in init.lua file") end

status, _ = pcall(require, "modules.autocommands")
if not status then
	print("Problems with autocommands in init.lua file")
	print(_)
end

-- Advanced Stuff
status, _ = pcall(require, "modules.telescope")
if not status then print("Problems with telescope in init.lua file") end

status, _ = pcall(require, "modules.treesitter")
if not status then print("Problems with treesitter in init.lua file") end

status, _ = pcall(require, "modules.colorscheme")
if not status then print("Problems with colorscheme in init.lua file") end

status, _ = pcall(require, "modules.lsp")
if not status then print("Problems with lsp in init.lua file") end

status, _ = pcall(require, "modules.completion")
if not status then print("Problems with completion in init.lua file") end

status, _ = pcall(require, "modules.terminal")
if not status then print("Problems with terminal in init.lua file") end
