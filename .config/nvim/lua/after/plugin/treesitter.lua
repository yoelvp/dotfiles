local ok, treesitter = pcall(require, 'nvim-treesitter.configs')

if (not ok) then
  return
end

treesitter.setup({
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true,
    disable = {}
  },
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "tsx",
    "typescript",
    'javascript',
    'tsx',
    "toml",
    "json",
    "yaml",
    "swift",
    "css",
    "html",
    "lua",
    'rust'
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable         = true,
    enable_autocmd = false
  }
})
