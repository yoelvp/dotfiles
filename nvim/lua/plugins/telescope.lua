return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope-media-files.nvim'
  },
  config = function()
    require('yoelvp.telescope')
  end
}
