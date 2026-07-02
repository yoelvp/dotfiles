local cmp_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_lsp.default_capabilities()

vim.lsp.config("*", {
  capabilities = capabilities,
  root_markers = { '.git', 'package.json', 'Cargo.toml', 'composer.json', '.astro' },
})

vim.lsp.enable({
  "angularls",
  "astro",
  "bashls",
  "cssls",
  "clangd",
  "html",
  "intelephense",
  "jsonls",
  "laravel_ls",
  "lua_ls",
  "php_actor",
  "rust_analyzer",
  "svelte",
  "tailwindcss",
  "ts_ls",
})

vim.diagnostic.config({
  virtual_lines = false,
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})

---@type vim.diagnostic.JumpOpts
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('yoelvp_lsp_attach', { clear = true }),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = args.buf
    local opts = { buffer = bufnr, silent = true }
    local keymap = vim.keymap.set

    keymap('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'Go to definition' }))
    keymap('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = 'Go to references' }))
    keymap('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = 'LSP implementation' }))
    keymap('n', 'rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename variables' }))
    keymap('n', 'H', vim.lsp.buf.hover, opts)
    keymap('n', 'K', vim.lsp.buf.signature_help, opts)
    keymap('n', '<C-j>', function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)
    keymap('n', '<C-k>', function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)
    keymap('n', '<leader>ge', vim.diagnostic.open_float, opts)
    keymap('n', '<leader>ff', function()
        vim.lsp.buf.format({ async = true })
      end,
      vim.tbl_extend('force', opts, { desc = 'Format document' })
    )

    if client:supports_method('textDocument/implementation')
        or client:supports_method('textDocument/definition') then
      vim.bo[bufnr].tagfunc = 'v:lua.vim.lsp.tagfunc'
    end

    if client:supports_method("textDocument/documentHighlight") then
      local highlight_group = vim.api.nvim_create_augroup("yoelvp_lsp_highlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = bufnr,
        group = highlight_group,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = bufnr,
        group = highlight_group,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})
