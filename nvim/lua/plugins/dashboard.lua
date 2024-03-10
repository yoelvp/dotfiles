return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = function()
    local logo = [[
      ██╗   ██╗ ██████╗ ███████╗██╗    ██╗   ██╗██████╗ 
      ╚██╗ ██╔╝██╔═══██╗██╔════╝██║    ██║   ██║██╔══██╗
       ╚████╔╝ ██║   ██║█████╗  ██║    ██║   ██║██████╔╝
        ╚██╔╝  ██║   ██║██╔══╝  ██║    ╚██╗ ██╔╝██╔═══╝ 
         ██║   ╚██████╔╝███████╗███████╗╚████╔╝ ██║     
         ╚═╝    ╚═════╝ ╚══════╝╚══════╝ ╚═══╝  ╚═╝     
                   [-- Welcome @yoelvp --]              
    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = 'doom',
      config = {
        header = vim.split(logo, '\n'),
        center = {
          { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
          { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
          { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
          { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end
      }
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
  -- config = function()
  --   require('dashboard').setup({
  --     theme = 'hyper',
  --     config = {
  --       header = {
  --         '██╗   ██╗ ██████╗ ███████╗██╗    ██╗   ██╗██████╗ ',
  --         '╚██╗ ██╔╝██╔═══██╗██╔════╝██║    ██║   ██║██╔══██╗',
  --         ' ╚████╔╝ ██║   ██║█████╗  ██║    ██║   ██║██████╔╝',
  --         '  ╚██╔╝  ██║   ██║██╔══╝  ██║    ╚██╗ ██╔╝██╔═══╝ ',
  --         '   ██║   ╚██████╔╝███████╗███████╗╚████╔╝ ██║     ',
  --         '   ╚═╝    ╚═════╝ ╚══════╝╚══════╝ ╚═══╝  ╚═╝     ',
  --         '                [-- Welcome @yoelvp --]           ',
  --         '                                                  '
  --       },
  --       shortcut = {
  --         {
  --           desc = '󰊳 Update',
  --           group = '@property',
  --           action = 'Lazy update',
  --           key = 'u'
  --         },
  --         {
  --           icon = ' ',
  --           icon_hl = '@variable',
  --           desc = 'Files',
  --           group = 'Label',
  --           action = 'Telescope find_files',
  --           key = 'f',
  --         },
  --         {
  --           desc = ' Apps',
  --           group = 'DiagnosticHint',
  --           action = 'Telescope app',
  --           key = 'a',
  --         },
  --         {
  --           desc = ' dotfiles',
  --           group = 'Number',
  --           action = 'Telescope dotfiles',
  --           key = 'd',
  --         },
  --       }
  --     }
  --   })
  -- end
}