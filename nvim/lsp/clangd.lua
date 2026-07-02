---@type vim.lsp.Config
return {
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
  root_markers = {
    "Makefile",
    ".git"
  }
}
