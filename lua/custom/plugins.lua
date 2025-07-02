local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-telescope/telescope-media-files.nvim",
    opts = {},
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    opts = {},
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = overrides.nvimtree,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre",
    opts = overrides.conform,
  },

  {
    "jedrzejboczar/possession.nvim",
    config = true,
    opts = overrides.possession,
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- {
  --   "natecraddock/sessions.nvim",
  --   event = "WinEnter",
  --   opts = overrides.sessions,
  --   config = function(_, opts)
  --     require("sessions").setup(opts)
  --   end,
  -- },
  --
  -- {
  --   "natecraddock/workspaces.nvim",
  --   event = "VimEnter",
  --   opts = overrides.workspaces,
  --   dependencies = {
  --     "natecraddock/sessions.nvim",
  --   },
  --   config = function(_, opts)
  --     require("workspaces").setup(opts)
  --   end,
  -- },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "tpope/vim-surround",
    event = "VimEnter",
  },

  {
    "nvim-pack/nvim-spectre",
    config = function()
      require("spectre").setup {
        open_cmd = "75vnew",
        line_sep_start = "╭───────────────────────────────────────────────────────────────────╮",
        result_padding = "│ ",
        line_sep = "╰───────────────────────────────────────────────────────────────────╯",
      }
    end,
  },

  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    -- enabled = false
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opt = overrides.autopairs,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    commit = "29be0919b91fb59eca9e90690d76014233392bef",
    config = function()
      require("ibl").setup(require("indent-rainbowline").make_opts(overrides.ibl, {
        color_transparency = 0.05,
        colors = {
          0x40bf6a,
          0x40bf80,
          0x40bf95,
          0x40bfaa,
          0x40bfbf,
          0x40aabf,
          0x4095bf,
          0x4080bf,
          0x406abf,
          0x4055bf,
          0x4040bf,
          0x5540bf,
          0x6a40bf,
          0x8040bf,
          0x9540bf,
          0xaa40bf,
          0xbf40bf,
          0xbf40aa,
          0xbf4095,
        },
      }))
    end,
    dependencies = {
      "TheGLander/indent-rainbowline.nvim",
    },
  },

  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "smoka7/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>mc",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },

  {
    "declancm/cinnamon.nvim",
    version = "*",
    event = "VimEnter",
    config = function()
      require("cinnamon").setup {
        keymaps = {
          basic = true,
          extra = false,
        },
      }
    end,
  },

  {
    "imNel/monorepo.nvim",
    config = function()
      require("monorepo").setup {
        -- Your config here!
      }
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  {
    "adelarsq/image_preview.nvim",
    event = "VeryLazy",
    config = function()
      require("image_preview").setup()
    end,
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- provider = "openai",
      provider = "claude",
      cursor_applying_provider = "groq",
      behaviour = {
        enable_cursor_planning_mode = true,
      },
      providers = {
        groq = { -- define groq provider
          __inherited_from = "openai",
          api_key_name = "Nvchad",
          endpoint = "https://api.groq.com/openai/v1/",
          model = "llama-3.3-70b-versatile",
          extra_request_body = {
            max_completion_tokens = 32768,
          },
        },
      },
      -- openai = {
      --   endpoint = "https://api.openai.com/v1",
      --   model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
      --   timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
      --   temperature = 0,
      --   max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
      --   --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
      -- },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {}, -- your configuration
  },

  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    config = function()
      require("mcphub").setup()
    end,
  },

  -- {
  --   "huggingface/llm.nvim",
  --   event = "VimEnter",
  --   opts = {
  --     model = "codellama:7b",
  --     backend = "ollama",
  --     url = "http://localhost:11434/api/generate", -- llm-ls uses "/api/generate"
  --     -- cf https://github.com/ollama/ollama/blob/main/docs/api.md#parameters
  --     request_body = {
  --       -- Modelfile options for the model you use
  --       options = {
  --         temperature = 0.2,
  --         top_p = 0.95,
  --       },
  --     },
  --     lsp = {
  --       bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls",
  --     },
  --     tokens_to_clear = { "<EOT>" },
  --     fim = {
  --       enabled = true,
  --       prefix = "<PRE> ",
  --       middle = " <MID>",
  --       suffix = " <SUF>",
  --     },
  --     context_window = 4096,
  --     tokenizer = {
  --       repository = "codellama/CodeLlama-7b-hf",
  --     },
  --   },
  -- },
  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
