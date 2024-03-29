local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
  return vim.api.nvim_create_augroup('lazyvim_' .. name, { clear = true })
end

-- Go to last loc when opening a buffer
autocmd('BufReadPost', {
  group = augroup('last_loc'),
  callback = function(event)
    local exclude = { 'gitcommit' }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end
})

-- Highlight the copied block
autocmd(
  'TextYankPost',
  {
    pattern = '*',
    callback = function()
      vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 400 })
    end,
    group = augroup('yank_highlight')
  }
)

-- Undeline erros
vim.cmd([[
  let &t_Cs = "\e[4:3m"
  let &t_Ce = "\e[4:0m"
]])

-- Use templates in files
autocmd(
  'BufNewFile',
  {
    pattern = '*',
    callback = function()
      local extension = vim.fn.expand('%:e')
      local template = vim.env.HOME .. '/.config/nvim/templates/' .. extension .. '.tpl'
      local file = io.open(template, 'r')

      if file ~= nil then
        local lines = {}

        for line in io.lines(template) do
          lines[#lines + 1] = line
        end

        vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
      end
    end
  }
)

autocmd(
  'BufEnter',
  {
    pattern = '*',
    group = augroup('dashboard_on_empty'),
    callback = function (event)
      local buf_id = event.buf
      local buf_name = vim.api.nvim_buf_get_name(buf_id)
      local buf_ft = vim.api.nvim_buf_get_option(buf_id, 'filetype')
      local buf_type = vim.api.nvim_buf_get_option(buf_id, 'buftype')

      if buf_id ~= 1 and buf_name == '' and  buf_ft == '' and buf_type ~= 'nofile' then
        vim.cmd('Dashboard')
      end
    end
  }
)
