return {
  'nvimdev/lspsaga.nvim',
  dependencies = 'kyazdani42/nvim-web-devicons',
  config = function()
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    require('lspsaga').setup({
      ui = {
        devicon = true,
        code_action = nil,
        actionfix = nil,
        kind = nil,
        imp_sign = nil,
        lines = { '┗', '┣', '┃', '━', '┏' },
      },
      symbol_in_winbar = {
        enable = false
      }
    })

    keymap('n', 'gd', ':Lspsaga goto_definition<CR>', opts)
    keymap('n', 'Rn', ':Lspsaga rename ++project<CR>', opts)
    keymap('n', 'H', ':Lspsaga hover_doc<CR>', opts)
    keymap('n', '<C-j>', ':Lspsaga diagnostic_jump_next<CR>', opts)
    keymap('n', '<C-k>', '::Lspsaga diagnostic_jump_prev<CR>', opts)
  end
}
