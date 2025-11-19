return {
  {
    "embark-theme/vim",
    lazy = false,
    priority = 1000,
    name = "embark",
    --    config = function()
    --      vim.cmd.colorscheme("embark")
    --    end,
  },
  { "ellisonleao/gruvbox.nvim" },
  --{ "sainnhe/everforest" },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = true
      --vim.cmd.colorscheme("everforest")
    end,
  },
  { "sainnhe/sonokai" },
  { "kuri-sun/yoda.nvim" },
  { "marko-cerovac/material.nvim" },
  {
    "mhartington/oceanic-next",
    lazy = false,
    priority = 1000,
    --  config = function()
    --    vim.cmd.colorscheme("OceanicNext")
    --  end,
  },
  { "everviolet/nvim" },
  { "rebelot/kanagawa.nvim" },
}
