return {
  'stevearc/conform.nvim',
  event = 'BufReadPre',
  config = function()
    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        css = { 'stylelint' },
        go = { 'gofmt' },
        javascript = { 'eslint_d' },
        javascriptreact = { 'eslint_d' },
        lua = { 'stylua' },
        html = { 'prettierd' },
        rust = { 'rustfmt' },
        typescript = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
      },
    })

    -- Keymap for format document
    vim.keymap.set({ 'n', 'v' }, '<leader>fm', function()
      conform.format({
        lsp_callback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { noremap = true, silent = true, desc = 'Format file' })
  end,
}
