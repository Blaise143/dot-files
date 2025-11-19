return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {

        -- Jedi for navigation & hover
        jedi_language_server = {
          init_options = {
            diagnostics = { enable = false },
          },
        },

        -- Pyright for type checking only
        pyright = {
          on_attach = function(client)
            -- Disable features Jedi does better
            client.server_capabilities.definitionProvider = false
            client.server_capabilities.referencesProvider = false
            client.server_capabilities.hoverProvider = false -- optional
            client.server_capabilities.renameProvider = false -- optional
          end,
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                autoImportCompletions = false,
              },
            },
          },
        },
      },
    },
  },
}
