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

-- Duplicate a code block below
function M.duplicate_block_below()
  local start_line, start_col = vim.fn.getpos("'<")[2], vim.fn.getpos("'<")[3]
  local end_line, end_col = vim.fn.getpos("'>")[2], vim.fn.getpos("'>")[3]

  vim.api.nvim_command('normal! gv"zy')
  vim.api.nvim_command('normal! `>p')

  vim.fn.setpos("'<", { 0, start_line, start_col, 0 })
  vim.fn.setpos("'>", { 0, end_line, end_col, 0 })
end

-- Duplicate a code block above
function M.duplicate_block_above()
  local start_line, start_col = vim.fn.getpos("'<")[2], vim.fn.getpos("'<")[3]
  local end_line, end_col = vim.fn.getpos("'>")[2], vim.fn.getpos("'>")[3]

  vim.api.nvim_command('normal! gv"zy')
  vim.api.nvim_command('normal! `>P')

  vim.fn.setpos("'<", { 0, start_line, start_col, 0 })
  vim.fn.setpos("'>", { 0, end_line, end_col, 0 })
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

function M.format_tailwind(entry, vim_item)
  if vim_item.kind == 'Color' and entry.completion_item.documentation then
    local _, _, r, g, b =
      ---@diagnostic disable-next-line: param-type-mismatch
      string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')

    if r and g and b then
      local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
      local group = 'Tw_' .. color

      if vim.api.nvim_call_function('hlID', { group }) < 1 then
        vim.api.nvim_command('highlight' .. ' ' .. group .. ' ' .. 'guifg=#' .. color)
      end

      vim_item.kind = M.lsp_icons.Tailwind
      vim_item.kind_hl_group = group

      return vim_item
    end
  end

  vim_item.kind = M.lsp_icons[vim_item.kind] or vim_item.kind

  return vim_item
end

return M
