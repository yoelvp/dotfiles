local lsp_ok, lsp = pcall(require, 'lspconfig')
local nvim_lsp_ok, nvim_lsp = pcall(require, 'cmp_nvim_lsp')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = nvim_lsp.default_capabilities(capabilities)

if not lsp_ok then
  return
end
if not nvim_lsp_ok then
  return
end

local on_atach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gd', vim.lsp.buf.definition, opts)
  -- buf_set_keymap("n", "<space>D", vim.lsp.buf.type_definition, opts)
  -- buf_set_keymap("n", "<space>rn", vim.lsp.buf.rename, opts)
  -- buf_set_keymap({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
  -- vim.keymap.set("n", "<C-f>", ":lua vim.lsp.buf.format({ async = true })", opts)
  -- buf_set_keymap("n", "<C-i>", function()
  -- 	vim.lsp.buf.format({
  -- 		filter = function(client)
  -- 			return client.name == "null-ls"
  -- 		end,
  -- 		bufnr = bufnr,
  -- 	})
  -- end, opts)
end

lsp.tsserver.setup({
  on_atach = on_atach,
  capabilities = capabilities,
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  cmd = { 'typescript-language-server', '--stdio' },
})

lsp.tailwindcss.setup({
  on_atach = on_atach,
  capabilities = capabilities,
  cmd = { 'tailwindcss-language-server', '--stdio' },
})

lsp.html.setup({
  on_atach = on_atach,
  capabilities = capabilities,
})

lsp.cssls.setup({
  on_atach = on_atach,
  capabilities = capabilities,
})

lsp.rust_analyzer.setup({
  on_atach = on_atach,
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {},
  },
})

lsp.java_language_server.setup({
  on_atach = on_atach,
  capabilities = capabilities,
})

lsp.bashls.setup({
  on_atach = on_atach,
  capabilities = capabilities,
})

lsp.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
    },
  },
})

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  },
  update_in_insert = true,
  float = {
    source = 'always', -- Or 'if_many'
  },
})
