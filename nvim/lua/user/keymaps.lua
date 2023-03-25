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

-- Motions
map("", "gl", "<C-End>")

-- Copy paste keymaps
map("v", "<Leader>y", '"+y')
map("n", "<Leader>p", '"+p')
map("v", "<Leader>d", '"+d')

-- Telsecsope keymaps
map("n", "<Leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<Leader>fb", "<cmd>Telescope file_browser<cr>")
map("n", "<Leader>gl", "<cmd>Telescope live_grep<cr>")

-- I don't want to use arrow keys
map("n", "<Up>", 	"<nop>")
map("n", "<Down>", 	"<nop>")
map("n", "<Left>", 	"<nop>")
map("n", "<Right>", "<nop>")
map("i", "<Up>", 	"<nop>")
map("i", "<Down>", 	"<nop>")
map("i", "<Left>", 	"<nop>")
map("i", "<Right>", "<nop>")
map("v", "<Up>", 	"<nop>")
map("v", "<Down>", 	"<nop>")
map("v", "<Left>", 	"<nop>")
map("v", "<Right>", "<nop>")

-- Indent Tabs
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")

-- Moving the mouse through the current windows
map("n", "<C-l>", "<C-W>l") -- Move the mouse to the window on the right
map("n", "<C-h>", "<C-W>h") -- Move the mouse to the window on the left
map("n", "<C-k>", "<C-W>k") -- Move the mouse to the window above
map("n", "<C-j>", "<C-W>j") -- Move the mouse to the window above

-- Moving the current window  
map("n", "<Leader>l", "<C-W>L") -- Move the current window to the right
map("n", "<Leader>h", "<C-W>H") -- Move the current window to the left
map("n", "<Leader>k", "<C-W>K") -- Move the current window up
map("n", "<Leader>j", "<C-W>J") -- Move the current window down


local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip, status, cmp
status, cmp = pcall(require, "cmp")
if not status then print("Problems with cmp in keyboard.lua file") return end

status, luasnip = pcall(require, "luasnip")
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
		buf_map(bufnr, "n", "sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		buf_map(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

	end
}

return plugin_map
