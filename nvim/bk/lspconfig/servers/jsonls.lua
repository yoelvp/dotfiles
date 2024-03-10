local lsp_attach = require('yoelvp.lspconfig.attach')
local lsp_flags = require('yoelvp.lspconfig.flags')

return function(ops)
  local config = {
    on_attach = lsp_attach,
    flags = lsp_flags,
  }
  if vim.fn.executable 'json-languageserver' == 1 then
    config.cmd = { 'json-languageserver', '--stdio' }
  end

  return vim.tbl_extend('force', config, ops)
end
