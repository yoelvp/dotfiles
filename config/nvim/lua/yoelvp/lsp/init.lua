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

lsp.astro.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  cmd = { 'astro-ls', '--stdio' },
  filetypes = { 'astro' },
  init_options = {
    typescript = {}
  },
  root_dir = util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git')
})

lsp.bashls.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  cmd = { 'bash-language-server', 'start' }
})

lsp.cssls.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  filetypes = { 'css', 'scss', 'less' },
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  }
})

lsp.html.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html' }
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

lsp.jsonls.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  filetypes = { 'json', 'jsonc' }
})

lsp.lua_ls.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  cmd = { 'lua' },
  filetypes = { 'lua' },
  root_dir = util.root_pattern(
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git'
  ),
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            version = 'LuaJIT'
          },
          diagnostics = {
            globals = { 'vim' }
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
            }
            -- library = vim.api.nvim_get_runtime_file('', true),
          }
        }
      })

      client.notify('workspace/didChangeConfiguration', {
        settings = { client.config.settings }
      })
    end

    return true
  end
})

lsp.remark_ls.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  filetypes = { 'markdown' }
})

lsp.rust_analyzer.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_dir = util.root_pattern('Cargo.toml'),
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true
      },
      cargo = {
        allFeatures = true
      }
    }
  }
})

lsp.svelte.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  filetypes = { 'svelte' },
  root_dir = util.root_pattern('package.json', '.git', 'tsconfig.json', 'jsconfig.json')
})

lsp.tailwindcss.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  cmd = { 'tailwindcss-language-server', '--stdio' },
  root_dir = util.root_pattern(
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
      validate = true
    }
  }
})

lsp.tsserver.setup({
  on_atach = on_attach,
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
  root_dir = util.root_pattern('tsconfig.json', 'package.json', 'jsconfig.json', '.git'),
  init_options = {
    hostInfo = 'neovim'
  }
})

lsp.volar.setup({
  on_atach = on_attach,
  capabilities = capabilities,
  on_new_config = function(new_config, new_root_directory)
    new_config.init_options.typescript.tsdk = function()
      local global_ts = '/home/yoelvp/.npm/lib/node_modules/typescript/lib'
      local found_ts = ''
      local function check_dir(path)
        found_ts = util.path.join(path, 'node_modules', 'typescript', 'lib')
        if util.path.exists(found_ts) then
          return path
        end
      end
      if util.search_ancestors(new_root_directory, check_dir) then
        return found_ts
      else
        return global_ts
      end
    end
  end
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
