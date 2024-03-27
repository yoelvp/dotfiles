local M = {}

M.ui = require('yoelvp.utils.ui')
M.neotree = require('yoelvp.utils.neotree')
M.react = require('yoelvp.utils.react')

function M.extendTable(table, values)
  return vim.tbl_extend('force', table, values)
end

return M
