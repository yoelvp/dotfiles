local M = {}

M.neotree = require('yoelvp.utils.neotree')
M.react = require('yoelvp.utils.react')

-- Extend table
function M.extendTable(table, values)
  return vim.tbl_extend('force', table, values)
end

-- Duplicate current line below
function M.duplicate_line_below()
  vim.api.nvim_command('normal! yyp')
  vim.api.nvim_command('noh')
end

-- Duplicate current line above
function M.duplicate_line_above()
  vim.api.nvim_command('normal! yyP')
  vim.api.nvim_command('noh')
end

function M.delete_current_buffer()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_delete(bufnr, { force = false })
end

return M
