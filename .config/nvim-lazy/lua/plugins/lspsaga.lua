return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-web-devicons",
    "nvim-treesitter",
  },
  config = function()
    require("lspsaga").setup({
      symbol_in_winbar = {
        enable = false,
      },
    })

    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    keymap("n", "<C-j>", ":Lspsaga diagnostic_jump_next<CR>", opts)
    keymap("n", "K", ":Lspsaga hover_doc<CR>", opts)
    keymap("n", "gd", ":Lspsaga lsp_finder<CR>", opts)
    keymap("i", "<C-k>", ":Lspsaga signature_help<CR>", opts)
    keymap("n", "gp", ":Lspsaga preview_definition<CR>", opts)
    keymap("n", "gr", ":Lspsaga rename<CR>", opts)
  end,
}
