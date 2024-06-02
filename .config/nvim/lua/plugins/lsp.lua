return {
	"neovim/nvim-lspconfig",
	config = function()
		local lsp = require("lspconfig")
		lsp["lua_ls"].setup({})
		lsp.texlab.setup({})
	end,
	dependencies = {
		{ "folke/neodev.nvim" },
		{ "folke/trouble.nvim" },
		{ "williamboman/mason-lspconfig.nvim", opts = {} },
		{ "williamboman/mason.nvim", opts = {} },
		{
			"stevearc/conform.nvim",
			init = function()
				vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
			end,
			opts = {
				format_on_save = { timeout_ms = 500, lsp_fallback = true },
				formatters_by_ft = { lua = { "stylua" } },
			},
		},
	},
}
