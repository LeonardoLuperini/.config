--[[
local function split (input_str, sep)
	if sep == nil then sep = "%s" end
	local t={}
	for str in string.gmatch(input_str, "([^"..sep.."]+)") do
		table.insert(t, str)
	end
	return t
end

local path = vim.api.nvim_buf_get_name(0)
local separeted_path = split(path, "/")
local name_with_exetension = separeted_path[#separeted_path]
local name = split(name_with_exetension, "%.")[1]
--]]

--[[
vim.api.nvim_create_autocmd({"BufWritePost"}, {
	group = vim.api.nvim_create_augroup("AutoCompileC", {clear = true}),
	pattern = "*.c",
	callback = function ()
		vim.api.nvim_command("TermExec cmd='gcc "..name..".c -o "..name..".o -Wall -pedantic'")
	end,
})
--]]

--[[
vim.api.nvim_create_autocmd({"BufWritePost"}, {
	group = vim.api.nvim_create_augroup("DisplayName", {clear = true}),
	pattern = "*",
	callback = function ()
		print(name)
	end,
})
]]
