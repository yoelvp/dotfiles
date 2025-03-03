local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
  return vim.api.nvim_create_augroup('yoelvp_' .. name, { clear = true })
end

-- Close neotree when open a file from Neotree
autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    vim.cmd('Neotree close')
  end,
})

-- Highlight the copied block
autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 400 })
  end,
  group = augroup('yank_highlight'),
})

-- Undeline erros
vim.cmd([[
  let &t_Cs = "\e[4:3m"
  let &t_Ce = "\e[4:0m"
]])
