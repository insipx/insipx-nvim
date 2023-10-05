local lualine_opts = require("plugins.ui.lualine_opts")

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    config = function() require("lualine").setup(lualine_opts()) end
  }, "nvim-treesitter/nvim-treesitter-textobjects", "kyazdani42/nvim-web-devicons", -- devicons :)
  -- You can alias plugin names
  {"dracula/vim", name = "dracula"}, -- DRACULA!
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {styles = {comments = "italic,bold", functions = "italic", types = "italic,bold"}}
      })
    end
  }, -- NIGHTFOX! -- treesitter support
  {"rafamadriz/neon"}, -- NEON! -- treesitter support
  "pineapplegiant/spaceduck", -- SPACDUCK!
  { -- eyecandy
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("bufferline").setup {
        options = {
          mode = "buffers",
          numbers = "ordinal",
          indicator = {style = "underline"},
          diagnostics = "nvim_lsp"
        }
        -- highlights = {indicator_selected = {fg = '', bg = '', bold = true}}
      }
    end
  }, { -- colors hex strings, eyecandy
    "norcalli/nvim-colorizer.lua",
    config = function() require"colorizer".setup() end
  }, { -- indentation guides
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      ibl = require("ibl");
      ibl.config = {
        enabled = true,
        scope = {enabled = true, show_start = true},
        exclude = {filetypes = {"dashboard"}}
      };
      --  space_char_blankline = " ",
    end
  },
  {
    "GustavoKatel/sidebar.nvim",
    config = function() require"sidebar-nvim".setup {side = "right"} end
  }, {"npxbr/glow.nvim"}, -- preview markdown with `Glow {FILE}.md`
  {"echasnovski/mini.animate", version = "*"}
}
