local keymap = vim.keymap.set
local lsp = require('lspconfig')
local nvim_lsp = require('cmp_nvim_lsp')
local lsp_util = require('lspconfig.util')
local utils = require('yoelvp.utils')
local ts_builtin = require('telescope.builtin')
--[[ local capabilities = vim.lsp.protocol.make_client_capabilities() ]]
local opts = { noremap = true, silent = true }

local capabilities = nvim_lsp.default_capabilities()

local new_options = function(new_opts)
  return utils.extend_tbl(opts, new_opts)
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),

  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client == nil then
      return
    end

    if client.supports_method('textDocument/completion') then
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
    end
    if client.supports_method('textDocument/definition') then
      vim.bo[bufnr].tagfunc = 'v:lua.vim.lsp.tagfunc'
    end

    keymap('n', 'gd', vim.lsp.buf.definition, new_options({ desc = 'Go to definition' }))
    keymap('n', 'gr', ts_builtin.lsp_references, new_options({ desc = 'Go to references' }))
    keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', new_options({ desc = 'LSP implementation' }))
    keymap('n', 'rn', ':lua vim.lsp.buf.rename()<CR>', new_options({ desc = 'Rename variables' }))
    keymap('n', 'H', ':lua vim.lsp.buf.hover()<CR>', opts)
    keymap('n', 'K', ':lua vim.lsp.buf.signature_help()<CR>', opts)
    keymap('n', '<C-j>', ':lua vim.diagnostic.goto_next()<CR>', opts)
    keymap('n', '<C-k>', ':lua vim.diagnostic.goto_prev()<CR>', opts)
    keymap('n', '<leader>ge', ':lua vim.diagnostic.open_float()<CR>', opts)
    keymap('n', '<leader>ff', ':lua vim.lsp.buf.format({ async = true })<CR>', new_options({ desc = 'Format document' }))
  end,
})

local on_attach = function()
  keymap('n', '<leader>ff', ':lua vim.lsp.buf.format({ async = true })<CR>', new_options({ desc = 'Format document' }))
end

lsp.astro.setup({
  --[[ on_attach = on_attach, ]]
  capabilities = capabilities,
  cmd = { 'astro-ls', '--stdio' },
  filetypes = { 'astro' },
  init_options = {
    typescript = {}
  },
  root_dir = lsp_util.root_pattern(
    'astro.config.ts',
    'astro.config.js',
    'package.json',
    'tsconfig.json',
    'jsconfig.json',
    '.git'
  )
})

lsp.bashls.setup({
  --[[ on_attach = on_attach, ]]
  capabilities = capabilities,
  cmd = { 'bash-language-server', 'start' },
})

lsp.cssls.setup({
  --[[ on_attach = on_attach, ]]
  capabilities = capabilities,
  filetypes = { 'css', 'scss', 'less', 'ts', 'tsx' },
  settings = {
    css = {
      validate = true,
    },
    less = {
      validate = true,
    },
    scss = {
      validate = true,
    },
  },
})

lsp.gopls.setup({
  --[[ on_attach = on_attach, ]]
  capabilities = capabilities,
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_dir = lsp_util.root_pattern('go.work', 'go.mod', '.git'),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

lsp.html.setup({
  --[[ on_attach = on_attach, ]]
  capabilities = capabilities,
  filetypes = { 'html' },
})

lsp.intelephense.setup({
  --[[ on_attach = on_attach, ]]
  capabilities = capabilities,
  filetypes = { 'php', 'blade', 'blade.php' },
  cmd = { 'intelephense', '--stdio' },
  root_dir = lsp_util.root_pattern('composer.json', '.git', '.editorconfig'),
  settings = {
    intelephense = {
      format = {
        braces = 'k&r',
      },
    },
  },
})

lsp.jdtls.setup({
  capabilities = capabilities,
  filetypes = { 'java' },
})

lsp.jsonls.setup({
  --[[ on_attach = on_attach, ]]
  capabilities = capabilities,
  filetypes = { 'json', 'jsonc' },
})

lsp.lua_ls.setup({
  --[[ on_attach = on_attach, ]]
  capabilities = capabilities,
  filetypes = { 'lua' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
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
    },
  },
})

lsp.rust_analyzer.setup({
  --[[ on_attach = on_attach, ]]
  capabilities = capabilities,
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_dir = lsp_util.root_pattern('Cargo.toml'),
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true,
      },
      cargo = {
        allFeatures = true,
      },
    },
  },
})

lsp.svelte.setup({
  --[[ on_attach = on_attach, ]]
  capabilities = capabilities,
  filetypes = { 'svelte' },
  root_dir = lsp_util.root_pattern('package.json', '.git', 'tsconfig.json', 'jsconfig.json'),
})

lsp.tailwindcss.setup({
  --[[ on_attach = on_attach, ]]
  capabilities = capabilities,
  cmd = { 'tailwindcss-language-server', '--stdio' },
  root_dir = lsp_util.root_pattern(
    'tailwind.config.js',
    'tailwind.config.cjs',
    'tailwind.config.mjs',
    'tailwind.config.ts',
    'postcss.config.js',
    'postcss.config.cjs',
    'postcss.config.mjs',
    'postcss.config.ts',
    'package.json',
    'node_modules',
    '.git'
  ),
  settings = {
    tailwindCSS = {
      classAttributes = { 'class', 'className', 'class:list', 'classList', 'ngClass' },
      validate = true,
    },
  },
})

lsp.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  root_dir = lsp_util.root_pattern('tsconfig.json', 'package.json', 'jsconfig.json', '.git'),
  init_options = {
    hostInfo = 'neovim',
  },
})

lsp.yamlls.setup({
  cmd = { 'yaml-language-server', '--stdio' },
  settings = {
    redhat = {
      telemetry = {
        enabled = false
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
    source = 'always',
  },
})
