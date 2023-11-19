return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        enabled = vim.fn.executable "make" == 1,
        build = "make"
      }
    },
    config = function()
      require("telescope").setup {
        defaults = {
          sorting_strategy = "ascending",
          selection_strategy = "reset",
          scroll_strategy = "limit",
          layout_strategy = "horizontal",
          layout_config = {
            preview_cutoff = 1, -- Preview should always show (unless previewer = false)
            width = 0.9,
            height = 0.9,
            prompt_position = "top",
          },
          winblend = 0,
          wrap_results = false,
          prompt_prefix = " ➜ ",
          selection_caret = "  ",
          entry_prefix = "  ",
          initial_mode = "insert",
          border = true,
          mappings = {
            i = {
              ['<esc>'] = require('telescope.actions').close,
              ['<C-v>'] = require('telescope.actions').select_vertical,
              ['<C-i>'] = require('telescope.actions').select_horizontal,
              ['<C-l>'] = require('telescope.actions.layout').toggle_preview,
            },
          },
          preview = {
            msg_bg_fillchar = '-', -- character to fill unpreviewable buffer
            hide_on_startup = false,
          },
          vimgrep_arguments = {
            "rg",
            "-L",
            "--hidden",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          file_ignore_patterns = { '*.orig' },
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        },
        pickers = {
          find_files = {
            find_command = { "rg", "--files", "--hidden" },
            layout_strategy = "center",
            layout_config = {
              width = function(_, max_columns, _)
                return math.min(max_columns, 80)
              end,
              height = function(_, _, max_lines)
                return math.min(max_lines, 15)
              end,
            },
            borderchars = {
              prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
              results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
              preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
            preview = {
              hide_on_startup = true,
            },
          },
          help_tags = {
            layout_strategy = "center",
            layout_config = {
              width = function(_, max_columns, _)
                return math.min(max_columns, 80)
              end,
              height = function(_, _, max_lines)
                return math.min(max_lines, 15)
              end,
            },
            borderchars = {
              prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
              results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
              preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
            preview = {
              hide_on_startup = true,
            },
          },
          man_pages = {
            layout_strategy = "center",
            layout_config = {
              width = function(_, max_columns, _)
                return math.min(max_columns, 80)
              end,
              height = function(_, _, max_lines)
                return math.min(max_lines, 15)
              end,
            },
            borderchars = {
              prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
              results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
              preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
            preview = {
              hide_on_startup = true,
            },
          },
          buffers = {
            layout_strategy = "center",
            layout_config = {
              width = function(_, max_columns, _)
                return math.min(max_columns, 80)
              end,
              height = function(_, _, max_lines)
                return math.min(max_lines, 15)
              end,
            },
            borderchars = {
              prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
              results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
              preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
            preview = {
              hide_on_startup = true,
            },
          },
          oldfiles = {
            layout_strategy = "center",
            layout_config = {
              width = function(_, max_columns, _)
                return math.min(max_columns, 80)
              end,
              height = function(_, _, max_lines)
                return math.min(max_lines, 15)
              end,
            },
            borderchars = {
              prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
              results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
              preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            },
            preview = {
              hide_on_startup = true,
            },
          },
          current_buffer_fuzzy_find = {
            layout_config = {
              preview_width = 0.6,
            }
          },
          live_grep = {
            layout_config = {
              preview_width = 0.6,
            }
          },
          grep_string = {
            layout_config = {
              preview_width = 0.6,
            }
          },
          lsp_definitions = {
            layout_config = {
              preview_width = 0.6,
            }
          },
          lsp_type_definitions = {
            layout_config = {
              preview_width = 0.6,
            }
          },
          lsp_references = {
            layout_config = {
              preview_width = 0.6,
            }
          },
          lsp_document_symbols = {
            layout_config = {
              preview_width = 0.6,
            }
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
          }
        }
      }

      -- Override telescope hl group to ensure visibility.
      local TelescopeColor = {
        TelescopeMatching = { fg = '#D08770' },
        -- TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
        TelescopePromptPrefix = { fg = '#BF616A' },
        -- TelescopePromptNormal = { bg = '#BF616A' },
        -- TelescopePromptBorder = { bg = 'none', fg = 'none' },
        -- TelescopePromptTitle = { bg = '#BF616A' },
        -- TelescopeResultsNormal = { bg = colors.mantle },
        -- TelescopePreviewNormal = { bg = colors.mantle },
        -- TelescopeResultsTitle = { fg = colors.mantle },
        -- TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
        -- TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
        -- TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
      }
      for hl, col in pairs(TelescopeColor) do
        vim.api.nvim_set_hl(0, hl, col)
      end
      -- FZF
      pcall(require('telescope').load_extension, 'fzf')

      -- Telescope
      vim.keymap.set('n', '<c-p>', require("telescope.builtin").find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>/', require("telescope.builtin").current_buffer_fuzzy_find,
        { desc = '[/] Fuzzily search in current buffer' })
      vim.keymap.set('n', '<leader>g/', require("telescope.builtin").live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<space>/', require("telescope.builtin").grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<space>o', require("telescope.builtin").buffers, { desc = '[S]earch [O]pened [B]uffers' })
      vim.keymap.set('n', '<leader>m', require("telescope.builtin").oldfiles, { desc = '[?] Find recently opened files' })

      vim.keymap.set('n', 'gh', require("telescope.builtin").help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', 'gm', require("telescope.builtin").man_pages, { desc = '[S]earch [H]elp' })

      -- Telescope
      vim.keymap.set('n', '<c-t>', ':Telescope<cr>')
    end
  }
}
