local vim=vim
-- Stand-alone neovim config file with all my defaults
--- designed to be copied to the global configs

--TODO:
-- fix "$nv/after/syntax/gcode.vim"
-- fix clipboard
--- yanking text always copies it to system clipboard as well as the local instance clipboard
-- remove highlights after search
-- highlights only in current buffer
-- add better pair matching functionality to replace:
--- [matchit](https://github.com/neovim/neovim/blob/master/runtime/pack/dist/opt/matchit/plugin/matchit.vim) &
--- [vim-surround](https://github.com/tpope/vim-surround)
-- builting support for markdown style lists

-- Language Configs: (in order)
--- Lua, C, Rust, Zig


-- Settings: (:help lua-guide-options)
vim.cmd('filetype plugin indent on')
vim.cmd('packadd! matchit')
vim.opt.syntax='on'
vim.opt.shortmess='a'
vim.opt.errorbells=true
vim.opt.timeoutlen=800
vim.opt.splitbelow=true
vim.opt.splitright=true
vim.opt.mouse='nv'

vim.opt.virtualedit:append('block')
vim.opt.scrolloff=8
vim.opt.sidescrolloff=6
vim.opt.relativenumber=true
vim.opt.number=true
vim.opt.wrap=false
vim.opt.signcolumn='yes'
vim.opt.foldcolumn='auto'
vim.opt.foldmethod='marker'
vim.opt.colorcolumn='100'
vim.opt.cmdheight=2

vim.opt.magic=true
vim.opt.smartcase=true
vim.opt.ignorecase=true
vim.opt.hlsearch=true
vim.opt.incsearch=true
vim.opt.showmatch=true

vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.smarttab=true
vim.opt.autoindent=true
vim.opt.shiftround=true

vim.opt.autochdir=true
vim.opt.exrc=true
vim.opt.hidden=true
vim.opt.autoread=true
vim.opt.swapfile=false
vim.opt.backup=false
vim.opt.writebackup=false
vim.opt.undodir=vim.fn.stdpath('data') .. '/undo'
vim.opt.undofile=true


-- Keymaps:
-- set the leader key
vim.g.leader=' '

-- ESC terminal mode
vim.keymap.set('t', '<C-[>', '<C-\\><C-n>')

-- Scroll Buffer
vim.keymap.set('n', 'J', '<C-e>')
vim.keymap.set('n', 'K', '<C-y>')

-- (Readline) Insert Mode Bindings
--- movement
vim.keymap.set('i', '<C-j>', '<Cr>')-- newline
vim.keymap.set('i', '<C-a>', '<Esc>^i')-- goto start of text
vim.keymap.set('i', '<C-e>', '<Esc>$a')-- goto end of line
vim.keymap.set('i', '<C-f>', '<C-right>')-- skip to end of word
vim.keymap.set('i', '<C-b>', '<C-left>')-- go back a word
--- deletion
--[[
vim.keymap.set('i', '<C-u>', function()-- delete to start of text or indent level
  indent = vim.fn.indent('.')
  print('current indent = '..indent)
end)
--]]
vim.keymap.set('i', '<C-k>', '<Esc>lv$hda')-- delete to end of text
--- undo
vim.keymap.set('i', '<C-z>', '<Esc>lv$hda')
--- completion
vim.keymap.set('i', '<C-;>', '')-- request completion
vim.keymap.set('i', '<C-/>', '')-- digraph menu, set to <C-k> by default

-- Navigate Widows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Resize Windows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- Toggle Window Maximized
vim.keymap.set('n', '<C-w>m', function() ToggleWindowMaximized() end, {silent = true})

-- Append Line
vim.keymap.set('n', ',o', 'o<ESC>')
vim.keymap.set('n', ',O', 'O<ESC>')

-- Use Sys Cliboard
vim.g.clipboard = 'unamedplus'
vim.keymap.set('n', '<leader>Y', '"+yg_')
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p')
vim.keymap.set({'n', 'v'}, '<leader>P', '"+P')


-- Commands
vim.cmd([[
com! Q q!
com! Qa qa!
com! W w!
com! Reload source $MYVIMRC
]])


-- Functions & Augroups:
-- augroup saveOnClose

-- augroup trimWhitespace
function PingCursor()
end

local windowMaximized = 0
function ToggleWindowMaximized()
  if windowMaximized == 0 then
    vim.cmd('vertical resize')
    vim.cmd('resize')
    windowMaximized = 1
  else
    vim.cmd('exe "normal \\<C-w>="')
    windowMaximized = 0
  end
end

