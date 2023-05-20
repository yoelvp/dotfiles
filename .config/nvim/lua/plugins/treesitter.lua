return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"lua",
				"rust",
				"bash",
				"css",
				"html",
				"javascript",
				"json",
				"markdown",
				"python",
				"scss",
				"tsx",
				"typescript",
				"markdown",
				"markdown_inline",
			},
			sync_install = true,
			auto_install = true,
			indent = { enable = true },
			highlight = {
				enable = true,
				-- additional_vim_regex_highlighting = false,
			},
			context_commentstring = {
				enable = true,
			},
		})
	end,
}
