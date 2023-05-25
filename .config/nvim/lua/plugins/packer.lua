local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'ellisonleao/gruvbox.nvim'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- Neotree
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x'
  }

  -- Dependencies
  use 'nvim-lua/plenary.nvim'
  use 'MunifTanjim/nui.nvim'

  -- Telescope / find files
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = {
      'nvim-telescope/telescope-media-files.nvim',
      'nvim-telescope/telescope-file-browser.nvim'
    }
  }

  -- UI plugins
  use 'onsails/lspkind-nvim'
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'glepnir/lspsaga.nvim' -- Lsp UI
  use 'nvim-lualine/lualine.nvim' -- Status line
  -- use 'edluffy/specs.nvim'

  -- Lsp config
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- Autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'L3MON4D3/LuaSnip' -- Luasnip

  -- Comments
  use {
    'numToStr/Comment.nvim'
    -- requires = 'JoosepAlviste/nvim-ts-context-commentstring'
  }
  use 'folke/todo-comments.nvim'

  -- Close tags/pairs
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- utils
  use 'tpope/vim-surround'
  use 'mg979/vim-visual-multi'
  -- use 'phaazon/hop.nvim'

  -- Tools Javascript
  use 'axelvc/template-string.nvim'

  -- Git tools
  use 'kdheepak/lazygit.nvim'
  use 'lewis6991/gitsigns.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
