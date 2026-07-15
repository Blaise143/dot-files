return {
  "AstroNvim/astrolsp",
  opts = {
    servers = { "pyright" },
    config = {
      pyright = {
        before_init = function(_, config)
          local conda_prefix = os.getenv "CONDA_PREFIX"
          if conda_prefix then config.settings.python.pythonPath = conda_prefix .. "/bin/python" end
        end,
      },
    },
  },
}

