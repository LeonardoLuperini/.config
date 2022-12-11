local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- show signs
		signs = { active = signs, },
		underline = true,
		severity_sort = true,
	}

	vim.diagnostic.config(config)
end



local lsp_keymaps = require("user.keymaps").lsp
M.on_attach = function(client, bufnr)
  lsp_keymaps(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp = require "cmp_nvim_lsp"
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)



return M
