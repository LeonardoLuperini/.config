-- Basics stuff
local status, _ = pcall(require, "modules.options")
if not status then print("Problems with options in init.lua file") end

status, _ = pcall(require, "modules.keymaps")
if not status then print("Problems keymaps with in init.lua file") end

status, _ = pcall(require, "modules.plugins")
if not status then print("Problems plugins with in init.lua file") end

status, _ = pcall(require, "modules.autocommands")
if not status then print("Problems autocommands with in init.lua file") end

-- Advanced Stuff
status, _ = pcall(require, "modules.telescope")
if not status then print("Problems telescope with in init.lua file") end

status, _ = pcall(require, "modules.treesitter")
if not status then print("Problems treesitter with in init.lua file") end

status, _ = pcall(require, "modules.colorscheme")
if not status then print("Problems colorscheme with in init.lua file") end

status, _ = pcall(require, "modules.lsp")
if not status then print("Problems lsp with in init.lua file") end

status, _ = pcall(require, "modules.completion")
if not status then print("Problems completion with in init.lua file") end
