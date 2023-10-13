return {
  'olimorris/onedarkpro.nvim',
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function()
    require('onedarkpro').setup({
      styles = {
        types = 'NONE',
        methods = 'NONE',
        numbers = 'NONE',
        strings = 'NONE',
        comments = 'italic',
        keywords = 'italic',
        constants = 'NONE',
        functions = 'NONE',
        operators = 'NONE',
        variables = 'NONE',
        parameters = 'NONE',
        conditionals = 'italic',
        virtual_text = 'NONE',
      },
      options = {
        cursorline = true
      }
    })
    vim.cmd('colorscheme onedark_vivid')
  end
}
