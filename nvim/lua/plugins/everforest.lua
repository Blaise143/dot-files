return {
  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup {
        background = "hard", -- "soft", "medium", or "hard"
        transparent_background_level = 0,
        italics = true,
        disable_italic_comments = false,
      }

      vim.cmd.colorscheme "everforest"
    end,
  },
}
