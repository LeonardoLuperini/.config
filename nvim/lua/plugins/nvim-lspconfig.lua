return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = { 'saghen/blink.cmp' }, -- auto complition

  -- Ovveride default settings
  opts = {
    servers = {
      lua_ls = {},
      ccls = {},
    }
  },
  config = function(_, opts)
    -- This is here because ccls is not provided by Mason but by pacman
    -- and because of that i need to tell nvim where to find it
    vim.opt.rtp:prepend("/usr/bin")

    for lsp, conf in pairs(opts.servers) do
      conf.capabilities = require('blink.cmp').get_lsp_capabilities(conf.capabilities)
      vim.lsp.config(lsp, conf)
      vim.lsp.enable(lsp)
    end
  end
}
