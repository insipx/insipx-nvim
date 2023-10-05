return {
  {
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
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup() end
  }, {"andymass/vim-matchup", event = "VimEnter"}, {
    "folke/which-key.nvim",
    -- branch = "main",
    -- tag = "v1.5.1",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end
  } -- easy mappings
}
