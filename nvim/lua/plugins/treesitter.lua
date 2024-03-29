return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-refactor',
    'nvim-treesitter/nvim-treesitter-textobjects'
  },
  config = function()
    local ts_configs = require('nvim-treesitter.configs')
    ts_configs.setup({
      modules = {},
      ignore_install = {},
      ensure_installed = {
        'astro',
        'bash',
        'c',
        'css',
        'git_config',
        'git_rebase',
        'gitcommit',
        'gitignore',
        'go',
        'gomod',
        'gosum',
        'gowork',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'php',
        'phpdoc',
        'rust',
        'scss',
        'sql',
        'styled',
        'svelte',
        'toml',
        'tsx',
        'typescript',
        'vue',
        'xml'
      },
      sync_install = true,
      auto_install = true,
      indent = {
        enable = true
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
      },
      refactor = {
        highlight_definitions = { enable = true },
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = 'trr'
          }
        }
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["ap"] = "@parameter.outer",
            ["ip"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aC"] = "@class.conditional",
            ["iC"] = "@class.conditional",
            ["al"] = "@class.loop",
            ["il"] = "@class.loop",
            ["ab"] = "@class.block",
            ["ib"] = "@class.block",
          },
        },
      }
    })
  end
}
