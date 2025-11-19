return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- adjust dependencies based on what you use
  config = function()
    require("render-markdown").setup({
      -- you can customize options here or leave empty for defaults
      enabled = true,
      render_modes = { "n", "c", "t" },
      max_file_size = 10.0,
    })
  end,
  ft = { "markdown", "norg", "rmd", "org", "codecompanion" }, -- filetypes to load plugin for
}
