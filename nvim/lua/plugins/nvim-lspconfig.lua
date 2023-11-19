return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
    },
    config = function()
      -- Neodev
      require('neodev').setup()

      local on_attach = function(client, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('gd', '<cmd>lua require("telescope.builtin").lsp_definitions { show_line = false }<cr>',
          '[G]oto [D]efinition')
        nmap('gr', '<cmd>lua require("telescope.builtin").lsp_references { show_line = false }<cr>',
          '[G]oto [R]eferences')
        nmap('gO', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('gv', ':vsplit | lua require("telescope.builtin").lsp_definitions { show_line = false }<cr>',
          '[G]oto [D]efinition in [V]split')
        nmap('gi', ':split | lua require("telescope.builtin").lsp_definitions { show_line = false }<cr>',
          '[G]oto [D]efinition in [S]plit')
        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap(
          '<leader>l',
          function()
            vim.lsp.buf.format {
              async = true,
              filter = function(client)
                return client.name ~= "tsserver"
              end
            }
          end,
          '[F]ormat [B]uffer'
        )
      end

      -- Mason
      require('mason').setup()
      local mason_lspconfig = require 'mason-lspconfig'
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local servers = {} -- List of "ensure_installed" lsp servers and settings.
      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }
      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          }
        end,
      }
    end
  },
}
