local a = vim.api
-- Functional wrapper for mapping custom keybindings
-- unless specified in opts, recursive mapping is disabled
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	a.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Keybindings
vim.g.mapleader = " "

-- Copy paste keymaps
map("v", "<Leader>y", '"+y')
map("n", "<Leader>p", '"+p')
map("v", "<Leader>d", '"+d')

-- Telsecsope keymaps
map("n", "<Leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<Leader>fb", "<cmd>Telescope file_browser<cr>")
map("n", "<Leader>lg", "<cmd>Telescope live_grep<cr>")

-- Indent Tabs
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")



local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local status, cmp = pcall(require, "cmp")
if not status then print("Problems with cmp in keyboard.lua file") return end

local status, luasnip = pcall(require, "luasnip")
if not status then print("Problems with luasnip in keyboard.lua file") return end

local plugin_map = {
	cmp = {
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	lsp = function(client, bufnr)
		-- See `:help nvim_buf_set_keymap()` for more information
		local buf_map = vim.api.nvim_buf_set_keymap
		local opts = { noremap = true }
		buf_map(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>"   , opts)
		buf_map(bufnr, 'n', 'K' , '<cmd>lua vim.lsp.buf.hover()<CR>'         , opts)
		buf_map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>'    , opts)
		buf_map(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- Does not work in lua
		buf_map(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

	end
}

return plugin_map
