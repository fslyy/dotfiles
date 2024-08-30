local km = vim.keymap

-- nvim-tree
local api = require("nvim-tree.api")

km.set("n", "<leader>et", api.tree.toggle, { silent = true, desc = "toggle nvim-tree" })
km.set("n", "<leader>er", api.tree.reload, { silent = true, desc = "reload nvim-tree" })
km.set("n", "<leader>ef", api.tree.focus, { silent = true, desc = "focus nvim-tree" })

-- Telescope
local scope = require("telescope.builtin")

km.set("n", "<leader>fa", scope.live_grep, { silent = true, desc = "live grep" })
km.set("n", "<leader>ff", scope.find_files, { silent = true, desc = "find files" })
km.set("n", "<leader>fc", scope.commands, { silent = true, desc = "show commands" })
