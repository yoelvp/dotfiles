return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v2.x',
  cmd = 'Neotree',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    {
      's1n7ax/nvim-window-picker',
      branch = 'v1.*',
      config = function()
        require('window-picker').setup({
          autoselect_one = true,
          include_current = false,
          filter_rules = {
            bo = {
              filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
              buftype = { 'terminal', 'quickfix' },
            },
          },
          other_win_hl_color = '#e35e4f',
        })
      end,
    },
  },
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == 'directory' then
        require('neo-tree')
      end
    end
  end,
  config = function() require('yoelvp.neotree') end,
}
