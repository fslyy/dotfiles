local km = vim.keymap

-- nvim-tree
local api = require("nvim-tree.api")

km.set("n", "<C-t>", api.tree.toggle, { silent = true, desc = "toggle nvim-tree" })

-- Telescope
local scope = require("telescope.builtin")

km.set("n", "<C-f>", scope.live_grep, { silent = true, desc = "live grep" })
