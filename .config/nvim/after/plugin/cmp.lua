local cmp_ok, cmp = pcall(require, 'cmp')
local luasnip_ok, luasnip = pcall(require, 'luasnip')
local cmp_autopairs_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')

if (not cmp_ok) then return end
if (not luasnip_ok) then return end
if (not cmp_autopairs_ok) then return end

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { text = '' } })

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-c>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- elseif luasnip.expand_or_jumpable() then
      --   luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      -- elseif luasnip.jumpable(-1) then
      --   luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i' })
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' }
  }),
  formatting = {
    -- format = lspkind.cmp_format({
    --   mode = 'symbol_text',
    --   with_text = true,
    --   -- maxwidth = 50,
    --   ellipsis_char = '...',
    --   -- menu = {
    --   --   nvim_lsp = '[LSP]',
    --   --   buffer = '[Buffer]',
    --   --   path = '[Path]'
    --   -- }
    -- }),
  }
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])
