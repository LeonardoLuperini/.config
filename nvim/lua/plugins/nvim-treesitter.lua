-- NOTE: that it will check and install new parsers ONLY when the plugin get updaated or installed
-- so you should add it if you want to the table below and installit manually with :TSInstall
-- ensinst -> ENSure INSTalled
local ensinst = { 'vim', 'python', 'make', 'c++', 'c', 'lua', 'zig', 'rust', 'javascript', 'zig' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = require("nvim-treesitter").get_installed(),
  callback = function()
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start()
    -- folds, provided by Neovim
    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- vim.wo.foldmethod = 'expr'
  end,
})

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = function()
    local nvts = require("nvim-treesitter")
    local instservs = nvts.get_installed()
    local found
    for _, e in ipairs(ensinst) do
      found = false
      for _, i in ipairs(instservs) do
        if e == i then found = true end
      end
      if not found then nvts.install(e) end
    end
    nvts.update()
  end,
}
