local lsp = require('lspconfig')
local nvim_lsp = require('cmp_nvim_lsp')
local util = require('lspconfig/util')
local keymap = vim.keymap.set
local ts_builtin = require('telescope.builtin')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = nvim_lsp.default_capabilities(capabilities)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { noremap = true, silent = true }
    keymap('n', 'gd', vim.lsp.buf.definition, opts, { desc = 'Go to definition' })
    keymap('n', 'gr', ts_builtin.lsp_references, opts, { desc = 'Go to references' })
    keymap('n', 'rn', ':lua vim.lsp.buf.rename()<CR>', opts, { desc = 'Rename variables' })
    keymap('n', 'H', ':lua vim.lsp.buf.hover()<CR>', opts)
    keymap('n', 'K', ':lua vim.lsp.buf.signature_help()<CR>', opts)
    keymap('n', '<C-j>', ':lua vim.diagnostic.goto_next()<CR>', opts)
    keymap('n', '<C-k>', ':lua vim.diagnostic.goto_prev()<CR>', opts)
    keymap('n', '<leader>ge', ':lua vim.diagnostic.open_float()<CR>', opts)
    -- keymap('n', '<leader>gl', ':lua vim.diagnostic.setloclist()<CR>', opts)
  end,
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

lsp.astro.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  cmd = { 'astro-ls', '--stdio' },
  filetypes = { 'astro' }
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
  root_dir = util.root_pattern('Cargo.toml'),
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

lsp.svelte.setup({
  on_atach = on_attach,
  capabilities = capabilities
})

lsp.intelephense.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  filetypes = { 'php', 'blade', 'blade.php' },
  cmd = { 'intelephense', '--stdio' },
  root_dir = util.root_pattern('composer.json', '.git', '.editorconfig'),
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
