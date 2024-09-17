return {
  -- Pretty stuff
  {
    'AlexvZyl/nordic.nvim', lazy = false, priority = 1000, config = function()
      require'nordic'.load()
    end
  },
  -- Text Stuffs
  'tpope/vim-surround',
  {
    'unblevable/quick-scope', config = function()
      vim.g.qs_enable = 0
      -- note:
      -- use ';' to redo last line-search command
      vim.g.qs_hightlight_on_keys = {'f', 'F', 't', 'T'}
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim', main = 'ibl', config = function()
      require'ibl'.setup({
        indent = { char = '┊' },
        scope = { enabled = false }
      })
    end
  },
  -- File Search
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = {'nvim-lua/plenary.nvim'}
  },
  'camnw/lf-vim',
  {
    'nvim-tree/nvim-tree.lua', config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.opt.termguicolors = true
      require'nvim-tree'.setup({
        view = {
          width = 30,
        },
        filters = {
          --git_ignored = true,
        },
      })
    end
  },
  -- Language Stuff
  'prettier/vim-prettier',
  'windwp/nvim-ts-autotag',
  'lluchs/vim-wren',
  'fladson/vim-kitty',
  'HiPhish/info.vim',
}
