return {
  cmd = {
    "lua-language-server",
  },
  filetypes = {
    "lua",
  },
  root_markers = {
    ".git",
    ".luacheckrc",
    ".luarc.json",
    ".luarc.jsonc",
    ".stylua.toml",
    "selene.toml",
    "selene.yml",
    "stylua.toml",
  },
  settings = {
    Lua = {
      diagnostics = {
        disable = { "missing-parameters", "missing-fields" },
        globals = { 'vim' },
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file('', true),
      },
      hint = {
        enable = true,
      },
      telemetry = {
        enable = false,
      },
      runtime = {
        version = "LuaJIT"
      },
    },
  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
}
