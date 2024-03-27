return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-refactor',
    'nvim-treesitter/nvim-treesitter-textobjects'
  },
  config = function()
    require('nvim-treesitter.configs').setup({
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
        enable = true,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
      },
      context_commentstring = {
        enable = true
      },
      refactor = {
        -- highlight_definitions = { enable = true },
        smart_rename = {
          enable = false,
          keymaps = {
            smart_rename = 'trr'
          }
        }
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?'
        }
      }
    })
  end
}
