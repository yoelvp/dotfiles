return {
  'rcarriga/nvim-notify',
  keys = {
    {
      '<leader>un',
      function()
        require('notify').dismiss({ silent = true, pending = true })
      end,
      desc = 'Dismiss All Notifications',
    },
  },
  opts = {
    render = 'compact',
    timeout = 1000,
    top_down = false,
  },
  config = function(_, opts)
    local notify = require('notify')
    -- this for transparency
    notify.setup(opts)

    -- this overwrites the vim notify function
    vim.notify = notify
  end,
}
