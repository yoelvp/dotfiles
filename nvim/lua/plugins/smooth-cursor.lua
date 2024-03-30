return {
  'gen740/SmoothCursor.nvim',
  config = function()
    require('smoothcursor').setup({
      cursor = '󰣇',
    })

    local foreground = '#fe094e'
    local background = '#3C3835'
    local autocmd = vim.api.nvim_create_autocmd

    vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = foreground, bg = background })

    autocmd({ 'ModeChanged' }, {
      callback = function()
        local current_mode = vim.fn.mode()
        if current_mode == 'n' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = foreground, bg = background })
          vim.fn.sign_define('smoothcursor', { text = '󰣇' })
        elseif current_mode == 'v' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = foreground, bg = background })
          vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == 'V' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = foreground, bg = background })
          vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == '\22' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = foreground, bg = background })
          vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == 'i' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = foreground, bg = background })
          vim.fn.sign_define('smoothcursor', { text = '' })
        end
      end,
    })
  end,
}
