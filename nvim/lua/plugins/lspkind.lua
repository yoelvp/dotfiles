return {
  'onsails/lspkind-nvim',
  lazy = true,
  config = function()
    local kind = require('lspkind')

    kind.init({
      mode = 'symbol_text',
      preset = 'codicons',
      symbol_map = {
        Array         = ' ',
        Boolean       = '󰨙 ',
        Class         = ' ',
        Color         = ' ',
        Constant      = '󰏿',
        Constructor   = '',
        Control       = ' ',
        Enum          = '',
        EnumMember    = '',
        Event         = '',
        Field         = ' ',
        File          = ' ',
        Folder        = ' ',
        Function      = '󰊕',
        Interface     = '',
        Key           = ' ',
        Keyword       = ' ',
        Method        = '󰆧',
        Module        = '',
        Namespace     = '󰦮 ',
        Null          = ' ',
        Number        = '󰎠 ',
        Object        = ' ',
        Operator      = ' ',
        Package       = ' ',
        Property      = '󰜢',
        Reference     = '󰈇',
        Snippet       = ' ',
        String        = ' ',
        Struct        = '󰙅',
        Text          = '󰉿',
        TypeParameter = ' ',
        Unit          = ' ',
        Value         = '󰎠',
        Variable      = '󰀫'
      },
    })
  end
}
