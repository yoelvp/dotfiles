local telescope = require('telescope')
local fb_actions = require('telescope').extensions.file_browser.actions

telescope.load_extension('media_files')
telescope.load_extension('file_browser')

telescope.setup({
  prompt_prefix = '❯ ',
  selection_caret = '❯ ',
  layout_strategy = 'horizontal',
  winblend = 20,
  defaults = {
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
      '.svelte-kit/.*'
    }
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
      hijack_netrw = true
    },
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  },
})

local opts = { noremap = true, silent = true }

vim.keymap.set(
  'n',
  'ff',
  function()
    require('telescope.builtin').find_files({
      noignore = false,
      hidden = true,
      grouped = true,
      initial_mode = 'normal',
      layout_config = {
        prompt_position = 'bottom',
      },
    })
  end, opts)

vim.keymap.set('n', 'fbf', function()
  require('telescope.builtin').buffers({
    noignore = false,
    hidden = true,
    grouped = true,
    initial_mode = 'normal',
    layout_config = {
      prompt_position = 'bottom',
    },
  })
end, opts)

vim.keymap.set(
  'n',
  'mf',
  function()
    telescope.extensions.media_files.media_files({
      path = '%:p:h',
      cwd = vim.fn.expand('%:p:h'),
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      initial_mode = 'normal',
      layout_config = {
        prompt_position = 'bottom',
      },
    })
  end, opts)

vim.keymap.set('n', 'fbb', function()
  telescope.extensions.file_browser.file_browser({
    path = '%:p:h',
    cwd = vim.fn.expand('%:p:h'),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    initial_mode = 'normal',
    layout_config = {
      prompt_position = 'bottom',
    },
  })
end, opts)

vim.keymap.set('n', 'fht', function()
  require('telescope.builtin').help_tags({
    path = '%:p:h',
    cwd = vim.fn.expand('%:p:h'),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    initial_mode = 'normal',
    layout_config = {
      prompt_position = 'bottom',
    },
  })
end, opts)
