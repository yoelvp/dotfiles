local lsp_ok, lsp = pcall(require, 'lspconfig')
local nvim_lsp_ok, nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if (not lsp_ok) then return end
if (not nvim_lsp_ok) then return end

local capabilities = nvim_lsp.default_capabilities()

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<C-i>", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

lsp.tsserver.setup({
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  cmd = { "typescript-language-server", "--stdio" },
})

lsp.tailwindcss.setup({
  cmd = { "tailwindcss-language-server", "--stdio" },
  capabilities = capabilities,
})

lsp.html.setup({
  capabilities = capabilities,
})

lsp.cssls.setup({
  capabilities = capabilities,
})

lsp.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {},
  },
})

lsp.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
})

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = 'always', -- Or "if_many"
  },
})
