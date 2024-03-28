return {
  -- Milti cursor
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    init = function ()
      vim.g.VM_maps = {
        ["I BS"] = '', -- disable backspace mapping
      }
    end
  },

  -- Autoclose the pair {} [] ''
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { 'TelescopePrompt', 'vim' },
        map_bs = true
      })
    end
  },

  -- Comments
  {
    'numToStr/Comment.nvim',
    lazy = false,
    keys = {
      { 'gcc', mode = 'n', desc = 'Comment toggle current line' },
      { 'gc', mode = { 'n', 'o' }, desc = 'Comment toggle linewise' },
      { 'gc', mode = 'x', desc = 'Comment toggle linewise (visual)' },
      { 'gbc', mode = 'n', desc = 'Comment toggle current block' },
      { 'gb', mode = { 'n', 'o' }, desc = 'Comment toggle blockwise' },
      { 'gb', mode = 'x', desc = 'Comment toggle blockwise (visual)' },
    },
    config = function(_, opts)
      local comment = require('Comment')
      comment.setup(vim.tbl_extend('force', opts, {
        pre_hook = function (ctx)
          local utils = require('Comment.utils')
          local location = nil

          if ctx.ctype == utils.ctype.block then
            location = require('ts_context_commentstring.utils').get_cursor_location()
          elseif ctx.cmotion == utils.cmotion.v or ctx.cmotion == utils.cmotion.V then
            location = require('ts_context_commentstring.utils').get_visual_start_location()
          end

          return require('ts_context_commentstring.internal').calculate_commentstring({
            key = ctx.ctype == utils.ctype.line and '__default' or '__multiline',
            location = location
          })
        end
      }))
    end,
  },

  -- JSX comments
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
    opts = {
      enable_autocmd = false
    },
    config = function ()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
        languages = {
          typescript = '// %s',
        }
      }
    end
  },

  -- TODO comments
  {
    'folke/todo-comments.nvim',
    event = 'InsertEnter',
    lazy = false,
    cmd = { 'TodoTrouble', 'TodoTelescope', 'TodoQuickFix' },
    dependencies = 'nvim-lua/plenary.nvim',
    config = true
  },

  -- Change sorround [] {} '' and more
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({})
    end
  },

  -- Autoclose tags in html, jsx, tsx and more
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    config = true
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
          jsx = [["]]
        }
      })
    end
  },

  -- Emmet
  {
    'mattn/emmet-vim'
  }
}
