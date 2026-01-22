local opt = vim.opt

vim.g.mapleader = " "
vim.g.snippets = "luasnip"

-- Appearance
opt.syntax = "on"
opt.title = true
opt.background = "dark"
opt.termguicolors = true
opt.cursorline = true
opt.colorcolumn = "120"
opt.signcolumn = "yes"
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.wrap = false
opt.scrolloff = 5
opt.sidescrolloff = 5

-- encoding
opt.encoding = "utf-8"
vim.scriptencoding = "utf-8"
opt.fileencoding = "utf-8"

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Splits
opt.splitbelow = true
opt.splitright = true

-- syntax and indent
opt.autoindent = true
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

-- swapfiles
opt.hidden = true
opt.swapfile = false
opt.synmaxcol = 1000

-- Fold column
opt.foldcolumn = "0"
opt.foldenable = false
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldminlines = 2

opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.updatetime = 100
opt.list = true
opt.listchars = "tab:▸ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»"
opt.linespace = 0
