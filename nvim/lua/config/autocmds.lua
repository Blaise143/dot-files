-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Persist & restore last colorscheme
-- Save the current colorscheme to a state file on every change
local file = vim.fn.stdpath("state") .. "/last_colorscheme"
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("PersistColorscheme", { clear = true }),
  callback = function()
    local name = vim.g.colors_name
    if name and #name > 0 then
      vim.fn.writefile({ name }, file)
    end
  end,
})
