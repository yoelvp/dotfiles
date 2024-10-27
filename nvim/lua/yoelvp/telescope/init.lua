local telescope = require('telescope')
local utils = require('yoelvp.utils')
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local new_options = function(new_opts)
  return utils.extend_tbl(opts, new_opts)
end

telescope.load_extension('media_files')
telescope.load_extension('file_browser')

telescope.setup({
  prompt_prefix = '❯ ',
  selection_caret = '❯ ',
  layout_strategy = 'horizontal',
  winblend = 20,
  defaults = {
    hidden = true,
    layout_config = {
      prompt_position = 'bottom',
    },
    file_ignore_patterns = {
      '.git/.*',
      'node_modules/.*',
      'vendor/.*',
      'target/.*',
      '.vscode/.*',
      '.idea/.*',
      'build/.*',
      'dist/.*',
      '.dart_tool/.*',
      '.next/.*',
      '.svelte-kit/.*',
    },
  },
  layout_config = {
    width = 0.95,
    height = 0.85,
    prompt_position = 'bottom',
  },
  extensions = {
    media_files = {
      theme = 'dropdown',
      filetypes = { 'png', 'webp', 'jpg', 'jpeg', 'svg', 'pdf', 'mp4', 'mkv', 'avif' },
      find_cmd = 'rg',
    },
    file_browser = {
      theme = 'dropdown',
      hijack_netrw = true,
    },
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
})

-- Load extensions
telescope.load_extension('fzf')

keymap.set('n', 'ff', function()
  require('telescope.builtin').find_files({
    no_ignore = true,
    grouped = true,
  })
end, new_options({ desc = 'Find all files' }))

keymap.set('n', 'fbf', function()
  require('telescope.builtin').buffers({
    no_ignore = false,
    hidden = true,
    grouped = true,
  })
end, new_options({ desc = 'Find buffers' }))

keymap.set('n', 'fmf', function()
  telescope.extensions.media_files.media_files({
    respect_gitignore = false,
    hidden = true,
    grouped = true,
  })
end, new_options({ desc = 'Find media files' }))

keymap.set('n', 'fbb', function()
  telescope.extensions.file_browser.file_browser({
    path = '%:p:h',
    cwd = vim.fn.expand('%:p:h'),
    respect_gitignore = false,
    initial_mode = 'normal',
  })
end, new_options({ desc = 'File explorer'}))

keymap.set('n', 'fht', function()
  require('telescope.builtin').help_tags()
end, new_options({ desc = 'Find help tags' }))

keymap.set('n', 'fgs', function()
  require('telescope.builtin').grep_string({
    respect_gitignore = false,
    hidden = true,
    grouped = true,
  })
end, new_options({ desc = 'Find grep strings' }))

keymap.set('n', 'flg', function()
  require('telescope.builtin').live_grep({
    path = '%:p:h',
    cwd = vim.fn.expand('%:p:h'),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
  })
end, new_options({ desc = 'Find live grep' }))

keymap.set('n', 'frf', function()
  require('telescope.builtin').lsp_references({
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    initial_mode = 'normal',
  })
end, new_options({ desc = 'Find references' }))

keymap.set('n', 'fof', function()
  require('telescope.builtin').oldfiles({
    initial_mode = 'normal',
  })
end, new_options({ desc = 'Find old files' }))

keymap.set('n', 'fgc', function()
  require('telescope.builtin').git_commits({
    initial_mode = 'normal',
  })
end, new_options({ desc = 'Find all commits' }))

keymap.set('n', 'fgC', function()
  require('telescope.builtin').git_bcommits({
    initial_mode = 'normal',
  })
end, new_options({ desc = 'Find commits in the current buffer' }))

keymap.set('n', 'fkm', function()
  require('telescope.builtin').keymaps()
end, new_options({ desc = 'Find all keymaps' }))
