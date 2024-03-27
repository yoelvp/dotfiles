local M = {}

local input_file_name = function()
  local Input = require('nui.input')
  local event = require('nui.utils.autocmd').event
  local current_dir = vim.fn.expand('%:h')

  local input = Input(
    {
      position = '50%',
      size = {
        width = '40%'
      },
      border = {
        style = 'single',
        text = {
          top = 'Enter filename',
          top_align = 'center'
        }
      }
    },
    {
      prompt = '> ',
      default_value = current_dir .. '/',
      on_submit = function (value)
        print('full_path: ', value)
      end
    }
  )

  input:mount()

  input:on(event.BufLeave, function ()
    input:unmount()
  end)
end

-- Create a new file or componente in React
function M.new_file()
  local Menu = require('nui.menu')
  local MenuOption = {
    FILE = 'FILE',
    COMPONENT = 'COMPONENT'
  }

  local menu = Menu(
    {
      position = '50%',
      size = {
        width = '25%'
      },
      border = {
        style = 'rounded',
        text = {
          top = 'Choose file option',
          top_align = 'center'
        }
      }
    },
    {
      lines = {
        Menu.item('File', { id = MenuOption.FILE }),
        Menu.item('Component', { id = MenuOption.COMPONENT })
      },
      on_submit = function (item)
        if item.id == MenuOption.FILE then
          input_file_name()
        end

        if item.id == MenuOption.COMPONENT then
          print('Create a new component of react')
        end
      end
    }
  )

  menu:mount()
end

return M
