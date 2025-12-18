return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-mini/mini.icons" },
  opts = {},
  config = function(_, opts)
    vim.keymap.set("n", "<space>ff", function() require('fzf-lua').files() end)
    vim.keymap.set("n", "<space>fh", function() require('fzf-lua').helptags() end)
    vim.keymap.set("n", "<space>fm", function() require('fzf-lua').manpages() end)
  end
}
