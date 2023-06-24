return {
  'kyazdani42/nvim-web-devicons',
  config = function()
    local ok, icons = pcall(require, 'nvim-web-devicons')

    if (not ok) then return end

    icons.setup({
      override = {},
      default = true
    })
  end
}
