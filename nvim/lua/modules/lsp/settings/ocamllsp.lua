local h = require "modules.lsp.handlers"
local util = require 'lspconfig.util'

require('lspconfig').ocamllsp.setup({
	cmd = { "ocamllsp" },
	filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
	root_dir = util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
	on_attach = h.on_attach,
})
