return {
  'kyazdani42/nvim-web-devicons',
  dependencies = 'DaikyXendo/nvim-material-icon',
  config = function ()
    local web_devicons_ok, web_devicons = pcall(require, 'nvim-web-devicons')
    local material_icons_ok, material_icons = pcall(require, 'nvim-maaterial-icon')

    if (not web_devicons_ok) then
      return
    end

    if (not material_icons_ok) then
      return
    end

    web_devicons.setup({
      override = material_icons.get_icons()
    })
  end
}
