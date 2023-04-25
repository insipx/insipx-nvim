return {
	{ "tiagovla/scope.nvim", config = function() require("scope").setup() end }, -- NOT LSP
	{ "tiagovla/buffercd.nvim", config = function() require("buffercd").setup() end }, -- NOT LSP
	
	{ "ms-jpq/coq_nvim", branch = "coq" },
	{ "ms-jpq/coq.artifacts", branch = "artifacts" },
	{ "ms-jpq/coq.thirdparty", branch = "3p" },
	"neovim/nvim-lspconfig",
	"editorconfig/editorconfig-vim" ,
	"jose-elias-alvarez/null-ls.nvim",
	{ "j-hui/fidget.nvim", config = function() require("fidget").setup() end },
	{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim", config = function() require("lsp_lines").setup() end },
	"folke/lsp-colors.nvim",
	{ "folke/trouble.nvim", dependencies = { "kyazdani42/nvim-web-devicons" }, config = function() require("trouble").setup() end },

	{ "simrat39/rust-tools.nvim", 
		config = function()
			local rustopts = {
				tools = {
					inlay_hints = {only_current_line = true, show_variable_name = true},
					hover_actions = {auto_focus = true},
					crate_graph = {backend = "cgimage"}
				},
				server = {
				on_attach = function(client)
					require("lsp-format").on_attach(client)
					-- client.server_capabilities.document_formatting = false
					-- client.server_capabilities.document_range_formatting = false
					end,
				settings = {
					["rust_analyzer"] = {
						procMacro = { enable = false },
						diagnostics = {disabled = {"unresolved-proc-macro"}},
						checkOnSave = {command = "clippy"}
					}
				    }
				}
			}
			require("rust-tools").setup(require("coq").lsp_ensure_capabilities(rustopts))
		end,
		dependencies = { "nvim-lua/plenary.nvim" }
	},
  	"habamax/vim-godot", -- for godot

	{ -- view crate versions in virtual text
		"saecki/crates.nvim",
		tag = "v0.2.1",
		dependencies = {"nvim-lua/plenary.nvim"},
		config = function() require("crates").setup({src = {coq = {enabled = true}}}) end
	},
	-- view symbols (functions, structs, etc.) from LSP for a buffer. A useful outline for jumping in long files.
	{"simrat39/symbols-outline.nvim", config = function() require("symbols-outline").setup() end },
	{"lukas-reineke/lsp-format.nvim", config = function() require("lsp-format").setup {} end },
	'github/copilot.vim'
}
