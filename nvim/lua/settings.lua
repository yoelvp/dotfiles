local opt = vim.opt
local g = vim.g

g.mapleader = ' '
g.indentLine_char = '|'

opt.title = true
opt.syntax = 'on'
opt.linespace = 0
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.termencoding = 'utf-8'
opt.guifont = 'CaskaydiaCove Nerd Font'
opt.guifontwide = 'CaskaydiaCove Nerd Font'

opt.autoindent = true
opt.swapfile = false

opt.background = 'dark'
opt.termguicolors = true
opt.colorcolumn = '120'
opt.cursorline = true
opt.list = true
opt.scrolloff = 5
opt.sidescrolloff = 5
--opt.lazyredraw = false
--vim.api.nvim_set_option("lazyredraw", false)
opt.linebreak = true
opt.listchars = 'tab:▸ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»'
opt.guifont = "Mononoki Nerd Font"
-- vim.api.nvim_exec([[set guicursor=n-v-c:block-Cursor,i-ci:beam-Cursor,r-cr:hor20]], false)
-- vim.api.nvim_exec([[set guicursor=n-v-c:block-Cursor,i-ci:bar-Cursor,r-cr:hor20]], false)

opt.number = true
opt.numberwidth = 2
opt.relativenumber = true

opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true
opt.tabstop = 2
opt.smartindent = true

opt.clipboard = 'unnamedplus'
opt.mouse = 'a'

opt.hidden = true
opt.history = 20
opt.lazyredraw = true
opt.synmaxcol = 1000

vim.cmd [[
  autocmd BufEnter * Neotree close
]]
