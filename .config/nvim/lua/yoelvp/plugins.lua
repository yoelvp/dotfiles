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
  use 'morhetz/gruvbox'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- IU Icons
	use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  

  -- Utils
	use 'tpope/vim-surround'
	use 'mg979/vim-visual-multi'
	use 'windwp/nvim-autopairs'
	use 'folke/todo-comments.nvim'
	use 'windwp/nvim-ts-autotag'
	use 'numToStr/Comment.nvim'
	use 'axelvc/template-string.nvim'

  -- Tools git
	use 'kdheepak/lazygit.nvim'
	use 'lewis6991/gitsigns.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
