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
-- gd stuff
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf

    vim.keymap.set("n", "gd", function()
      local preferred_clients = { "pyright", "pyrefly", "jedi_language_server" }
      -- local preferred_clients = { "jedi_language_server", "pyrefly" }

      ---@type vim.lsp.Client[]
      local clients = vim.lsp.get_clients({ bufnr = bufnr })

      ---@return vim.lsp.Client|nil
      local function pick_client()
        for _, name in ipairs(preferred_clients) do
          for _, client in ipairs(clients) do
            if client.name == name then
              return client
            end
          end
        end
        return nil
      end

      local client = pick_client()
      if not client then
        vim.lsp.buf.definition()
        return
      end

      local enc = client.offset_encoding or "utf-16"
      local params = vim.lsp.util.make_position_params(0, enc)

      client.request("textDocument/definition", params, function(err, result)
        if err then
          vim.notify(err.message or tostring(err), vim.log.levels.ERROR)
          return
        end
        if not result then
          vim.notify("No definition found", vim.log.levels.INFO)
          return
        end

        local loc = result
        if vim.islist(result) then
          if #result == 0 then
            vim.notify("No definition found", vim.log.levels.INFO)
            return
          end
          loc = result[1]
        end

        vim.lsp.util.show_document(loc, enc, { reuse_win = true, focus = true })
      end, bufnr)
    end, { buffer = bufnr, desc = "Goto Definition (preferred LSP, no picker)" })
  end,
})
