return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {"nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope"},
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {config = {icon_preset = "diamond"}}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {workspaces = {work = "~/.notes/work", home = "~/.notes/home"}}
          },
          ["core.integrations.telescope"] = {},
          ["core.keybinds"] = {config = {default_keybindings = true, neorg_leader = "<Space>"}}
        }
      }
    end
  }
}
