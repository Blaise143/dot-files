return {
  {
    "folke/snacks.nvim",
    opts = {
      notifier = { enabled = true },
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
