
require("mason").setup({
    ui = {
		border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua" },
	automatic_installed = true,
})

require "modules.lsp.settings.sumneko_lua"
