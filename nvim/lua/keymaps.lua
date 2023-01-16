local map = function(mode, key, action)
  vim.api.nvim_set_keymap(mode, key, action, { noremap = true, silent = true })
end

-- Escape from INSERT and VISUAL to NORMAL
map('i', ',,', '<Esc>')
map('v', ',,', '<Esc>')

-- Neotree
map('n', '<leader>nt', ':Neotree toggle <CR>')
map('n', '<leader>nf', ':Neotree focus <CR>')
