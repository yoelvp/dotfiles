local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')
local autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on('confirm_done', autopairs.on_confirm_done())

local has_words_before = function()
  --[[ unpack = unpack or table.unpack ]]
  --[[ local line, col = unpack(vim.api.nvim_win_get_cursor(0)) ]]
  --[[]]
  --[[ return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil ]]

  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      scrollbar = true,
    },
    documentation = {
      scrollbar = true,
    },
  },
  completion = {
    completeopt = 'menuone,noinsert,noselect',
    autocomplete = false
  },
  mapping = {
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-c>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i' }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      with_text = true,
      ellipsis_char = '...',
      menu = {
        nvim_lsp = '[LSP]',
        path = '[PATH]',
        luasnip = '[SNIP]',
        buffer = '[BUFFER]',
      },
    }),
  }
})
