------------------------------------------------------------
-- Neovim settings
------------------------------------------------------------

-- Neovim API Aliases
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt

-- General Settings
g.mapleader = ' '             	-- Set leader key <comma>
opt.mouse = 'a'               	-- Enable mouse support
opt.clipboard = 'unnamedplus' 	-- copy/paste to system clipboard
opt.swapfile = false          	-- don't use swapfile

-- Neovim UI
opt.number = true             	-- show line number
opt.relativenumber = true     	-- show line number
opt.numberwidth = 2           	-- Set small numbers
opt.showmatch = true          	-- highlight matching parenthesis
opt.foldmethod = 'marker'     	-- enable folding (default 'foldmarker')
opt.colorcolumn = '120'        	-- line lenght marker at 80 columns
opt.splitright = true         	-- vertical split to the right
opt.splitbelow = true         	-- orizontal split to the bottom
opt.ignorecase = true         	-- ignore case letters when search
opt.smartcase = true          	-- ignore lowercase for the whole pattern
opt.linebreak = true          	-- wrap on word boundary
opt.conceallevel = 0
opt.termguicolors = true
opt.cursorline = true
opt.guifont = "Mononoki Nerd Font"
g.neovide_cursor_vfx_mode = "railgun"

-- Memory and CPU
opt.hidden = true         	-- enable background buffers
opt.history = 100         	-- remember n lines in history
opt.lazyredraw = true     	-- faster scrolling
opt.synmaxcol = 1000      	-- max column for syntax highlight

-- Tabs and Indent
opt.expandtab = true      	-- use spaces instead of tabs
opt.shiftwidth = 2        	-- shift 2 spaces when tab
opt.tabstop = 2           	-- 1 tab == 2 spaces
opt.smartindent = true    	-- autoindent new lines
opt.autoindent = true		-- set autoindent

-- Indentline
g.indentLine_char = '|'       	-- set indentLine character

-- Indent chars spaces
opt.list = true
opt.listchars = 'tab:▸ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»'
