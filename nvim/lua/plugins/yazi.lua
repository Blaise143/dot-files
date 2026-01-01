return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    opts = {
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = false,
        },
        icon = {
          folder_closed = "▸",
          folder_open = "▾",
          folder_empty = "▸",
          default = "",
          highlight = "NeoTreeFileIcon",
        },
        name = {
          trailing_slash = true,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
        git_status = {
          symbols = {
            added = "+",
            modified = "●",
            deleted = "−",
            renamed = "→",
            untracked = "?",
            ignored = "",
            unstaged = "",
            staged = "",
            conflict = "!",
          },
        },
      },

      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = false,
          hide_hidden = false,
        },
        follow_current_file = {
          enabled = true,
        },
        group_empty_dirs = true,
        show_root = false,
      },

      window = {
        position = "left",
        width = 30,
        padding = 0,
      },
    },
  },
}
-- return {
--   -- {
--   --   "mikavilpas/yazi.nvim",
--   --   event = "VeryLazy",
--   --   keys = {
--   --     {
--   --       "<leader>e",
--   --       function()
--   --         require("yazi").yazi()
--   --       end,
--   --       desc = "Open Yazi Explorer",
--   --     },
--   --   },
--   --   config = function()
--   --     require("yazi").setup({
--   --       use_floating_window = true,
--   --       floating_window_scaling_factor = 0.85,
--   --       open_selected_file = "edit", -- or "split" / "vsplit"
--   --     })
--   --   end,
--   -- },
--   --
--   -- disable neo-tree (optional)
--   {
--     "nvim-neo-tree/neo-tree.nvim",
--     enabled = true,
--   },
-- }
