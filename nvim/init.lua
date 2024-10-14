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
-- Diagnostics
------------------------------
require('config.diagnostics')

------------------------------
-- Lazy manager plugins
------------------------------
require('config.lazy')

------------------------------
-- Auto cmd's
------------------------------
require('config.autocmds')
