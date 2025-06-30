local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
  options = {
    icons_enabled = true,
    section_separators = {left = '', right = ''},
    component_separators = {left = '', right = ''},
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = {
      {
        'mode',
        color = { fg = '#FF3F00', bg = '#328064' },
        gui = 'bold',
      }
    },
    lualine_b = {
      {
        'branch',
        color = { fg = '#FF3F00', bg = '#328064' },
        gui = 'bold'
      }
    },
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
        color = { fg = '#ffffff', bg = '#FF3F00' }
      }
    },
    lualine_x = {
      {
        'diagnostics',
        sources = {"nvim_diagnostic"},
        symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
      },
      'encoding',
      'filetype'
    },
    lualine_y = {
      {
        'progress',
        color = { fg = '#ffffff', bg = '#FF3F00' }
      }
    },
    lualine_z = {
      {
        'location',
        color = { fg = '#ffffff', bg = '#328064' },
      }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'},
}

