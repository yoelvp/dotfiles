local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')
local utils = require('yoelvp.utils')
local autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on('confirm_done', autopairs.on_confirm_done({ map_char = { tex = '' } }))
vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      border = 'rounded',
      scrollbar = true,
    },
    documentation = {
      border = 'rounded',
      scrollbar = true,
    },
  },
  completion = {
    completeopt = 'menuone,noinsert,noselect',
    keyword_length = 2,
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
      before = function(entry, vim_item)
        if vim_item.kind == 'Color' and entry.completion_item.documentation then
          local _, _, r, g, b =
          ---@diagnostic disable-next-line: param-type-mismatch
              string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')

          if r and g and b then
            local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
            local group = 'Tw_' .. color

            if vim.api.nvim_call_function('hlID', { group }) < 1 then
              vim.api.nvim_command('highlight' .. ' ' .. group .. ' ' .. 'guifg=#' .. color)
            end

            vim_item.kind = utils.lsp_icons.Tailwind
            vim_item.kind_hl_group = group

            return vim_item
          end
        end

        vim_item.kind = utils.lsp_icons[vim_item.kind] or vim_item.kind

        return vim_item
      end,
    }),
  },
  experimental = {
    ghost_text = {
      hl_group = 'CmpGhostText',
    },
  },
})
