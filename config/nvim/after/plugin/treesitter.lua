local ok, treesitter = pcall(require, 'nvim-treesitter.configs')

if not ok then
  return
end

treesitter.setup({
  ensure_installed = {
    'c',
    'lua',
    'rust',
    'java',
    'bash',
    'css',
    'scss',
    'html',
    'javascript',
    'json',
    'markdown',
    'markdown_inline',
    'tsx',
    'typescript',
  },
  sync_install = true,
  auto_install = true,
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
})
