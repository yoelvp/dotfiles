return {
  'rest-nvim/rest.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function()
    local rest = require('rest-nvim')
    rest.setup({
      result_split_horizontal = false,
      result_split_in_place = false,
      skip_ssl_verification = false,
      encode_url = true,
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        show_url = true,
        show_curl_command = false,
        show_http_info = true,
        show_headers = false,
        formatters = {
          json = 'jq',
          html = function(body) return vim.fn.system({ 'tidy', '-i', '-q', '-' }, body) end
        }
      },
      jump_to_request = false,
      env_file = '.env',
      custom_dynamic_variables = {},
      yank_dry_run = true
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'http',
      callback = function()
        local buff = tonumber(vim.fn.expand('<abuf>'), 10)
        vim.keymap.set('n', '<leader>rt', rest.run, { noremap = true, buffer = buff })
      end
    })
  end
}
