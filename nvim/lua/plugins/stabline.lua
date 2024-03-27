return {
  'tamton-aquib/staline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('stabline').setup({
      style = 'slant',
      stab_left = '',
      stab_right = '',
      font_active = 'bold',
      exclude_fts = { 'NvimTree', 'dashboard' },
    })
  end
}
