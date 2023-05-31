local ok, telescope = pcall(require, "telescope")

if not ok then
	return
end

telescope.load_extension("media_files")
telescope.load_extension("file_browser")

telescope.setup({
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

vim.keymap.set("n", "ff", function()
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

vim.keymap.set("n", "fb", function()
	require("telescope.builtin").buffers({
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

vim.keymap.set("n", "fm", function()
	telescope.extensions.media_files.media_files({
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

vim.keymap.set("n", "ft", function()
	telescope.extensions.file_browser.file_browser({
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
