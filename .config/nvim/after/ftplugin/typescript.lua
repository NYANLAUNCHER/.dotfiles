-- config for ts & tsx, see: ./typescriptreact.lua
vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2

require'nvim-treesitter.configs'.setup({
  ensure_installed = {'typescript'},
  highlight = { enable = true },
  indent = { enable = false },
})

require'lspconfig'.tsserver.setup{}
