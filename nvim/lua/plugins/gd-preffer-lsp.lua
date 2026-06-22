return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "gd",
        function()
          local bufnr = vim.api.nvim_get_current_buf()

          -- choose priority (first match wins)
          local preferred_clients = { "pyright", "pyrefly", "jedi_language_server" }

          local clients = vim.lsp.get_clients({ bufnr = bufnr })

          local function pick_client()
            for _, name in ipairs(preferred_clients) do
              for _, c in ipairs(clients) do
                if c.name == name then
                  return c
                end
              end
            end
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
        end,
        desc = "Goto Definition (preferred LSP, no picker)",
      },
    },
  },
}
