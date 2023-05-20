return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	dependencies = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		require("telescope").load_extension("media_files")
		require("telescope").load_extension("file_browser")

		require("telescope").setup({
			pickers = {
				find_files = {
					theme = "dropdown",
				},
				buffers = {
					theme = "dropdown",
				},
			},
			extensions = {
				media_files = {
					theme = "dropdown",
					filetypes = { "png", "webp", "jpg", "jpeg", "svg", "pdf", "mp4", "mkv", "avif" },
					find_cmd = "rg",
				},
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
					sorter = "get_fuzzy_file",
				},
			},
		})

		local opts = { noremap = true, silent = true }

		vim.keymap.set("n", "tf", function()
			require("telescope.builtin").find_files({
				noignore = false,
				hidden = true,
				grouped = true,
				previewer = false,
				initial_mode = "normal",
				layout_config = {
					height = 25,
				},
			})
		end, opts)

		vim.keymap.set("n", "tt", function()
			require("telescope.builtin").buffers({
				noignore = false,
				hidden = true,
				grouped = true,
				previewer = false,
				initial_mode = "normal",
				layout_config = {
					height = 25,
				}
			})
		end, opts)

		vim.keymap.set("n", "tm", function()
			require("telescope").extensions.media_files.media_files({
				path = "%:p:h",
				cwd = vim.fn.expand("%:p:h"),
				respect_gitignore = false,
				hidden = true,
				grouped = true,
				initial_mode = "normal",
				layout_config = {
					prompt_position = "top",
				},
			})
		end, opts)

		vim.keymap.set("n", "tb", function()
			require("telescope").extensions.file_browser.file_browser({
				path = "%:p:h",
				cwd = vim.fn.expand("%:p:h"),
				respect_gitignore = false,
				hidden = true,
				grouped = true,
				previewer = false,
				initial_mode = "normal",
				layout_config = {
					height = 25,
					prompt_position = "top",
				},
			})
		end, opts)
	end,
}
