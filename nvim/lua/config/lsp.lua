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
  "html",
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
    keymap('n', '<C-j>', vim.diagnostic.goto_next, opts)
    keymap('n', '<C-k>', vim.diagnostic.goto_prev, opts)
    keymap('n', '<leader>ge', vim.diagnostic.open_float, opts)
    keymap('n', '<leader>ff', function()
        vim.lsp.buf.format({ async = true })
      end,
      vim.tbl_extend('force', opts, { desc = 'Format document' })
    )

    if client:supports_method('textDocument/implementation') then
      vim.bo[bufnr].tagfunc = 'v:lua.vim.lsp.tagfunc'
    end

    if client:supports_method('textDocument/definition') then
      vim.bo[bufnr].tagfunc = 'v:lua.vim.lsp.tagfunc'
    end

    --[[ if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end ]]

    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('yoelvp_lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
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
