return {
  {
    "AstroNvim/astrocore",
    opts = {
      autocmds = {
        python_library_readonly = {
          {
            event = "BufEnter",
            callback = function(args)
              local path = vim.api.nvim_buf_get_name(args.buf)

              if path:find "/site%-packages/" then
                vim.bo.readonly = true
                vim.bo.modifiable = false
              end
            end,
          },
        },
      },
    },
  },
}
