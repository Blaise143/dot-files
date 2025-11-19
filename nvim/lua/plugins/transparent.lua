return {
  "xiyaowong/nvim-transparent",
  config = function()
    require("transparent").setup({
      -- groups you want to clear the background for
      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
        "TelescopeNormal",
        "TelescopeBorder",
        "TelescopePromptNormal",
        "TelescopeResultsNormal",
        "TelescopePreviewNormal",
        "NormalNC",
        "SignColumn",
        "MsgArea",
      },
      exclude_groups = {}, -- keep empty
    })

    -- Optional keymaps
    vim.keymap.set("n", "<leader>ut", "<cmd>TransparentToggle<cr>", { desc = "Toggle transparency" })
  end,
}
