return {
  'FabijanZulj/blame.nvim',
  event = 'VeryLazy',
  config = function()
    local blame = require('blame')

    blame.setup({
      width = 40,
      virtual_style = 'float'
    })
  end
}
