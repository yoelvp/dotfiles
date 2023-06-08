local ok, stabline = pcall(require, 'stabline')

if not ok then
  return
end

stabline.setup({
  style = 'slant', -- others: arrow, slant, bubble
  -- stab_left = ' ',
  -- stab_right = '',
  stab_left = '',
  stab_right = '',

  font_active = 'bold',
  exclude_fts = { 'NvimTree', 'dashboard', 'lir' },
})
