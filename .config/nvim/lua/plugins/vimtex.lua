return {
	"lervag/vimtex",
	ft = { "tex", "latex" },
	config = function()
		vim.g.latex_view_general_viewer = "zathura"
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_compile_latexmk = {
			options = {
				"-shell-escape",
				"-verbose",
				"-interactions=nonstopmode",
				"-synctex=1",
			},
		}
	end,
}
