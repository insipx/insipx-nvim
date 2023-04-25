return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {enable = true},
        indent = {enable = true},
        matchup = {enable = true}
      }
    end
  },
  "nvim-treesitter/nvim-treesitter-textobjects",
}
