return {
  -- Milti cursor
  {
    'mg979/vim-visual-multi',
    branch = 'master',
  },

  -- Autoclose the pair {} [] ''
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      disabled_filetype = { 'TelescopePrompt', 'spectre_panel' },
      map_bs = false
    },
    config = true
  },

  -- Change sorround [] {} '' and more
  {
    'tpope/vim-surround'
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
