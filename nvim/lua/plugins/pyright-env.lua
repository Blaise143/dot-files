return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          -- Make pyright use the same Python as your shell env
          before_init = function(_, config)
            local env = vim.env
            local py

            if env.CONDA_PREFIX and env.CONDA_PREFIX ~= "" then
              py = env.CONDA_PREFIX .. "/bin/python"
            elseif env.VIRTUAL_ENV and env.VIRTUAL_ENV ~= "" then
              py = env.VIRTUAL_ENV .. "/bin/python"
            end

            if py then
              config.settings = config.settings or {}
              config.settings.python = config.settings.python or {}

              -- modern way
              config.settings.python.defaultInterpreterPath = py

              -- (harmless) legacy key still read by some setups
              config.settings.python.pythonPath = py

              -- optional: help pyright find libs in workspace
              config.settings.python.analysis = vim.tbl_deep_extend(
                "force",
                { autoSearchPaths = true, useLibraryCodeForTypes = true },
                config.settings.python.analysis or {}
              )
            end
          end,
        },
      },
    },
  },
}
