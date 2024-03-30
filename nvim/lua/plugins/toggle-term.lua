return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require('toggleterm').setup({
      direction = 'float',
      open_mapping = [[<leader>tt]],
      persist_mode = false,
      start_in_insert = true
    })

    -- keymaps
    vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { desc = 'Open Term in horizontal mode' })
    vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical size=80<CR>', { desc = 'Open Term in vertical mode' })
  end
}
