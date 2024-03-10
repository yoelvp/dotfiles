local keymap = vim.keymap.set
local utils = require('yoelvp.utils')
local discipline = require('yoelvp.discipline')
local opts = { noremap = true, silent = true }

discipline.stranger()

-- disable macros
keymap('n', 'q', '<Nop>', opts)

-- Disabled arrow
keymap('n', '<Left>', '<Nop>', opts)
keymap('n', '<Down>', '<Nop>', opts)
keymap('n', '<Up>', '<Nop>', opts)
keymap('n', '<Right>', '<Nop>', opts)

-- Move with <C-{h,j,k,l}>
keymap('i', '<C-h>', '<Left>', opts)
keymap('i', '<C-j>', '<Down>', opts)
keymap('i', '<C-k>', '<Up>', opts)
keymap('i', '<C-l>', '<Right>', opts)

-- Enable wrap mode
keymap('n', '<A-z>', ':set wrap!<CR>', opts)

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G', opts)

-- Move to window
keymap('n', 'sh', '<C-w>h', opts)
keymap('n', 'sl', '<C-w>l', opts)
keymap('n', 'sj', '<C-w>j', opts)
keymap('n', 'sk', '<C-w>k', opts)

-- Horizontal split window
keymap('n', 'ss', ':split<CR> :wincmd j<CR>', opts)

-- Vertical split window
keymap('n', 'sv', ':vsplit<CR> :wincmd l<CR>', opts)

-- Recharge file
keymap('n', '<leader>rl', ':luafi %<CR>', opts, { desc = 'Realod file config' })

-- Move next buffer
keymap('n', '<Tab>', ':bnext<CR>', opts, { desc = 'Move to next buffer' })
keymap('n', '<S-Tab>', ':bprevious<CR>', opts, { desc = 'Move to previous buffer' })
keymap('n', '<C-w>', ':bdelete<CR>', opts)

-- Move line up and down
keymap('n', '<A-j>', '<cmd>m .+1<cr>==', opts, { desc = 'Move down' })
keymap('n', '<A-k>', '<cmd>m .-2<cr>==', opts, { desc = 'Move up' })
keymap('x', '<A-j>', utils.move_selected_down, opts, { desc = 'Move block down' })
keymap('x', '<A-k>', utils.move_selected_up, opts, { desc = 'Move block up' })

-- Duplicate line
keymap('n', '<S-A-k>', utils.duplicate_line_above, opts, { desc = 'Duplicate line above' })
keymap('n', '<S-A-j>', utils.duplicate_line_below, opts, { desc = 'Duplicate line below' })

-- Neotree
keymap('n', 'nf', ':Neotree toggle<CR>', opts, { desc = 'Toggle neotree' })

-- Format document
keymap('n', '<leader>ff', ':lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true }, { desc = 'Format document'})

-- Compile and run rust projects
keymap('n', '<leader>rmk', '[[:w<CR>:term cargo run<CR>]]', opts, { desc = 'Compile rust projects' })

-- Indent
keymap('v', "'", '<gv', opts, { desc = 'Indentation to the right' })
keymap('v', '¿', '>gv', opts, { desc = 'Indentation to the left' })

-- Git blame
keymap('n', '<leader>gb', ':ToggleBlame virtual<CR>', opts, { desc = 'Toggle git blame' })
