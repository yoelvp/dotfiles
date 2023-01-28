local keymap = function(mode, key, action)
  vim.api.nvim_set_keymap(mode, key, action, { noremap = true, silent = true })
end

-- Quit to Normal mode
keymap('i', ';;', '<Esc>')
keymap('v', ';;', '<Esc>')


keymap('i', '<C-h>', '<Left>')
keymap('i', '<C-j>', '<Down>')
keymap('i', '<C-k>', '<Up>')
keymap('i', '<C-l>', '<Right>')
--
-- Neotree
keymap('n', '<leader>nt', ':Neotree toggle<CR>')
keymap('n', '<leader>nf', ':Neotree focus<CR>')
