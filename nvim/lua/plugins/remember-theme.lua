-- Restore last used colorscheme via LazyVim's colorscheme hook
return {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = function()
      local file = vim.fn.stdpath("state") .. "/last_colorscheme"
      local ok, lines = pcall(vim.fn.readfile, file)
      local name = ok and lines[1]
      if name and #name > 0 then
        -- try to load the saved scheme; if it fails, fall back
        if not pcall(vim.cmd.colorscheme, name) then
          pcall(vim.cmd.colorscheme, "tokyonight")
        end
      else
        pcall(vim.cmd.colorscheme, "tokyonight")
      end
    end,
  },
}
