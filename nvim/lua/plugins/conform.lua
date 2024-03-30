return {
  'stevearc/conform.nvim',
  event = 'BufReadPre',
  config = function()
    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        css = { 'stylelint' },
        go = { 'gofmt' },
        javascript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        lua = { 'stylua' },
        rust = { 'rustfmt' },
        typescript = { 'prettierd' },
        typescriptreact = { 'prettierd' },
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
