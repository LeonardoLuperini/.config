return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = { 'saghen/blink.cmp' }, -- auto complition

  -- Ovveride default settings
  opts = {
    servers = {
      lua_ls = {},
      ccls = {},
      zls = {
        filetypes = { "zig", "zir", "zon" }
      }
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

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('my.lsp', {}),
      callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/go-to-definition') then
          vim.keymap.set("n", "grd", function() vim.lsp.buf.definition() end, { buffer = true })
        end

      end
    })
  end
}
