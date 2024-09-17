return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function ()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'c', 'zig', 'lua', 'rust', 'glsl', 'vim', 'vimdoc', 'query' },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = false },
      autotag = {
        enable = true,
      },
    })
  end
}
