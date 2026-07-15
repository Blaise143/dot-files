if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy "+",
    ["*"] = require("vim.ui.clipboard.osc52").copy "*",
  },
  paste = {
    ["+"] = function() return vim.split(vim.fn.system "xclip -o -selection clipboard", "\n") end,
    ["*"] = function() return vim.split(vim.fn.system "xclip -o -selection primary", "\n") end,
  },
}
