return {
  "yetone/avante.nvim",

  build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",

  event = "VeryLazy",
  version = false,

  opts = {
    provider = "gemini",

    system_prompt = [[
              You are an expert software engineer.

              Rules:
              - Be concise.
              - Prefer modifying existing code over rewriting it.
              - Follow the project's existing style.
              - When suggesting code changes, explain why.
              - For Python, use type hints.
              - For Neovim plugins, prefer Lazy.nvim configuration.
        ]],

    providers = {
      gemini = {
        endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
        model = "gemini-2.5-flash",
        timeout = 30000,

        extra_request_body = {
          generationConfig = {
            temperature = 0.75,
            maxOutputTokens = 32768,
          },
        },
      },
    },
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",

    -- file pickers
    "nvim-mini/mini.pick",
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",

    -- UI
    "stevearc/dressing.nvim",
    "folke/snacks.nvim",
    "nvim-tree/nvim-web-devicons",

    -- completion
    "hrsh7th/nvim-cmp",

    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },

    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "Avante" },
      opts = {
        file_types = { "markdown", "Avante" },
      },
    },
  },
}
