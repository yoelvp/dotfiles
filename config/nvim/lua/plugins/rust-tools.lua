return {
  'simrat39/rust-tools.nvim',
  ft = 'rust',
  config = function ()
    local rust_ok, rust = pcall(require, 'rust-tools')

    if (not rust_ok) then
      return
    end

    rust.setup()
  end
}
