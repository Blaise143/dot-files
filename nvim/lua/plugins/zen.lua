return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      width = 1.,
      backdrop = 1,
      options = {
        number = true,
        relativenumber = true,
      },
    },
    plugins = {
      twilight = { enabled = true },
      gitsigns = { enabled = false },
    },
    on_open = function()
      -- sync background colors
      local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
      local bg = normal_hl.bg and string.format("#%06x", normal_hl.bg) or "NONE"
      for _, hl in ipairs({ "ZenBg", "ZenBorder", "NormalNC", "NormalFloat", "Normal" }) do
        vim.api.nvim_set_hl(0, hl, { bg = bg })
      end
    end,

    on_close = function()
      -- restore highlights
      for _, hl in ipairs({ "ZenBg", "ZenBorder", "NormalNC", "NormalFloat", "Normal" }) do
        vim.cmd("hi clear " .. hl)
      end
    end,
  },

  config = function(_, opts)
    require("zen-mode").setup(opts)

    -- recolor on colorscheme change
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
        local bg = normal_hl.bg and string.format("#%06x", normal_hl.bg) or "NONE"
        for _, hl in ipairs({ "ZenBg", "ZenBorder", "NormalNC", "NormalFloat", "Normal" }) do
          vim.api.nvim_set_hl(0, hl, { bg = bg })
        end
      end,
    })
  end,
}
