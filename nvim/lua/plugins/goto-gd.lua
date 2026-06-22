return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition({
          on_list = function(options)
            local items = options.items or {}
            if vim.tbl_isempty(items) then
              vim.notify("No definition found", vim.log.levels.WARN)
              return
            end

            -- pick first result
            local item = items[1]
            local location = (item.user_data and item.user_data.location) or item

            -- figure out an offset encoding (utf-16/utf-8) from any attached LSP client
            local bufnr = options.context and options.context.bufnr or vim.api.nvim_get_current_buf()
            local clients = vim.lsp.get_clients({ bufnr = bufnr })

            -- prefer a client that can do definitions, otherwise just take the first
            local encoding = nil
            for _, c in ipairs(clients) do
              if c.server_capabilities and c.server_capabilities.definitionProvider then
                encoding = c.offset_encoding
                break
              end
            end
            encoding = encoding or (clients[1] and clients[1].offset_encoding) or "utf-16"

            vim.lsp.util.show_document(location, encoding, { focus = true })
          end,
        })
      end, { desc = "Goto Definition (first result)" })
    end,
  },
}
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     init = function()
--       vim.keymap.set("n", "gd", function()
--         vim.lsp.buf.definition({
--           on_list = function(options)
--             local items = options.items or {}
--             if vim.tbl_isempty(items) then
--               vim.notify("No definition found", vim.log.levels.WARN)
--               return
--             end
--
--             -- pick first result
--             local item = items[1]
--             local location = (item.user_data and item.user_data.location) or item
--
--             -- figure out an offset encoding (utf-16/utf-8) from any attached LSP client
--             local bufnr = options.context and options.context.bufnr or vim.api.nvim_get_current_buf()
--             local clients = vim.lsp.get_clients({ bufnr = bufnr })
--
--             -- prefer a client that can do definitions, otherwise just take the first
--             local encoding = nil
--             for _, c in ipairs(clients) do
--               if c.server_capabilities and c.server_capabilities.definitionProvider then
--                 encoding = c.offset_encoding
--                 break
--               end
--             end
--             encoding = encoding or (clients[1] and clients[1].offset_encoding) or "utf-16"
--
--             vim.lsp.util.show_document(location, encoding, { focus = true })
--           end,
--         })
--       end, { desc = "Goto Definition (first result)" })
--     end,
--   },
-- }
