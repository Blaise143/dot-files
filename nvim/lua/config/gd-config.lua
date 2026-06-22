vim.keymap.set("n", "gd", function()
  local bufnr = vim.api.nvim_get_current_buf()

  -- Order = priority (first match wins)
  local preferred_clients = {
    "pyright",
    "pyrefly",
    "jedi_language_server",
  }

  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  local function pick_client()
    for _, name in ipairs(preferred_clients) do
      for _, client in ipairs(clients) do
        if client.name == name then
          return client
        end
      end
    end
  end

  local client = pick_client()
  if not client then
    -- Fallback to default behavior
    vim.lsp.buf.definition()
    return
  end

  local params = vim.lsp.util.make_position_params(0, client.offset_encoding)

  client.request("textDocument/definition", params, function(err, result)
    if err then
      vim.notify(err.message or tostring(err), vim.log.levels.ERROR)
      return
    end

    if not result or (vim.tbl_islist(result) and #result == 0) then
      vim.notify("No definition found", vim.log.levels.INFO)
      return
    end

    -- Location | Location[]
    local loc = vim.tbl_islist(result) and result[1] or result

    -- Modern, future-proof jump
    vim.lsp.util.show_document(loc, client.offset_encoding, { reuse_win = true, focus = true })
  end, bufnr)
end, { desc = "Goto Definition (preferred LSP, no picker)" })
