return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.lsp.inlay_hint.enable(true)
    end,
  },
}
