local map = function(mode, key, action)
  vim.api.nvim_set_keymap(mode, key, action, { noremap = true, silent = true })
end

-- change of insert mode to normal mode
map('i', 'jj', '<Esc>')
map('i', 'kk', '<Esc>')
map('i', 'hh', '<Esc>')
map('i', 'll', '<Esc>')
map('i', '<Up>', '<Esc>')
map('i', '<Down>', '<Esc>')
map('i', '<Left>', '<Esc>')
map('i', '<Right>', '<Esc>')
map('i', 'ww', '<Esc>')
map('i', 'bb', '<Esc>')

-- usage for arrows in insert mode
map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

-- line break
map('n', '<A-z>', ':set nolinebreak<CR>')
map('i', '<A-z>', ':set nolinebreak<CR>')
map('v', '<A-z>', ':set nolinebreak<CR>')

-- neotree for toggle and focus
map('n', '<leader>tf', ':Neotree toggle<CR>')
map('n', '<leader>ff', ':Neotree focus<CR>')

-- move line up and down
map('n', '<A-Up>', ':m .-2<CR>==')
map('n', '<A-Down>', ':m .+1<CR>==')

-- move a block of lines
map('v', '<A-Up>', ':\'<,\'>:m .-2<CR>==')
map('v', '<A-Down>', ':\'<,\'>:m .+1<CR>==')

-- move buffers
-- map('n', '<C-S-Tab>', ':bprevious<CR>')
map('n', '<C-Tab>', ':bnext<CR>')
map('n', '<C-W>', ':bdelete<CR>')

-- open lazygit
map('n', '<leader>lg', ':LazyGit<CR>')
