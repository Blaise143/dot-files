return {
  -- 1. Disable the actual plugin
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  -- 2. Disable LazyVim's neo-tree configuration
  {
    "lazyvim.plugins.explorer",
    enabled = false,
  },
}
