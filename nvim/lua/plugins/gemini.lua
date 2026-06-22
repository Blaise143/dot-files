return {
  "kiddos/gemini.nvim",

  opts = {
    model_config = {
      model_id = "gemini-2.5-flash",
      temperature = 0.4,
    },

    -- Disable to avoid annoying ghost text and to save API quota.
    hints = { enabled = false },
    completion = { enabled = false },

    -- Configure behavior
    instruction = {
      enabled = true,
      data = "You are a senior expert programmer in Python, Your responses must be brief, concise, and focused on technical excellence.",
    },

    chat_config = {
      enabled = true,
    },
  },

  config = function(_, opts)
    require("gemini").setup(opts)

    -- Keybindings
    vim.keymap.set("n", "<leader>gc", "<cmd>GeminiChat<cr>", { desc = "Gemini Chat" })
    vim.keymap.set("n", "<leader>gr", "<cmd>GeminiReview<cr>", { desc = "Gemini Code Review" })
    vim.keymap.set("v", "<leader>ge", "<cmd>GeminiExplain<cr>", { desc = "Gemini Explain Selection" })
    vim.keymap.set("v", "<leader>go", "<cmd>GeminiOptimize<cr>", { desc = "Gemini Optimize Selection" })
  end,
}
