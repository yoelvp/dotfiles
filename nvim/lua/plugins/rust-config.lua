return {
  -- Rust tools config
  {
    'simrat39/rust-tools.nvim',
    ft = 'rust',
    dependencies = 'neovim/nvim-lspconfig',
    config = function(_, opts)
      local rust_tools = require('rust-tools')

      rust_tools.setup(opts)
      rust_tools.inlay_hints.set()
    end,
  },

  -- Rust crates config
  {
    'saecki/crates.nvim',
    ft = { 'rust', 'toml' },
    config = function(_, opts)
      local crates = require('crates')

      crates.setup(opts)
      crates.show()
    end,
  },
}
