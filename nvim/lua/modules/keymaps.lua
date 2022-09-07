local a = vim.api
-- Functional wrapper for mapping custom keybindings
-- unless specified in opts, recursive mapping is disabled
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    a.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Keybindings
vim.g.mapleader = " "

map("v", "<Leader>y", '"+y')
map("n", "<Leader>p", '"+P') -- NB: p is mapped at P
map("v", "<Leader>d", '"+d')
map("n", "<Leader>ff", "<cmd>Telescope find_files<cr>")
