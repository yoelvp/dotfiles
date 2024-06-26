--[[

  ██╗   ██╗ ██████╗ ███████╗██╗    ██╗   ██╗██████╗
  ╚██╗ ██╔╝██╔═══██╗██╔════╝██║    ██║   ██║██╔══██╗
   ╚████╔╝ ██║   ██║█████╗  ██║    ██║   ██║██████╔╝
    ╚██╔╝  ██║   ██║██╔══╝  ██║    ╚██╗ ██╔╝██╔═══╝
     ██║   ╚██████╔╝███████╗███████╗╚████╔╝ ██║
     ╚═╝    ╚═════╝ ╚══════╝╚══════╝ ╚═══╝  ╚═╝

  - https://yoelvalverde.netlify.app
  - https://github.com/yoelvp

]]
--

------------------------------
-- setting
------------------------------
require('config.settings')

------------------------------
-- keymaps
------------------------------
require('config.keymaps')

------------------------------
-- Globals
------------------------------
require('yoelvp.globals')

------------------------------
-- Auto cmd's
------------------------------
require('config.autocmds')

------------------------------
-- Diagnostics
------------------------------
require('config.diagnostics')

------------------------------
-- Lazy manager plugins
------------------------------
require('config.lazy')

------------------------------
-- colorscheme selected
------------------------------
require('theme')
