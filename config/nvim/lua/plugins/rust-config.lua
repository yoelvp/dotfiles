return {
  -- Rust tools config
  {
    'simrat39/rust-tools.nvim',
    ft = 'rust',
    dependencies = 'neovim/nvim-lspconfig',
    config = function(_, opts)
      local rust = require('rust-tools')

      rust.inlay_hints.set()
      rust.setup(opts)
    end
  },

  -- Rust crates config
  {
    'saecki/crates.nvim',
    ft = { 'rust', 'toml' },
    config = function(_, opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end
  }
}
