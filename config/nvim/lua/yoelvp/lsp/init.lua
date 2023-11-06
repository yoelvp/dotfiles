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

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev) vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc' end,
})

local on_attach = function()
  vim.keymap.set('n', '<leader>ff', ':lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true })
end

lsp.tsserver.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  cmd = { 'typescript-language-server', '--stdio' }
})

lsp.tailwindcss.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  cmd = { 'tailwindcss-language-server', '--stdio' }
})

lsp.html.setup({
  on_atach = on_attach,
  capabilities = capabilities
})

lsp.jsonls.setup({
  on_atach = on_attach,
  capabilities = capabilities
})

lsp.cssls.setup({
  on_atach = on_attach,
  capabilities = capabilities
})

lsp.rust_analyzer.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  filetypes = { 'rust' },
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true
      }
    }
  }
})

lsp.bashls.setup({
  on_atach = on_attach,
  capabilities = capabilities
})

lsp.sqlls.setup({
  on_atach = on_attach,
  capabilities = capabilities
})

lsp.svelte.setup({
  on_atach = on_attach,
  capabilities = capabilities
})

lsp.dartls.setup({
  cmd = { 'dart', 'language-server', '--protocol=lsp' },
  filetype = { 'dart' },
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true
  },
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true
    }
  }
})

lsp.intelephense.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  filetypes = { 'php' },
  cmd = { 'intelephense', '--stdio' },
  -- root_dir = { 'composer.json', '.git' },
  settings = {
    intelephense = {
      format = {
        braces = 'k&r'
      }
    }
  }
})

lsp.lua_ls.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false
      }
    }
  }
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
