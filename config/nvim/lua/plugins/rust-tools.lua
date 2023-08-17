return {
  'simrat39/rust-tools.nvim',
  ft = 'rust',
  dependencies = 'neovim/nvim-lspconfig',
  -- opts = function ()
  --   local on_attach = require('lspconfig.configs').on_attach
  --   local capabilities = require('lspconfig.configs').capabilities
  --   local options = {
  --     server = {
  --       on_attach = on_attach,
  --       capabilities = capabilities
  --     }
  --   }
  --
  --   return options
  -- end,
  config = function (_, opts)
    local rust_ok, rust = pcall(require, 'rust-tools')

    if (not rust_ok) then
      return
    end

    rust.setup(opts)
  end
}
