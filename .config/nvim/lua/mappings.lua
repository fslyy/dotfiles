local km = vim.keymap
local api = require("nvim-tree.api")

km.set("n", "<C-t>", api.tree.toggle, { silent = true, desc = "toggle nvim-tree" })
