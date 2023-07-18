local opt = vim.opt

vim.g.mapleader = ' '
vim.g.snippets = "luasnip"

opt.title = true
opt.background = 'dark'
opt.termguicolors = true
opt.syntax = 'on'
opt.cursorline = true
opt.colorcolumn = '120'
opt.signcolumn = 'yes'

-- encoding
opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.termencoding = 'utf-8'

opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.wrap = false
opt.laststatus = 2
opt.showtabline = 2

opt.scrolloff = 10
opt.sidescrolloff = 10
opt.list = true
opt.listchars = 'tab:▸ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»'
opt.linespace = 0
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true

-- syntax and indent
opt.autoindent = true
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

opt.clipboard = 'unnamedplus'
opt.mouse = 'a'
opt.updatetime = 100

-- swapfiles
opt.hidden = true
opt.swapfile = false
opt.synmaxcol = 1000

-- vim.opt.wildignore:append({ "*/node_modules/*" })
-- vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
-- vim.opt.backspace = { "start", "eol", "indent" }

-- nvim-ufo setting
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
