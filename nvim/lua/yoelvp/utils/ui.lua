local M = {}

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

-- Move selected block down
-- TODO: Make selected code block move down
function M.move_selected_down()
  local select_lines = vim.fn.getpos("'<")[2] .. ',' .. vim.fn.getpos("'>")[2]
  vim.api.nvim_command(select_lines .. "m '>+1")
end

-- Move selected block up
-- TODO: Make selected code block move up
function M.move_selected_up()
  local select_lines = vim.fn.getpos("'<")[2] .. ',' .. vim.fn.getpos("'>")[2]
  vim.api.nvim_command(select_lines .. "m '>-2")
end

return M
