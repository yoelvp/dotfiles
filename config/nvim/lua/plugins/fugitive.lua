return {
  'tpope/vim-fugitive',
  cmd = { 'G', 'Git' },
  keys = {
    { '<leader>gp',  ':Git push', desc = 'Git push' },
    { '<leader>gl',  ':Git pull<cr>',           desc = 'Git pull' },
  },
}
