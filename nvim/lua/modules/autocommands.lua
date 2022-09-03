local a = vim.api
--[[
local pippo = a.nvim_create_augroup("Prova", { clear = true })
a.nvim_create_autocmd("BufEnter", {command = "echo 'hello'", group = pippo})
--]]

