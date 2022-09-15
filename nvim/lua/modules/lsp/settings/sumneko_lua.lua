local h = require "modules.lsp.handlers"

-- local sumneko_root_path = "/usr/lib/lua-language-server"
-- local sumneko_binary = "/usr/bin/lua-language-server"

require('lspconfig')["sumneko_lua"].setup({
	-- cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
	-- An example of settings for an LSP server.
	--    For more options, see nvim-lspconfig
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {"vim"},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
				[vim.fn.expand('$VIMRUNTIME/lua')] = true,
				[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
			telemetry = {
			-- Do not send telemetry data containing a randomized but unique identifier
				enable = false,
			},

		}
	},
	on_attach = h.on_attach,
	capabilities = h.capabilities,
})
