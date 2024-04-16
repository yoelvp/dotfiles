return {
  -- Milti cursor
  {
    'mg979/vim-visual-multi',
    branch = 'master',
  },

  -- Autoclose the pair {} [] ''
  {
    'echasnovski/mini.pairs',
    version = '*',
    config = function()
      local pairs = require('mini.pairs')

      pairs.setup({
        modes = { insert = true, command = false, terminal = false },
      })
    end,
  },

  -- Change sorround [] {} '' and more
  {
    'echasnovski/mini.surround',
    event = 'VeryLazy',
    config = function()
      local mini_sorround = require('mini.surround')
      mini_sorround.setup({
        custom_surroundings = nil,
        highlight_duration = 500,
        mappings = {
          add = 'sa',
          delete = 'sd',
          find = 'sf',           -- Find surrounding (to the right)
          find_left = 'sF',      -- Find surrounding (to the left)
          highlight = 'sh',      -- Highlight surrounding
          replace = 'sr',        -- Replace surrounding
          update_n_lines = 'sn', -- Update `n_lines`

          suffix_last = 'l',     -- Suffix to search with "prev" method
          suffix_next = 'n',     -- Suffix to search with "next" method
        },
        n_lines = 20,
        respect_selection_type = false,
        search_method = 'cover',
        silent = false,
      })
    end,
  },

  -- Autoclose tags in html, jsx, tsx and more
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    config = true,
  },

  -- Template string
  {
    'axelvc/template-string.nvim',
    event = 'InsertEnter',
    config = function()
      local template_string = require('template-string')

      template_string.setup({
        filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'python' },
        jsx_brackets = true,
        remove_template_string = false,
        restore_quotes = {
          normal = [[']],
          jsx = [["]],
        },
      })
    end,
  },

  -- Emmet
  {
    'mattn/emmet-vim',
    event = 'VeryLazy',
  },
}
