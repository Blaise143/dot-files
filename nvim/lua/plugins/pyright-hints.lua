return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                inlayHints = {
                  callArgumentNames = true, -- 👈 FUNCTION PARAM HINTS
                  variableTypes = true,
                  functionReturnTypes = true,
                  propertyDeclarationTypes = true,
                  genericTypeArguments = true,
                },
              },
            },
          },
        },
        enabled = false, -- 👈 DISABLE PYRIGHT LSP SERVER (WE ONLY WANT THE HINTS)
      },
    },
  },
}
