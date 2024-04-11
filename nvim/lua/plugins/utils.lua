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

  -- Comments
  {
    'numToStr/Comment.nvim',
    lazy = false,
    keys = {
      { 'gcc', mode = 'n',          desc = 'Comment toggle current line' },
      { 'gc',  mode = { 'n', 'o' }, desc = 'Comment toggle linewise' },
      { 'gc',  mode = 'x',          desc = 'Comment toggle linewise (visual)' },
      { 'gbc', mode = 'n',          desc = 'Comment toggle current block' },
      { 'gb',  mode = { 'n', 'o' }, desc = 'Comment toggle blockwise' },
      { 'gb',  mode = 'x',          desc = 'Comment toggle blockwise (visual)' },
    },
    config = function(_, opts)
      local comment = require('Comment')
      comment.setup(vim.tbl_extend('force', opts, {
        pre_hook = function(ctx)
          local utils = require('Comment.utils')
          local location = nil

          if ctx.ctype == utils.ctype.block then
            location = require('ts_context_commentstring.utils').get_cursor_location()
          elseif ctx.cmotion == utils.cmotion.v or ctx.cmotion == utils.cmotion.V then
            location = require('ts_context_commentstring.utils').get_visual_start_location()
          end

          return require('ts_context_commentstring.internal').calculate_commentstring({
            key = ctx.ctype == utils.ctype.line and '__default' or '__multiline',
            location = location,
          })
        end,
      }))
    end,
  },

  -- JSX comments
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
    config = function()
      require('ts_context_commentstring').setup({
        enable_autocmd = false,
        languages = {
          typescript = '// %s',
        },
      })
    end,
  },

  -- TODO comments
  {
    'folke/todo-comments.nvim',
    event = 'InsertEnter',
    lazy = false,
    cmd = { 'TodoTrouble', 'TodoTelescope', 'TodoQuickFix' },
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
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
