local opt = vim.opt

-- global settings
vim.g.mapleader = ' '
vim.g.indentLine_char = '|'
vim.o.showtabline = 2

-- editor
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.termencoding = 'utf-8'

-- visual options editor
opt.title = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.cursorline = true
opt.colorcolumn = '120'
opt.scrolloff = 2
opt.sidescrolloff = 5
opt.list = true
opt.listchars = 'tab:▸ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»'
opt.linespace = 0

-- syntax and indent
opt.syntax = 'on'
opt.autoindent = true
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 2
opt.tabstop = 2

-- ui
opt.background = 'dark'
opt.termguicolors = true

-- options and functionallity
opt.clipboard = 'unnamedplus'
opt.mouse = 'a'

-- swapfiles
opt.hidden = true
opt.swapfile = false
opt.lazyredraw = true
opt.synmaxcol = 1000

