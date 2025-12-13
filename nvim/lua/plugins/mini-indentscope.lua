return {
  'nvim-mini/mini.indentscope',
  version = false,
  opts = {
    mappings = {
      object_scope = '',
      object_scope_with_border = '',
      goto_top = '',
      goto_bottom = '',
    },
    -- Alternative symbol: │
    symbol = "┃"
  },
  init = function()
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = function()
        vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', {
          fg = '#504945',
          nocombine = true,
        })
      end,
    })
  end,
}
