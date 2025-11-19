return {
  {
    "folke/snacks.nvim",
    opts = {
      notifier = { enabled = false },
      picker = {
        enabled = true,
        sources = {
          lists = { enabled = false }, -- disable the sidebar picker
        },
      },
      explorer = { enabled = false }, -- disable snacks explorer
    },
  },
}
