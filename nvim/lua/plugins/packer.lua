local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use 'morhetz/gruvbox'

  -- tree files
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    }
  }

  -- telescope for search files
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- telescope for preview files
  use 'nvim-telescope/telescope-media-files.nvim'

  -- syntax code
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- null and linter for js
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Mason & Lsp
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
  }

  -- Autocomplete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/vim-vsnip'
  use 'L3MON4D3/LuaSnip'
  use 'onsails/lspkind.nvim'

  -- status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- line files
  use 'tamton-aquib/staline.nvim'

  -- gitsigns
  use 'lewis6991/gitsigns.nvim'

  -- Lazy git
  use 'kdheepak/lazygit.nvim'

  -- blankline
  use 'lukas-reineke/indent-blankline.nvim'

  -- multicursor
  use 'mg979/vim-visual-multi'

  -- change string to template string
  use 'axelvc/template-string.nvim'

  -- autoclose pairs
  use 'windwp/nvim-autopairs'

  -- comment code
  use 'numToStr/Comment.nvim'

  -- autoclose tag
  use 'windwp/nvim-ts-autotag'

  -- colorizer
  use 'norcalli/nvim-colorizer.lua'

  -- todo comments
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  -- toggle terminal in nvim
  use {
    'akinsho/toggleterm.nvim',
    tag = '*'
  }

  -- change of tags
  use 'tpope/vim-surround'

  -- syntax for styled components
  use 'styled-components/vim-styled-components'

  -- syntax for react
  use 'mxw/vim-jsx'


  if packer_bootstrap then
    require('packer').sync()
  end
end)
