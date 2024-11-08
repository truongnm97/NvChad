local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettierd.with {
    -- bin = "prettierd",
    -- filetypes = {
    --   "html",
    --   "markdown",
    --   "css",
    --   "scss",
    --   "less",
    --   "sass",
    --   "javascript",
    --   "javascriptreact",
    --   "typescript",
    --   "typescriptreact",
    --   "svelte",
    -- },
    extra_filetypes = { "svelte" },
  },

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
