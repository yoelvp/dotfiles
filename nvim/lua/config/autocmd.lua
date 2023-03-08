local cmd = vim.cmd

-- close neotree when open file
cmd [[
  autocmd BufEnter * Neotree close
]]

-- save file when move another file
cmd[[
  autocmd BufLeave * silent! wall
]]

