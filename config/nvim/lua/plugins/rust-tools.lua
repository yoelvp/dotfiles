return {
  'simrat39/rust-tools.nvim',
  ft = 'rust',
  dependencies = 'neovim/nvim-lspconfig',
  config = function (_, opts)
    local rust_ok, rust = pcall(require, 'rust-tools')

    if (not rust_ok) then
      return
    end

    rust.setup(opts)
  end
}
