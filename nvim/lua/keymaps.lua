vim.g.mapleader = ' '
local cmd = vim.cmd
local builtin = require('telescope.builtin')
local keymap = function(mode, key, action)
  vim.api.nvim_set_keymap(mode, key, action, { noremap = true })
end

keymap('n', '<M-down>', ':move-cmd -down <CR>')
keymap('n', '<M-up>', ':move-cmd -up <CR>')

-- Exit to mode NORMAL
keymap('i', ',,', '<Esc>')
keymap('n', ',,', '<Esc>')

-- Keymaping Neotree
keymap('n', '<leader>nt', ':Neotree toggle<CR>')
keymap('n', '<leader>nf', ':Neotree focus<CR>')
cmd([[
  autocmd BufEnter * :Neotree close
]])

-- Keymaps for the Telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

