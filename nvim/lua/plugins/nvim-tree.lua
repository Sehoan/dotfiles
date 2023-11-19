return {
  {
    'nvim-tree/nvim-tree.lua',
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    opts = function()
      -- Disable netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      local HEIGHT_RATIO = 0.8 -- You can change this
      local WIDTH_RATIO = 0.8  -- You can change this too

      vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<cr>', { silent = true })
      vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<cr>', { silent = true })

      return {
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = false,
          update_root = false
        },
        disable_netrw = true,
        view = {
          mappings = {
            list = {
              { key = '<C-v>', action = '' },
              { key = 'v',     action = 'vsplit' },

              { key = '<C-x>', action = '' },
              { key = 'i',     action = 'split' },

              { key = 'g?',    action = '' },
              { key = '?',     action = 'toggle_help' },

              { key = 'x',     action = '' },
              { key = 'm',     action = 'cut' },

              { key = '<BS>',  action = '' },
              { key = 'x',     action = 'close_node' },

              { key = '<C-]>', action = '' },
              { key = 'C',     action = 'cd' },

              { key = '-',     action = '' },
              { key = 'u',     action = 'dir_up' },

              { key = 'H',     action = '' },
              { key = 'I',     action = 'toggle_dotfiles' },

              { key = 'W',     action = '' },
              { key = 'X',     action = 'collapse_all' },

              { key = 'o',     action = 'edit_no_picker' },
              { key = 'O',     action = 'edit' },

              { key = '<C-e>', action = '' },
              { key = 'E',     action = '' },
              { key = 'S',     action = '' },
              { key = 's',     action = '' },
            }
          },
          float = {
            enable = true,
            open_win_config = function()
              local screen_w = vim.opt.columns:get()
              local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
              local window_w = screen_w * WIDTH_RATIO
              local window_h = screen_h * HEIGHT_RATIO
              local window_w_int = math.floor(window_w)
              local window_h_int = math.floor(window_h)
              local center_x = (screen_w - window_w) / 2
              local center_y = ((vim.opt.lines:get() - window_h) / 2)
                  - vim.opt.cmdheight:get()
              return {
                border = "rounded",
                relative = "editor",
                row = center_y,
                col = center_x,
                width = window_w_int,
                height = window_h_int,
              }
            end,
          },
          width = function()
            return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
          end,
        },
        renderer = {
          icons = {
            show = {
              git = false,
              file = true,
              folder = true,
              folder_arrow = false,
              modified = false,
            },
            glyphs = {
              default = "–",
              folder = {
                default = "⏵",
                open = "⏷",
                empty = '▹',
                empty_open = '▿',
              },
            },
          },
          group_empty = false,
          indent_width = 2,
        },
        filters = {
          dotfiles = true,
        },
        actions = {
          open_file = {
            quit_on_open = true,
          }
        }
      }
    end
  }
}
