local M = {}

M.neotree = require('yoelvp.utils.neotree')
M.lsp_icons = require('yoelvp.utils.lsp-icons')

-- Extend table
function M.extend_tbl(table, values)
  return vim.tbl_extend('force', table, values)
end

-- Duplicate current line below
function M.duplicate_line_below()
  local col = vim.fn.col('.')
  vim.api.nvim_command('normal! yyp')
  vim.fn.cursor(vim.fn.line('.'), col)
end

-- Duplicate current line above
function M.duplicate_line_above()
  local col = vim.fn.col('.')
  vim.api.nvim_command('normal! yyP')
  vim.fn.cursor(vim.fn.line('.'), col)
end

-- Remove the current buffer
function M.delete_current_buffer()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_delete(bufnr, { force = false })
end

-- TODO: Seleccionar todo el contenido y regresar el cursor a su lugar donde estaba
function M.select_all_content()
  print('Haz hecho click')
end

return M
