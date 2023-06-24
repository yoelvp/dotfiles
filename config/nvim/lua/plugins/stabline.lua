return {
  'tamton-aquib/staline.nvim',
  config = function()
    require('stabline').setup({
      style = 'slant', -- others: arrow, slant, bubble
      -- stab_left = ' ',
      -- stab_right = '',
      stab_left = '',
      stab_right = '',

      font_active = 'bold',
      exclude_fts = { 'NvimTree', 'dashboard', 'lir' },
    })
  end
}
