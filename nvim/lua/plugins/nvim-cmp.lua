return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',

      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    event = "InsertEnter", -- Load `cmp` on InsertEnter
    opts = function()
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      local cmp = require 'cmp'

      local border_opts = {
        border = "single",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      }

      return {
        sources = {
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "luasnip" },
          {
            name = "buffer",
            option = {
              keyword_pattern = [[\k\+]],
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end
            },
            keyword_length = 3
          },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.abbr = string.sub(vim_item.abbr, 1, 40)
            return vim_item
          end
        },
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },
        preselect = cmp.PreselectMode.None,
        window = {
          completion = cmp.config.window.bordered(border_opts),
          documentation = cmp.config.window.bordered(border_opts),
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<CR>'] = cmp.mapping.confirm {
            select = true, -- auto select the first item when confirming
            behavior = cmp.ConfirmBehavior.Insert,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        experimental = {
          native_menu = false,
          ghost_text = false,
        },
      }
    end
  },
}
