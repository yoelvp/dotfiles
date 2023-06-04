local ok, staline = pcall(require, 'stabline')

if not ok then
  return
end

staline.setup({
  style = 'slant', -- others: arrow, slant, bubble
  stab_right = '',

  font_active = 'bold',
  exclude_fts = { 'NvimTree', 'dashboard', 'lir' },
})
