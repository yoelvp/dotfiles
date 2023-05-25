return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  enable = true,
  config = function()
    require('yoelvp.lsp.lspconfig')
  end,
  -- setup = {
  -- 	eslint = function()
  -- 		vim.api.nvim_create_autocmd("BufWritePre", {
  -- 			callback = function(event)
  -- 				if require("lspconfig.util").get_active_client_by_name(event.buf, "eslint") then
  -- 					vim.cmd("EslintFixAll")
  -- 				end
  -- 			end,
  -- 		})
  -- 	end,
  -- },
}
