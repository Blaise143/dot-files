return {
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>cn",
        function()
          require("neogen").generate()
        end,
        desc = "Generate Annotations (Neogen)",
      },
    },
    config = function()
      require("neogen").setup({
        snippet_engine = "nvim", -- <- important (no LuaSnip needed)
        languages = {
          python = {
            template = {
              annotation_convention = "numpydoc", --"google_docstrings",
            },
          },
        },
      })
    end,
  },
}
