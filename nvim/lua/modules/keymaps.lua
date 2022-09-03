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
map("v", "<Leader>y", '"+y')
map("n", "<Leader>p", '"+P')
map("v", "<Leader>d", '"+d')

