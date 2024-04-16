return {
  {
    'tpope/vim-fugitive',
    cmd = { 'G', 'Git' },
    keys = {
      { '<leader>ga', ':Git fetch --all -p<cr>', desc = 'Git fetch' },
      { '<leader>gl', ':Git pull<cr>', desc = 'Git pull' },
      { '<leader>gdh', ':diffget //2<cr>', desc = 'Git diff grab from left' },
      { '<leader>gdl', ':diffget //3<cr>', desc = 'Git diff grab from right' },
    },
  },
  -- Git signs
  {
    'lewis6991/gitsigns.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      local gitsigns = require('gitsigns')

      gitsigns.setup({
        signcolumn = true,
        numhl = true,
        trouble = false,
        max_file_length = 10000,
      })
    end,
  },

  -- Git blame
  {
    'FabijanZulj/blame.nvim',
    event = 'VeryLazy',
    config = function()
      local blame = require('blame')

      blame.setup({
        width = 40,
        virtual_style = 'float',
      })
    end,
  },
}
