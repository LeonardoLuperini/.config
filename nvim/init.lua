-- Basics stuff
local status, _ = pcall(require, "user.options")
if not status then print("Problems with options in init.lua file") end

status, _ = pcall(require, "user.keymaps")
if not status then print("Problems with keymaps in init.lua file") end

status, _ = pcall(require, "user.plugins")
if not status then print("Problems with plugins in init.lua file") end

status, _ = pcall(require, "user.autocommands")
if not status then
	print("Problems with autocommands in init.lua file")
	print(_)
end

-- Advanced Stuff
status, _ = pcall(require, "user.telescope")
if not status then print("Problems with telescope in init.lua file") end

status, _ = pcall(require, "user.treesitter")
if not status then print("Problems with treesitter in init.lua file") end

status, _ = pcall(require, "user.colorscheme")
if not status then print("Problems with colorscheme in init.lua file") end

status, _ = pcall(require, "user.lsp")
if not status then print("Problems with lsp in init.lua file") end

status, _ = pcall(require, "user.completion")
if not status then print("Problems with completion in init.lua file") end

status, _ = pcall(require, "user.dap")
if not status then print("Problems with dap in init.lua file") end

-- status, _ = pcall(require, "user.terminal")
-- if not status then print("Problems with terminal in init.lua file") end
