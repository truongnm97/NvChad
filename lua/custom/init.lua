-- local autocmd = vim.api.nvim_create_autocmd
--[[
-- Auto resize panes when resizing nvim window ]]
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local function on_enter()
  require("nvim-tree.api").tree.open()
  -- vim.api.nvim_command "Nvdash"
  -- require("telescope.builtin").find_files()
  -- require("possession").load(vim.fn.getcwd():match "([^/\\]+)$")
  require("telescope").extensions.possession.list()
end

vim.opt.mouse = ""
vim.cmd "cd %:p:h"
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = on_enter })
