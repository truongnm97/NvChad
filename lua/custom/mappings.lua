---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>q"] = {
      function()
        vim.api.nvim_command "q"
      end,
      "Quit",
    },
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "Format with conform",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
  i = {
    -- ["<C-k>"] = {
    --   "<cmd> :m'<-2<CR>gv=gv <CR>",
    --   "Move the selected line up",
    -- },
    -- ["<C-j>"] = {
    --   "<cmd> :m'>+1<CR>gv=gv <CR>",
    --   "Move the selected line down",
    -- },
    -- ["<C-h>"] = { "<C-\\><C-N>bgi", "Move the cursor to the start of the previous word" },
    -- ["<C-l>"] = { "<C-\\><C-N>wgi", "Move the cursor to the start of the next word" },
  },
}

-- more keybinds!
M.telescope = {
  n = {
    ["gr"] = { "<cmd> Telescope lsp_references <CR>", "Find references" },
    ["gd"] = { "<cmd> Telescope lsp_definitions <CR>", "Find definitions" },
    ["<leader>fr"] = { "<cmd> Telescope lsp_references <CR>", "Find references" },
    ["<leader>fs"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Find document symbols" },
    ["<leader>fS"] = { "<cmd> Telescope lsp_workspace_symbols <CR>", "Find workspace symbols" },
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", "Git branches" },
    ["<leader>gs"] = { "<cmd> Telescope git_stash <CR>", "Git stash" },
  },
}

M.gitsigns = {
  n = {
    ["<leader>cr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },
    ["<leader>cR"] = {
      function()
        require("gitsigns").reset_buffer()
      end,
      "Reset buffer",
    },
    ["<leader>cs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage hunk",
    },
    ["<leader>cS"] = {
      function()
        require("gitsigns").stage_buffer()
      end,
      "Stage buffer",
    },
    ["<leader>cu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "Undo stage hunk",
    },
    ["<leader>cp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },
    ["<leader>cb"] = {
      function()
        require("gitsigns").blame_line()
      end,
      "Blame line",
    },
    ["<leader>cd"] = {
      function()
        require("gitsigns").diffthis()
      end,
      "Diff this",
    },
    ["<leader>cD"] = {
      function()
        require("gitsigns").diffthis "~"
      end,
      "Diff this",
    },
  },
}

M.spectre = {
  n = {
    ["<leader>S"] = {
      function()
        require("spectre").toggle()
      end,
      "Search all",
    },
    ["<leader>sw"] = {
      function()
        require("spectre").open_visual { select_word = true }
      end,
      "Search current word",
    },
    ["<leader>sp"] = {
      function()
        require("spectre").open_file_search { select_word = true }
      end,
      "Search on current file",
    },
  },
  v = {
    ["<leader>sw"] = {
      function()
        require("spectre").open_visual()
      end,
      "Search current word",
    },
  },
}

M.possession = {
  n = {
    ["<leader>sl"] = {
      function()
        require("telescope").extensions.possession.list()
      end,
      "List of sessions",
    },
    ["<leader>ss"] = {
      function()
        require("possession").save(vim.fn.getcwd():match "([^/\\]+)$")
      end,
      "Save session",
    },
    ["<leader>sd"] = {
      function()
        vim.api.nvim_command "PossessionDelete"
      end,
      "Delete session",
    },
  },
}

M.monorepo = {
  n = {
    ["<leader>mn"] = {
      function()
        require("telescope").extensions.monorepo.monorepo()
      end,
      "Open monorepo"
    },
    ["<leader>mt"] = {
      function()
        require("monorepo").toggle_project()
      end,
      "Toggle monorepo"
    }
  }
}

return M
