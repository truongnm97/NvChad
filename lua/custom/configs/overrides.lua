local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "svelte",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  autotag = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.gitsigns = {
  numhl = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 500,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
}

local prettier_svelte_path = "/Users/mac/.nvm/versions/node/v18.17.0/lib/node_modules/prettier-plugin-svelte/plugin.js"

M.conform = {
  lsp_fallback = true,

  formatters = {
    svelte_fmt = {
      command = "prettier",
      args = { "--plugin", prettier_svelte_path, "$FILENAME" },
    },
  },

  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
    scss = { { "prettierd", "prettier" } },
    less = { { "prettierd", "prettier" } },
    sass = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },
    json = { { "prettierd", "prettier" } },
    svelte = { "svelte_fmt" },

    sh = { "shfmt" },
  },

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

M.ibl = {
  indent = {
    char = "┆",
  },
}

M.autopairs = {}

M.possession = {
  autosave = {
    current = true, -- or fun(name): boolean
    tmp = false, -- or fun(): boolean
    tmp_name = "tmp", -- or fun(): string
    on_load = true,
    on_quit = true,
  },
  plugins = { delete_hidden_buffers = false },
}

-- -- returns true if `dir` is a child of `parent`
-- local is_dir_in_parent = function(dir, parent)
--   if parent == nil then
--     return false
--   end
--   local ws_str_find, _ = string.find(dir, parent, 1, true)
--   if ws_str_find == 1 then
--     return true
--   else
--     return false
--   end
-- end
--
-- -- convenience function which wraps is_dir_in_parent with active file
-- -- and workspace.
-- local current_file_in_ws = function()
--   local workspaces = require "workspaces"
--   local ws_path = require("workspaces.util").path
--   local current_ws = workspaces.path()
--   local current_file_dir = ws_path.parent(vim.fn.expand("%:p", true))
--
--   return is_dir_in_parent(current_file_dir, current_ws)
-- end
--
-- -- set workspace when changing buffers
-- local my_ws_grp = vim.api.nvim_create_augroup("my_ws_grp", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter" }, {
--   callback = function()
--     -- do nothing if not file type
--     local buf_type = vim.api.nvim_get_option_value("buftype", { buf = 0 })
--     if buf_type ~= "" and buf_type ~= "acwrite" then
--       return
--     end
--
--     -- do nothing if already within active workspace
--     if current_file_in_ws() then
--       return
--     end
--
--     local workspaces = require "workspaces"
--     local ws_path = require("workspaces.util").path
--     local current_file_dir = ws_path.parent(vim.fn.expand("%:p", true))
--
--     -- filtered_ws contains workspace entries that contain current file
--     local filtered_ws = vim.tbl_filter(function(entry)
--       return is_dir_in_parent(current_file_dir, entry.path)
--     end, workspaces.get())
--
--     -- select the longest match
--     local selected_workspace = nil
--     for _, value in pairs(filtered_ws) do
--       if not selected_workspace then
--         selected_workspace = value
--       end
--       if string.len(value.path) > string.len(selected_workspace.path) then
--         selected_workspace = value
--       end
--     end
--
--     if selected_workspace then
--       workspaces.open(selected_workspace.name)
--     end
--   end,
--
--   group = my_ws_grp,
-- })
--
-- M.workspaces = {
--   hooks = {
--     open_pre = {
--       "SessionsStop",
--       "silent %bdelete!",
--     },
--     open = {
--       -- do not run hooks if file already in active workspace
--       function()
--         if current_file_in_ws() then
--           return false
--         end
--       end,
--
--       function()
--         -- require("sessions").load(nil, { silent = false })
--       end,
--
--       -- function()
--       --   require("telescope.builtin").find_files()
--       -- end,
--
--       function()
--         -- require("nvim-tree.api").tree.open()
--       end,
--     },
--   },
-- }
--
-- M.sessions = {
--   events = { "BufEnter" },
--   session_filepath = vim.fn.stdpath "data" .. "/sessions",
--   absolute = true,
-- }

return M
