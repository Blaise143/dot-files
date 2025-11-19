return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.ruff = opts.servers.ruff or {}

      opts.servers.ruff.init_options = {
        settings = {
          args = { "--ignore", "F405" },
        },
      }
    end,
  },
}
