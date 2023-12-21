local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Close Neotree when a file is opened
autocmd(
  'BufEnter',
  {
    pattern = '*',
    callback = function ()
      vim.cmd('Neotree close')
    end
  }
)

-- save file when move another file
-- vim.cmd([[
--   autocmd BufLeave * silent! wall
-- ]])

-- Highlight the copied block
autocmd(
  'TextYankPost',
  {
    pattern = '*',
    callback = function()
      vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 400 })
    end,
    group = augroup('yank_highlight', {})
  }
)

-- Undeline erros
vim.cmd([[
  let &t_Cs = "\e[4:3m"
  let &t_Ce = "\e[4:3m"
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

-- cmd([[
--   au BufNewFile *.tpl Or ~/.config/nvim/templates/php.tpl
-- ]])
