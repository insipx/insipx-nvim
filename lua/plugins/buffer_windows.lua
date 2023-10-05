return {
  "luukvbaal/stabilize.nvim", -- stabilizes buffer content on window open/close vents
  "yamatsum/nvim-cursorline", -- highlight words/lines on the cursor
  { -- SCOPE only shows buffers which are a part of the current tab.
    "tiagovla/scope.nvim",
    config = function()
      require("telescope").load_extension "scope"
      require("scope").setup {}
    end
  }, "jlanzarotta/bufexplorer" -- explore buffers!
}
