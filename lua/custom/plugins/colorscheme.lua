return {
	{ -- You can easily change to a different colorscheme.
		"tiagovla/tokyodark.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "deep",
			})
		end,
	},
}
