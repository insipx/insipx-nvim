return {
 'tpope/vim-fugitive', -- git stuff, commit, etc
  { -- magit, but for vim
    "TimUntersberger/neogit",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
      require("neogit").setup {
        integrations = {diffview = true},
        sections = {unstaged = {folded = true}, unmerged = {folded = true}}
      }
    end
  },
  {"sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim"}, -- view diffs!
  { -- 'tag = release' for stable neovim, main branch for nightly
    "lewis6991/gitsigns.nvim",
    branch = "release",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function() require("gitsigns").setup() end
  },
  {
    "pwntester/octo.nvim",
    dependencies = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "kyazdani42/nvim-web-devicons"},
    config = function() require"octo".setup() end
  }
}
