# init config

require("lazy_setup")

local plugins = {}
table.insert(plugins, require("plugins/vimtex"))
table.insert(plugins, require("plugins/color"))

require("lazy").setup(plugins)


