return {
  -- Gruvbox material
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_enable_italic = true
    end
  },

  -- Solarized Osaka
  {
    'craftzdog/solarized-osaka.nvim',
    priority = 1000,
    config = function()
      local solarized = require('solarized-osaka')

      solarized.setup({
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          sidebars = 'dark',
          floats = 'dark',
        },
        sidebars = { 'qf', 'help' },
      })
    end,
  },
}
