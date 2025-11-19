return {
  -- 1) Conform formatter for LaTeX
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        tex = { "latexindent" },
        plaintex = { "latexindent" },
      },
    },
  },

  -- 2) Soft wrapping for LaTeX files
  {
    "nvim-lua/plenary.nvim",
    optional = true,
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "tex", "plaintex" },
        callback = function()
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true
          vim.opt_local.breakindent = true
          vim.opt_local.showbreak = "  "
        end,
      })
    end,
  },
}
