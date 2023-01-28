local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
builtin.file_ignore_patterns = {
  'node_modules/*',
  'vendor/*'
}

require('nvim-web-devicons').setup({
  override = {},
  default = true
})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = actions.preview_scrolling_up,
        ['<C-d>'] = actions.preview_scrolling_down,
        ['<Esc>'] = actions.close
      }
    }
  }
}
