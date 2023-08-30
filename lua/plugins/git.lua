return {
  "tpope/vim-fugitive", -- git stuff, commit, etc
  { -- magit, but for vim
    "TimUntersberger/neogit",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
      require("neogit").setup {
        config = true,
        integrations = {diffview = true, telescope = true},
        sections = {unstaged = {folded = true, hidden = false}, unmerged_pushRemote = {folded = true, hidden = false }}
      }
    end
  }, {"sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim"}, -- view diffs!
  { -- 'tag = release' for stable neovim, main branch for nightly
    "lewis6991/gitsigns.nvim",
    branch = "main",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function() require("gitsigns").setup() end
  }, {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "kyazdani42/nvim-web-devicons"
    },
    config = function() require"octo".setup() end
  }
}
