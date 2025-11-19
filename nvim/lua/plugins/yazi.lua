return {
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>e",
        function()
          require("yazi").yazi()
        end,
        desc = "Open Yazi Explorer",
      },
    },
    config = function()
      require("yazi").setup({
        use_floating_window = true,
        floating_window_scaling_factor = 0.85,
        open_selected_file = "edit", -- or "split" / "vsplit"
      })
    end,
  },

  -- disable neo-tree (optional)
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
}
