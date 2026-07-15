return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.zen.toggles.diagnostics = true
      opts.zen.toggles.inlay_hints = true

      opts.zen.win.wo = vim.tbl_extend("force", opts.zen.win.wo, {
        number = true,
        relativenumber = true,
        winbar = "%=%t",
        signcolumn = "yes",
      })
    end,
  },
}
