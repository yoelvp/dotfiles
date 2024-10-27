local neotree = require('neo-tree')

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

neotree.setup({
  close_if_last_window = false,
  popup_border_style = 'rounded',
  enable_git_status = true,
  enable_diagnostics = true,
  sort_case_insensitive = false,
  sort_function = nil,
  enable_modified_markers = true,
  enable_opened_markers = true,
  enable_cursor_hijack = true, -- If enabled neotree will keep the cursor on the first letter of the filename when moving in the tree.
  hide_root_node = true, -- Hide the root node.
  default_component_configs = {
    container = {
      enable_character_fade = true,
    },
    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = true,
      indent_marker = '│',
      last_indent_marker = '└',
      highlight = 'NeoTreeIndentMarker',
      with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = '',
      expander_expanded = '',
      expander_highlight = 'NeoTreeExpander',
    },
    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = '󰜌',
      default = '*',
      highlight = 'NeoTreeFileIcon',
    },
    modified = {
      symbol = '[+]',
      highlight = 'NeoTreeModified',
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
      highlight = 'NeoTreeFileName',
    },
    git_status = {
      symbols = {
        added = '✚', -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
        deleted = '✖', -- this can only be used in the git_status source
        renamed = '󰁕', -- this can only be used in the git_status source
        untracked = '',
        ignored = '',
        unstaged = '󰄱',
        staged = '',
        conflict = '',
      },
    },
  },
  window = {
    position = 'right',
    width = 40,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ['<cr>'] = 'open',
      ['<esc>'] = 'revert_preview',
      ['P'] = { 'toggle_preview', config = { use_float = true } },
      ['F'] = 'focus_preview',
      ['S'] = 'open_split',
      ['s'] = 'open_vsplit',
      ['t'] = 'open_tabnew',
      ['w'] = 'open',
      ['h'] = 'close_node',
      ['l'] = 'open',
      ['z'] = 'close_all_nodes',
      ['a'] = {
        'add',
        config = {
          show_path = 'none', -- "none", "relative", "absolute"
        },
      },
      ['A'] = 'add_directory', -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
      ['d'] = 'delete',
      ['r'] = 'rename',
      ['y'] = 'copy_to_clipboard',
      ['x'] = 'cut_to_clipboard',
      ['p'] = 'paste_from_clipboard',
      ['c'] = 'copy', -- takes text input for destination, also accepts the optional config.show_path option like "add":
      ['m'] = 'move', -- takes text input for destination, also accepts the optional config.show_path option like "add".
      ['q'] = 'close_window',
      ['R'] = 'refresh',
      ['?'] = 'show_help',
      ['<'] = 'prev_source',
      ['>'] = 'next_source',
    },
  },
  filesystem = {
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = true, -- only works on Windows for hidden files/directories
      hide_by_name = {
        'node_modules',
        '.git',
        'vendor',
      },
      never_show = {
        '.DS_Store',
        'thumbs.db',
      },
    },
    hijack_netrw_behavior = 'open_default',
    window = {
      mappings = {
        ['<bs>'] = 'navigate_up',
        ['.'] = 'set_root',
        ['H'] = 'toggle_hidden',
        ['/'] = 'fuzzy_finder',
        ['D'] = 'fuzzy_finder_directory',
        ['#'] = 'fuzzy_sorter', -- fuzzy sorting using the fzy algorithm
        -- ["D"] = "fuzzy_sorter_directory",
        ['f'] = 'filter_on_submit',
        ['<c-x>'] = 'clear_filter',
        ['[g'] = 'prev_git_modified',
        [']g'] = 'next_git_modified',
      },
      fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
        ['<down>'] = 'move_cursor_down',
        ['<C-n>'] = 'move_cursor_down',
        ['<up>'] = 'move_cursor_up',
        ['<C-p>'] = 'move_cursor_up',
      },
    },
    buffers = {
      show_unloaded = true,
      window = {
        mappings = {
          ['bd'] = 'buffer_delete',
          ['<bs>'] = 'navigate_up',
          ['.'] = 'set_root',
          ['o'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
          ['oc'] = { 'order_by_created', nowait = false },
          ['od'] = { 'order_by_diagnostics', nowait = false },
          ['om'] = { 'order_by_modified', nowait = false },
          ['on'] = { 'order_by_name', nowait = false },
          ['os'] = { 'order_by_size', nowait = false },
          ['ot'] = { 'order_by_type', nowait = false },
        },
      },
    },
  },
  event_handlers = {
    {
      event = 'neo_tree_buffer_enter',
      handler = function()
        vim.opt_local.number = true
        vim.opt_local.relativenumber = true
      end,
    },
  },
})

vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
