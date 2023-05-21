local opt = vim.opt

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.background = 'dark'
opt.termguicolors = true
opt.cursorline = true
opt.colorcolumn = '120'

opt.title = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.hlsearch = true
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 3
opt.sidescrolloff = 5

opt.clipboard = 'unnamedplus'
opt.mouse = 'a'
--opt.update = 100

opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search

opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.breakindent = true
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2


opt.backup = false

opt.wrap = false -- No Wrap lines
opt.backspace = { 'start', 'eol', 'indent' }
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildignore:append { '*/node_modules/*' }
