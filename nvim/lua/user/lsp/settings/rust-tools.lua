local rt = require("rust-tools")
local h = require "user.lsp.handlers"

rt.setup({
  server = {
    on_attach = h.on_attach,
  },
})
