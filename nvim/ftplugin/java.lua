local jdtls_config = require("user.lsp.settings.jdtls").setup()
local pkg_status, jdtls = pcall(require,"jdtls")
if not pkg_status then
  vim.notify("unable to load nvim-jdtls")
  return
end
jdtls.start_or_attach(jdtls_config)
