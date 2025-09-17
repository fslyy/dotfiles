-- init config
local o = vim.o
o.expandtab = true
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 2

vim.g.mapleader = ","

vim.opt.termguicolors = true

require("lazy_setup")

local plugins = {}
table.insert(plugins, require("plugins/nvim-treesitter"))
table.insert(plugins, require("plugins/vimtex"))
table.insert(plugins, require("plugins/color"))
table.insert(plugins, require("plugins/telescope"))
table.insert(plugins, require("plugins/lualine"))
table.insert(plugins, require("plugins/lsp"))
table.insert(plugins, require("plugins/cmp"))
table.insert(plugins, require("plugins/nvim-tree"))
table.insert(plugins, require("plugins/which-key"))
table.insert(plugins, require("plugins/dashboard-nvim"))

require("lazy").setup(plugins)

vim.cmd("colorscheme hellwal")

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = vim.fn.expand("~/.cache/hellwal/colors.vim"),
	callback = function()
		vim.cmd("colorscheme hellwal")
	end,
})

require("mappings")
