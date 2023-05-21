return {
	"kdheepak/lazygit.nvim",
	"tpope/vim-surround",
	"mg979/vim-visual-multi",
	{
		"kyazdani42/nvim-web-devicons",
		lazy = true,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		-- event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup({
				autotag = {
					enable = true,
				},
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("Comment").setup({})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"axelvc/template-string.nvim",
		event = "InsertEnter",
		config = function()
			require("template-string").setup({
				filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "python" },
				jsx_brackets = true,
				remove_template_string = false,
				restore_quotes = {
					normal = [[']],
					jsx = [["]],
				},
			})
		end,
	},
}
