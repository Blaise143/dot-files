return {
  -- Pyright env detection
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      -- detect Python interpreter (Conda/venv)
      local function detect_python()
        local env = vim.env
        if env.CONDA_PREFIX and env.CONDA_PREFIX ~= "" then
          return env.CONDA_PREFIX .. "/bin/python"
        elseif env.VIRTUAL_ENV and env.VIRTUAL_ENV ~= "" then
          return env.VIRTUAL_ENV .. "/bin/python"
        end
        return nil
      end

      -- --- PYRIGHT CONFIG ---
      local py_cfg = opts.servers.pyright or {}
      local old_on_new_config = py_cfg.on_new_config
      py_cfg.on_new_config = function(config, root_dir)
        if old_on_new_config then
          pcall(old_on_new_config, config, root_dir)
        end
        local py = detect_python()
        if py then
          config.settings = config.settings or {}
          config.settings.python = config.settings.python or {}
          config.settings.python.defaultInterpreterPath = py
          config.settings.python.pythonPath = py
        end
      end
      py_cfg.settings = vim.tbl_deep_extend("force", py_cfg.settings or {}, {
        python = { analysis = { autoSearchPaths = true, useLibraryCodeForTypes = true } },
      })
      opts.servers.pyright = py_cfg

      -- --- RUFF CONFIG (offset encoding fix) ---
      local caps = vim.lsp.protocol.make_client_capabilities()
      caps.offsetEncoding = { "utf-16" }
      opts.servers.ruff = vim.tbl_deep_extend("force", opts.servers.ruff or {}, {
        capabilities = vim.tbl_deep_extend("force", caps, opts.capabilities or {}),
      })
    end,
  },
}
