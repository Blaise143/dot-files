return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        pyrefly = function(_, opts)
          local old = opts.on_attach
          opts.on_attach = function(client, bufnr)
            if old then
              old(client, bufnr)
            end
            local ns = vim.lsp.diagnostic.get_namespace(client.id)
            vim.diagnostic.enable(false, {
              bufnr = bufnr,
              namespace = ns,
            })
          end
        end,

        -- jedi_language_server = function(_, opts)
        --   local old = opts.on_attach
        --   opts.on_attach = function(client, bufnr)
        --     if old then
        --       old(client, bufnr)
        --     end
        --     local ns = vim.lsp.diagnostic.get_namespace(client.id)
        --     vim.diagnostic.enable(false, {
        --       bufnr = bufnr,
        --       namespace = ns,
        --     })
        --   end
        -- end,
      },
    },
  },
}
