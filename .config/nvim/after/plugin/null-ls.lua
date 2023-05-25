local ok, null_ls = pcall(require, 'null-ls')

if (not ok) then return end

null_ls.setup({
  sources = {
    -- null_ls.builtins.formatting.prettierd,
    -- null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    -- null_ls.builtins.completion.spell,
    -- null_ls.builtins.formatting.prettierd
  }
})
