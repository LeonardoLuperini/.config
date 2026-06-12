vim.opt.foldenable = false
vim.opt.foldlevel = 99

vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function ()
    if pcall(vim.treesitter.get_parser) then

      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end
  end
})
