return {
  'akinsho/toggleterm.nvim',
  version = '*',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>th',
      '<cmd>ToggleTerm direction=horizontal<CR>',
      { noremap = true, silent = true, desc = 'Open terminal in horizontal mode' },
    },
    {
      '<leader>tv',
      ':ToggleTerm direction=vertical size=80<CR>',
      { noremap = true, silent = true, desc = 'Open Term in vertical mode' },
    },
  },
  config = function()
    require('toggleterm').setup({
      direction = 'float',
      open_mapping = [[<leader>tt]],
      persist_mode = false,
      start_in_insert = true,
      terminal_mappings = true
    })
  end,
}
