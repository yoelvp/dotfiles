return {
  'stevearc/conform.nvim',
  event = 'BufReadPre',
  config = function()
    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        astro = { 'eslint_d', 'prettierd', 'eslint', 'prettier' },
        css = { 'stylelint' },
        go = { 'gofmt' },
        javascript = { 'eslint_d', 'eslint', 'prettier' },
        javascriptreact = { 'eslint_d', 'eslint', 'prettier' },
        lua = { 'stylua' },
        html = { 'prettierd', 'eslint_d', 'prettier' },
        rust = { 'rustfmt' },
        typescript = { 'eslint_d', 'prettierd', 'prettier' },
        typescriptreact = { 'eslint_d', 'prettierd', 'prettier' },
        blade = { 'blade-formatter' }
      }
    })

    -- Keymap for format document
    vim.keymap.set({ 'n', 'v' }, '<leader>fm', function()
      conform.format({
        lsp_callback = true,
        async = true,
        timeout_ms = 2500,
      })
    end, { noremap = true, silent = true, desc = 'Format file' })
  end,
}
