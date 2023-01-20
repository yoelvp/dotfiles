local opt = vim.opt
local g = vim.g

-- Global
g.leader = ' '

-- General
opt.syntax = 'enable'
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.swapfile = false

-- Number, tabs and indent
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.smartcase = true
opt.linebreak = true
opt.conceallevel = 0
opt.termguicolors = true

-- UI
opt.showmatch = true
opt.colorcolumn = '120'
opt.cursorline = true
opt.linebreak = true
opt.autoindent = true
opt.guifont = 'CaskaydiaCove Nerd Font'
g.neovide_cursor_vfx_mode = 'railgun'

-- Other
opt.ignorecase = true
opt.list = true
opt.listchars = 'tab:▸ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»'

-- Memory
opt.hidden = true
opt.history = 1000
opt.lazyredraw = true
opt.synmaxcol = 1000

