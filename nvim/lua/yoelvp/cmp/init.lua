local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')
local autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on('confirm_done', autopairs.on_confirm_done({ map_char = { tex = '' } }))
vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })

cmp.setup({
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
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
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i' })
  },
  sources = cmp.config.sources({
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    {
      name = "buffer",
      keyword_length = 4,
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local bufnr = vim.api.nvim_win_get_buf(win)
            if vim.api.nvim_buf_get_option(bufnr, 'buftype') ~= 'terminal' then
              bufs[bufnr] = true
            end
          end
          return vim.tbl_keys(bufs)
        end,
      },
    },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      with_text = true,
      ellipsis_char = '...',
      menu = {
        nvim_lsp = '[LSP]',
        buffer = '[BUFFER]',
        path = '[PATH]',
        luasnip = '[SNIP]'
      }
    })
  },
  experimental = {
    ghost_text = {
      hl_group = 'CmpGhostText'
    }
  }
})

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})
