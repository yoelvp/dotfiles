local keymap = vim.keymap.set
local discipline = require('yoelvp.discipline')
local utils = require('yoelvp.utils')
local opts = { noremap = true, silent = true }

local new_options = function(new_opts)
  return utils.extend_tbl(opts, new_opts)
end

discipline.stranger()

-- disable macros
keymap('n', 'q', '<Nop>', new_options({ desc = 'Disable keymap for save macros' }))

-- Disabled arrow
keymap('n', '<Left>', '<Nop>', new_options({ desc = 'Disable Left arrow ' }))
keymap('n', '<Down>', '<Nop>', new_options({ desc = 'Disable Down arrow ' }))
keymap('n', '<Up>', '<Nop>', new_options({ desc = 'Disable Up arrow' }))
keymap('n', '<Right>', '<Nop>', new_options({ desc = 'Disable Right arrow' }))

-- Move with <C-{h,j,k,l}>
keymap('i', '<C-h>', '<Left>', new_options({ desc = 'Move Left with arrow in INSERT mode' }))
keymap('i', '<C-j>', '<Down>', new_options({ desc = 'Move Down with arrow in INSERT mode' }))
keymap('i', '<C-k>', '<Up>', new_options({ desc = 'Move Up with arrow in INSERT mode' }))
keymap('i', '<C-l>', '<Right>', new_options({ desc = 'Move Right with arrow in INSERT mode' }))

-- Enable wrap mode
keymap('n', '<A-z>', ':set wrap!<CR>', new_options({ desc = 'Toggle wrap state in the buffer' }))

-- Select all
keymap('n', 'ya', ':%y+<CR>', new_options({ desc = 'File copy whole' }))

-- Move to window
keymap('n', 'sh', '<C-w>h', new_options({ desc = 'Move the cursor to the left window' }))
keymap('n', 'sl', '<C-w>l', new_options({ desc = 'Move the cursor to the right window' }))
keymap('n', 'sj', '<C-w>j', new_options({ desc = 'Move the cursor to the lower window' }))
keymap('n', 'sk', '<C-w>k', new_options({ desc = 'Move the cursor to the top window' }))

-- Horizontal split window
keymap('n', 'ss', ':split<CR> :wincmd j<CR>', new_options({ desc = 'Split the buffer horizontally' }))

-- Vertical split window
keymap('n', 'sv', ':vsplit<CR> :wincmd l<CR>', new_options({ desc = 'Spli the buffer vertically' }))

-- Recharge file
keymap('n', '<leader>rl', ':luafi %<CR>', new_options({ desc = 'Realod file config' }))

-- Move next buffer
keymap('n', '<Tab>', ':bnext<CR>', new_options({ desc = 'Move to next buffer' }))
keymap('n', '<S-Tab>', ':bprevious<CR>', new_options({ desc = 'Move to previous buffer' }))
keymap('n', '<C-w>', utils.delete_current_buffer, new_options({ desc = 'Remove current buffer' }))

-- Move line up and down
keymap('n', '<A-j>', ':move .+1<CR>==', new_options({ desc = 'Move down' }))
keymap('n', '<A-k>', ':move .-2<CR>==', new_options({ desc = 'Move up' }))
keymap('x', '<A-j>', ":move '>+1<CR>gv=gv", new_options({ desc = 'Move block up' }))
keymap('x', '<A-k>', ":move '<-2<CR>gv=gv", new_options({ desc = 'Move block down' }))

-- Duplicate line
keymap('n', '<S-A-k>', utils.duplicate_line_above, new_options({ desc = 'Duplicate line above' }))
keymap('n', '<S-A-j>', utils.duplicate_line_below, new_options({ desc = 'Duplicate line below' }))

-- Format document
keymap('n', '<leader>ff', ':lua vim.lsp.buf.format({ async = true })<CR>', new_options({ desc = 'Format document' }))

-- Compile and run rust projects
keymap('n', '<leader>rmk', '[[:w<CR>:term cargo run<CR>]]', new_options({ desc = 'Compile rust projects' }))

-- Indent
keymap('x', "'", '<gv', new_options({ desc = 'Indentation to the right in VISUAL mode' }))
keymap('n', "'", ':normal! <<<CR>', new_options({ desc = 'Indentation to the right in NORMAL mode' }))
keymap('x', '¿', '>gv', new_options({ desc = 'Indentation to the left in VISUAL mode' }))
keymap('n', '¿', ':normal! >><CR>', new_options({ desc = 'Indentation to the left in NORMAL mode' }))

-- Git blame
keymap('n', '<leader>gb', ':ToggleBlame virtual<CR>', new_options({ desc = 'Toggle git blame' }))

-- Markdown toggle preview
keymap('n', 'mp', ':MarkdownPreviewToggle<CR>', new_options({ desc = 'Toggle markdown preview' }))

-- Open Oil
keymap('n', '<leader>ft', ':Oil<CR>', new_options({ desc = 'Open Oil for edit files and directories' }))

-- Codesnap
keymap({ 'v', 'x' }, '<leader>cs', ':CodeSnap<CR>', new_options({ desc = 'Save screenshot to clipboard' }))
keymap({ 'v', 'x' }, '<leader>cS', ':CodeSnapSave<CR>', new_options({ desc = 'Save the code capture locally' }))

-- Leader key for Emmet
vim.cmd("let g:user_emmet_leader_key='<M-z>'")
