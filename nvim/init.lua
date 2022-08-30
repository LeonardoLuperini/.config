--Global Variables
a = vim.api
o = vim.o

-- Functional wrapper for mapping custom keybindings
-- unless specified in opts, recursive mapping is disabled
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    a.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Options
o.number = true

o.tabstop = 4
o.shiftwidth = 4

-- Keybindings
map("v", "<Leader>y", '"+y')
map("n", "<Leader>p", '"+P')
map("v", "<Leader>d", '"+d')
