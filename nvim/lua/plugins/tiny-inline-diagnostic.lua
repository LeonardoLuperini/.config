return {
    "rachartier/tiny-inline-diagnostic.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        add_messages = {
          messages = true,
          display_count = true,
        },
        multilines = {
          enabled = true,
        }
      }
    },
    config = function(_, opts)
        require("tiny-inline-diagnostic").setup(opts)
        vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
    end,
}
