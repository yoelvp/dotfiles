local M = {}

function M.stranger()
  ---@type table?
  local id
  local ok = true
  local MAX_NUMBER_MOVEMENTS = 50

  for _, key in ipairs({ 'h', 'j', 'k', 'l', '+', '-' }) do
    local count = 0
    local timer = assert(vim.loop.new_timer())
    local map = key

    vim.keymap.set('n', key, function()
      if vim.v.count > 0 then
        count = 0
      end

      if count >= MAX_NUMBER_MOVEMENTS then
        ok, id = pcall(vim.notify, 'Not so fast sprinter!', vim.log.levels.WARN, {
          icon = '',
          replace = id,
          keep = function()
            return count >= MAX_NUMBER_MOVEMENTS
          end,
        })

        if not ok then
          id = nil

          return map
        end
      else
        count = count + 1
        timer:start(2000, 0, function()
          count = 0
        end)

        return map
      end
    end, { expr = true, silent = true })
  end
end

return M
