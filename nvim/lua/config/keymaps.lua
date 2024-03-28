local keymap = vim.keymap.set
local discipline = require('yoelvp.discipline')
local utils = require('yoelvp.utils')
local opts = { noremap = true, silent = true }

discipline.stranger()

keymap('n', 'fn', utils.react.new_file, utils.extendTable(opts, { desc = 'Create a new file' }))

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
keymap('n', '<A-z>', ':set wrap!<CR>', utils.extendTable(opts, { desc = 'Toggle wrap state in the buffer' }))

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G', utils.extendTable(opts, { desc = 'Select all content' }))

-- Move to window
keymap('n', 'sh', '<C-w>h', utils.extendTable(opts, { desc = 'Move the cursor to the left window' }))
keymap('n', 'sl', '<C-w>l', utils.extendTable(opts, { desc = 'Move the cursor to the right window' }))
keymap('n', 'sj', '<C-w>j', utils.extendTable(opts, { desc = 'Move the cursor to the lower window' }))
keymap('n', 'sk', '<C-w>k', utils.extendTable(opts, { desc = 'Move the cursor to the top window' }))

-- Horizontal split window
keymap('n', 'ss', ':split<CR> :wincmd j<CR>', utils.extendTable(opts, { desc = 'Split the buffer horizontally' }))

-- Vertical split window
keymap('n', 'sv', ':vsplit<CR> :wincmd l<CR>', utils.extendTable(opts, { desc = 'Spli the buffer vertically' }))

-- Recharge file
keymap('n', '<leader>rl', ':luafi %<CR>', utils.extendTable(opts, { desc = 'Realod file config' }))

-- Move next buffer
keymap('n', '<Tab>', ':bnext<CR>', utils.extendTable(opts, { desc = 'Move to next buffer' }))
keymap('n', '<S-Tab>', ':bprevious<CR>', utils.extendTable(opts, { desc = 'Move to previous buffer' }))
keymap('n', '<C-w>', ':bdelete<CR>', opts)

-- Move line up and down
keymap('n', '<A-j>', ':move .+1<CR>==', utils.extendTable(opts, { desc = 'Move down' }))
keymap('n', '<A-k>', ':move .-2<CR>==', utils.extendTable(opts, { desc = 'Move up' }))
keymap('x', '<A-j>', ":move '>+1<CR>gv=gv", utils.extendTable(opts, { desc = 'Move block up' }))
keymap('x', '<A-k>', ":move '<-2<CR>gv=gv", utils.extendTable(opts, { desc = 'Move block down' }))

-- Duplicate line
keymap('n', '<S-A-k>', utils.duplicate_line_above, utils.extendTable(opts, { desc = 'Duplicate line above' }))
keymap('n', '<S-A-j>', utils.duplicate_line_below, utils.extendTable(opts, { desc = 'Duplicate line below' }))

-- Format document
keymap('n', '<leader>ff', ':lua vim.lsp.buf.format({ async = true })<CR>', utils.extendTable(opts, { desc = 'Format document'}))

-- Compile and run rust projects
keymap('n', '<leader>rmk', '[[:w<CR>:term cargo run<CR>]]', utils.extendTable(opts, { desc = 'Compile rust projects' }))

-- Indent
keymap('x', "'", '<gv', utils.extendTable(opts, { desc = 'Indentation to the right in VISUAL mode' }))
keymap('n', "'", ':normal! <<<CR>', utils.extendTable(opts, { desc = 'Indentation to the right in NORMAL mode' }))
keymap('x', '¿', '>gv', utils.extendTable(opts, { desc = 'Indentation to the left in VISUAL mode' }))
keymap('n', '¿', ':normal! >><CR>', utils.extendTable(opts, { desc = 'Indentation to the left in NORMAL mode' }))

-- Git blame
keymap('n', '<leader>gb', ':ToggleBlame virtual<CR>', utils.extendTable(opts, { desc = 'Toggle git blame' }))

-- Markdown toggle preview
keymap('n', 'mp', ':MarkdownPreviewToggle<CR>', utils.extendTable(opts, { desc = 'Toggle markdown preview' }))
