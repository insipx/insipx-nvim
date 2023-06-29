local rust_opts = require("plugins.lsp.rust_opts")

return {
  {"ms-jpq/coq_nvim", branch = "coq"}, {"ms-jpq/coq.artifacts", branch = "artifacts"},
  {"ms-jpq/coq.thirdparty", branch = "3p"}, "neovim/nvim-lspconfig",
  {"jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" }},
  {"j-hui/fidget.nvim", tag = "legacy", config = function() require("fidget").setup() end}, -- nvim lsp progress
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function() require("lsp_lines").setup() end
  }, "folke/lsp-colors.nvim", {
    "folke/trouble.nvim",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    config = function() require("trouble").setup() end
  }, {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup(require("coq").lsp_ensure_capabilities(rust_opts))
    end,
    dependencies = {"nvim-lua/plenary.nvim"}
  }, { -- view crate versions in virtual text
    "saecki/crates.nvim",
    tag = "v0.3.0",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function() require("crates").setup({src = {coq = {enabled = true}}}) end
  },
  -- view symbols (functions, structs, etc.) from LSP for a buffer. A useful outline for jumping in long files.
  {"simrat39/symbols-outline.nvim", config = function() require("symbols-outline").setup() end},
  {"lukas-reineke/lsp-format.nvim", config = function() require("lsp-format").setup {} end},
  "github/copilot.vim", {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function() require("lspsaga").setup({}) end,
    dependencies = {
      {"kyazdani42/nvim-web-devicons"},
      -- Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  }
}

-- Servers
