# init config

vim.g.mapleader = ","

require("lazy_setup")

local plugins = {}
table.insert(plugins, require("plugins/vimtex"))
table.insert(plugins, require("plugins/color"))
table.insert(plugins, require("plugins/telescope"))
table.insert(plugins, require("plugins/lualine"))
table.insert(plugins, require("plugins/lsp"))
table.insert(plugins, require("plugins/cmp"))
table.insert(plugins, require("plugins/nvim-tree"))
table.insert(plugins, require("plugins/which-key"))

require("lazy").setup(plugins)

require("mappings")



