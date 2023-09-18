return {
  'lewis6991/gitsigns.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    local gitsigns_ok, gitsigns = pcall(require, 'gitsigns')

    if (not gitsigns_ok) then return end

    gitsigns.setup({
      signcolumn = true,
      numhl = true,
      trouble = false,
      max_file_length = 10000
    })
  end
}
