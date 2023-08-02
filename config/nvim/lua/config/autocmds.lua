local cmd = vim.cmd

cmd([[
 autocmd BufEnter * Neotree close
]])

-- save file when move another file
-- vim.cmd([[
--   autocmd BufLeave * silent! wall
-- ]])

cmd([[
  augroup AuYank
    autocmd!
    autocmd TextYankPost *
      \ lua vim.highlight.on_yank{higroup='IncSearch', timeout=400, on_visual=true}
    augroup END
]])
