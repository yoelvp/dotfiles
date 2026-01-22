---@type vim.lsp.Config
return {
  cmd = {
    'astro-ls',
    '--stdio',
  },
  filetypes = {
    'astro',
  },
  init_options = {
    typescript = {
      tsdk = vim.fn.getcwd() .. '/node_modules/typescript/lib',
    },
  },
}
