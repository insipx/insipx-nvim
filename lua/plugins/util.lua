return {
  "moll/vim-bbye", "lewis6991/impatient.nvim", -- kill load time
  "airblade/vim-rooter", "direnv/direnv.vim", -- nixos environments
  "godlygeek/tabular", -- line up text
  "junegunn/vim-easy-align", -- easy alignment of patterns ... another alignment tool? tabular
  -- "jlanzarotta/bufexplorer", -- explore buffers!
  "fedepujol/move.nvim", -- move lines and blocks
  "luukvbaal/stabilize.nvim", -- stabilizes buffer content on window open/close vents
  "yamatsum/nvim-cursorline", -- highlight words/lines on the cursor
  "tpope/vim-eunuch", -- OS stuff (remove, move, chmod etc)
  { -- SCOPE only shows buffers which are a part of the current tab.
    "tiagovla/scope.nvim",
    config = function()
      require("telescope").load_extension "scope"
      require("scope").setup {}
    end
  }, {"akinsho/toggleterm.nvim", version = "2.7.0", config = true}, {
    "sudormrfbin/cheatsheet.nvim",
    dependencies = {
      {"nvim-telescope/telescope.nvim"}, {"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}
    }
  }, {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({check_ts = true, enable_check_bracket_line = false})
    end
  }, {
    "phaazon/hop.nvim",
    name = "hop",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require"hop".setup {}
    end
  }, {
    "https://gitlab.com/yorickpeterse/nvim-dd",
    config = function()
      require("dd").setup({
        -- time to wait to defer diagnostics
        timeout = 1000
      })
    end
  }, -- defers diagnostics
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup() end
  }, {"andymass/vim-matchup", event = "VimEnter"},
  {"windwp/nvim-spectre", dependencies = "nvim-lua/plenary.nvim"}, -- Find and Replace
  {"folke/which-key.nvim", branch = "main", config = function() require("which-key").setup {} end}, -- easy mappings
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {workspaces = {notes = "~/notes/neorg"}}
          }
        }
      }
    end
  }
}
