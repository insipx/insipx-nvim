return { 
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
      require("telescope").setup {
        defaults = {selection_caret = ""},
        pickers = {find_files = {theme = "ivy"}},
        extensions = {
          fzy_native = {override_generic_sorter = true, override_file_sorter = true},
          glyph = {
            action = function(glyph)
              vim.fn.setreg("*", glyph.value)
              vim.api.nvim_put({glyph.value}, "c", false, true)
            end
          },
          project = {
            theme = "ivy",
            base_dirs = {
              "~/projects/efinity/efinity/", "~/projects/parity/polkadot/", "~/projects/parity/substrate/",
              "~/projects/parallel/"
            }
          },
          file_browser = {theme = "ivy", hijack_netrw = true}
        }
      }
    end
  },
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    config = function() require("telescope").load_extension("fzy_native") end
  },
  {"nvim-telescope/telescope-project.nvim", config = function() require("telescope").load_extension("project") end},
  {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function() require("telescope").load_extension("file_browser") end
  },
  { -- search tabs with telescope
    "TC72/telescope-tele-tabby.nvim",
    config = function() require("telescope").load_extension "tele_tabby" end
  },
  { -- selection eye candy
    "nvim-telescope/telescope-ui-select.nvim",
    config = function() require("telescope").load_extension "ui-select" end
  },
  { -- search devicons with telescope
    "ghassan0/telescope-glyph.nvim",
    config = function() require("telescope").load_extension "glyph" end
  },
  { -- telescope terminal toggle
    "https://git.sr.ht/~havi/telescope-toggleterm.nvim",
    event = "TermOpen",
    dependencies = {"akinsho/toggleterm.nvim", "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function() require("telescope").load_extension "toggleterm" end
  }
}
