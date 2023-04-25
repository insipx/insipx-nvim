-- Plugins I have to organize

return {
  "lewis6991/impatient.nvim", -- kill load time
  "moll/vim-bbye",
  "godlygeek/tabular", -- line up text
  "preservim/vim-markdown", -- syntax highlighting/matching
  "direnv/direnv.vim", -- nixos environments
  "fedepujol/move.nvim", -- move lines and blocks
  "luukvbaal/stabilize.nvim", -- stabilizes buffer content on window open/close vents
  "yamatsum/nvim-cursorline", -- highlight words/lines on the cursor
  -- EZ OS commands 
  "tpope/vim-eunuch", -- OS stuff (remove, move, chmod etc)
  "junegunn/vim-easy-align", -- easy alignment of patterns ... another alignment tool? tabular
  "jlanzarotta/bufexplorer", -- explore buffers!
  {
    "sudormrfbin/cheatsheet.nvim",
    dependencies = {{"nvim-telescope/telescope.nvim"}, {"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
  },
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup({check_ts = true, enable_check_bracket_line = false}) end
  },
  { "akinsho/toggleterm.nvim", tag = "*", config = function() require("toggleterm").setup({}) end },
  {
    "phaazon/hop.nvim",
    name = "hop",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require"hop".setup {}
    end
  },
  {"GustavoKatel/sidebar.nvim", config = function() require"sidebar-nvim".setup {side = "right"} end},
  {'https://gitlab.com/yorickpeterse/nvim-dd', config = function() require("dd").setup({}) end},
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup() end
  },
  { -- indentation guides
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
        space_char_blankline = " ",
        filetype_exclude = {'dashboard'}
      }
    end
  },
  {'andymass/vim-matchup', event = 'VimEnter'},
  {"windwp/nvim-spectre", dependencies = "nvim-lua/plenary.nvim"},
  {"npxbr/glow.nvim"},
  { "folke/which-key.nvim", branch = "main", config = function() require("which-key").setup {} end } -- easy mappings
}
