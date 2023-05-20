return {
	"ellisonleao/gruvbox.nvim",
	enable = false,
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = false,
				comments = true,
				operators = false,
				folds = false,
			},
			strikethrough = true,
			invert_selection = true,
			invert_signs = false,
			invert_tabline = true,
			invert_intend_guides = true,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "hard", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		})
		vim.cmd([[ colorscheme gruvbox ]])
	end,
}
