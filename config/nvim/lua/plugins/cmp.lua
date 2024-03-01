return {
  'hrsh7th/nvim-cmp',
  version = false,
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lua',
    'saadparwaiz1/cmp_luasnip',
    {
      'L3MON4D3/LuaSnip',
      version = 'v2.*',
      build = 'make install_jsregexp',
      dependencies = 'rafamadriz/friendly-snippets'
    }
  },
  opts = function()
    vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local defaults = require('cmp.config.default')()
    local autopairs = require('nvim-autopairs.completion.cmp')
    local lspkind = require('lspkind')

    cmp.event:on('confirm_done', autopairs.on_confirm_done())

    return {
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
        { name = 'path' }
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
    }
  end,
  ---@param opts cmp.ConfigSchema
  config = function(_, opts)
    for _, source in ipairs(opts.sources) do
      source.group_index = source.group_index or 1
    end
    require('cmp').setup(opts)

    -- require('yoelvp.cmp')
    -- require('luasnip.loaders.from_vscode').lazy_load()
  end,
}
