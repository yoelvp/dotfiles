return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	enable = true,
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim = require("cmp_nvim_lsp")

		local capabilities = cmp_nvim.default_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<C-i>", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end,
		})

		lspconfig.tsserver.setup({
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			cmd = { "typescript-language-server", "--stdio" },
		})

		lspconfig.tailwindcss.setup({
			cmd = { "tailwindcss-language-server", "--stdio" },
			capabilities = capabilities,
		})

		lspconfig.html.setup({
			capabilities = capabilities,
		})

		lspconfig.cssls.setup({
			capabilities = capabilities,
		})

		lspconfig.rust_analyzer.setup({
			settings = {
				["rust-analyzer"] = {},
			},
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
				},
			},
		})

		-- Diagnostic symbols in the sign column (gutter)
		-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		-- for type, icon in pairs(signs) do
		-- 	local hl = "DiagnosticSign" .. type
		-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		-- end
		--
		-- vim.diagnostic.config({
		-- 	virtual_text = {
		-- 		prefix = "●",
		-- 	},
		-- 	update_in_insert = true,
		-- 	float = {
		-- 		source = "always", -- Or "if_many"
		-- 	},
		-- })
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
