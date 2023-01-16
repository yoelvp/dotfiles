--[[
  ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
  ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
  ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
  ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
  ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝

Neovim init file
Website: https://yoelvalverde.com
--]]

-- Settings
require('settings')

-- Keymaps
require('keymaps')

-- Plugin manager
require('plugins.packer')

-- Setting plugins
require('plugins.gruvbox')                -- configuration of colorschemes
require('plugins.indent-blankline')       -- indent blankline
require('plugins.neotree')                -- browser files
require('plugins.nvim-autopairs')         -- autopairs chars
require('plugins.nvim-treesitter')        -- treesitter
require('plugins.nvim-lspconfig')         -- lspconfig
require('plugins.mason')                  -- mason
require('plugins.nvim-cmp')               -- autocompletation 'cmp'

