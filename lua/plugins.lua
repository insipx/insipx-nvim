local packer = nil
local function init()
  if packer == nil then
    packer = require "packer"
    packer.init {display = {open_fn = require("packer.util").float}, log = {level = "debug"}, autoremove = true}
  end

  local use = packer.use
  packer.reset()

  -- Packer
  -- Packer can manage itself
  use "wbthomason/packer.nvim" -- plugins
  use "lewis6991/impatient.nvim" -- kill load time
  use "kyazdani42/nvim-web-devicons" -- eye candy
  -- Post-install/update hook with neovim command
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = {enable = true},
        indent = {enable = true},
        matchup = {enable = true}
      }
    end
  }
  use {"andymass/vim-matchup", event = "VimEnter"} -- operate on sets of matching text (if, else, etc)
  use "glepnir/dashboard-nvim" -- eyecandy

  use { -- eyecandy
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("bufferline").setup {
        options = {indicator = {style = "underline"}, diagnostics = "nvim_lsp"}
        -- highlights = {indicator_selected = {fg = '', bg = '', bold = true}}
      }
    end
  }

  --  use({
  --    "folke/noice.nvim",
  --    event = "VimEnter",
  --    config = function() require("noice").setup() end,
  --    requires = {
  --      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --      "MunifTanjim/nui.nvim", "rcarriga/nvim-notify"
  --    }
  --  })

  -- |-------------------------------------------------------------------------------|
  -- |-- _                                          __  ___                          |
  -- |--| |   __ _ _ _  __ _ _  _ __ _ __ _ ___    / / / __| ___ _ ___ _____ _ _     |
  -- |--| |__/ _` | ' \/ _` | || / _` / _` / -_)  / /  \__ \/ -_) '_\ V / -_) '_|    |
  -- |--|____\__,_|_||_\__, |\_,_\__,_\__, \___| /_/   |___/\___|_|  \_/\___|_|      |
  -- |--               |___/          |___/                                          |
  -- |-------------------------------------------------------------------------------|

  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- Config in plugin_config
  use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}

  use {"tiagovla/scope.nvim", config = function() require("scope").setup({}) end} -- required for scoped tabs
  use {"tiagovla/buffercd.nvim", config = function() require("buffercd").setup() end}

  -- use { 'arkav/lualine-lsp-progress' } lualine plugin for progress
  use {"ms-jpq/coq_nvim", branch = "coq"}
  use {"ms-jpq/coq.artifacts", branch = "artifacts"}
  use {"ms-jpq/coq.thirdparty", branch = "3p"}

  use "neovim/nvim-lspconfig"

  use "editorconfig/editorconfig-vim"

  -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
  -- General LSP for everything. Config in init.vim
  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local sources = {
        null_ls.builtins.formatting.dprint.with({filetypes = {"toml"}}), -- bin: dprint
        -- bin: lua-format, LuaFormatter, https://github.com/Koihik/LuaFormatter, nix: luaformatter
        null_ls.builtins.formatting.prettier, null_ls.builtins.formatting.lua_format.with({
          args = {
            "--indent-width", "2", "--tab-width", "2", "--column-limit", "100", "--no-use-tab",
            "--single-quote-to-double-quote", "--align-args"
          }
        }), null_ls.builtins.code_actions.statix, -- bin: statix 
        null_ls.builtins.formatting.nixfmt, -- bin: nixfmt
        null_ls.builtins.diagnostics.deadnix, -- bin: deadnix
        null_ls.builtins.formatting.cbfmt, -- bin: cbfmt (for formatting codeblocks in markdown)
        null_ls.builtins.formatting.dotenv_linter, -- bin: dotenv-linter
        null_ls.builtins.code_actions.gitsigns, -- bin: git
        null_ls.builtins.diagnostics.codespell, -- bin: codespell
        null_ls.builtins.diagnostics.gdlint, -- bin: gdlint
        null_ls.builtins.formatting.gdformat, -- bin: gdformat
        null_ls.builtins.diagnostics.gitlint, -- bin: gitlint
        null_ls.builtins.diagnostics.yamllint -- bin: yamllint

      }

      null_ls.setup({sources = sources, on_attach = require("lsp-format").on_attach})
    end
  }

  use {"j-hui/fidget.nvim", config = function() require("fidget").setup({}) end}

  use({"https://git.sr.ht/~whynothugo/lsp_lines.nvim", config = function() require("lsp_lines").setup() end})

  -- creates LSP diagnostics highlight groups for unsupported colorschemes
  use "folke/lsp-colors.nvim"
  -- quickfix for errors
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  -- nifty rust tools
  use {
    "simrat39/rust-tools.nvim",
    config = function()
      local rustopts = {
        tools = {
          inlay_hints = {only_current_line = true, show_variable_name = true},
          hover_actions = {auto_focus = true},
          crate_graph = {backend = "cgimage"}
        },
        server = {
          on_attach = function(client)
            require("lsp-format").on_attach(client)
            -- client.server_capabilities.document_formatting = false
            -- client.server_capabilities.document_range_formatting = false
          end,
          settings = {
            ["rust_analyzer"] = {
              procMacro = {enable = false},
              diagnostics = {disabled = {"unresolved-proc-macro"}},
              checkOnSave = {command = "clippy"}
            }
          }
        }
      }
      require("rust-tools").setup(require("coq").lsp_ensure_capabilities(rustopts))
    end,
    requires = "nvim-lua/plenary.nvim"
  }
  use "habamax/vim-godot" -- for godot

  use { -- view crate versions in virtual text
    "saecki/crates.nvim",
    tag = "v0.2.1",
    requires = {"nvim-lua/plenary.nvim"},
    config = function() require("crates").setup({src = {coq = {enabled = true}}}) end
  }

  -- view symbols (functions, structs, etc.) from LSP for a buffer. A useful outline for jumping in long files.
  use {"simrat39/symbols-outline.nvim", config = function() require("symbols-outline").setup() end}
  use {"lukas-reineke/lsp-format.nvim", config = function() require("lsp-format").setup {} end}
  -----------------------------------------------------------------------------------------------------------------------------
  -- </language-server>
  ------------------------------------------------------------------------------------------------------------------------------
  -- |-   ___ _ _   
  -- |-  / __(_) |_ 
  -- |- | (_ | |  _|
  -- |-  \___|_|\__|
  -- |-             
  -- |---------------------------------------------------------------------------------------------------------------------------
  -- |---------------------------------------------------------------------------------------------------------------------------

  use 'tpope/vim-fugitive' -- git stuff, commit, etc

  use { -- magit, but for vim
    "TimUntersberger/neogit",
    requires = {"nvim-lua/plenary.nvim"},
    config = function()
      require("neogit").setup {
        integrations = {diffview = true},
        sections = {unstaged = {folded = true}, unmerged = {folded = true}}
      }
    end
  }

  use {"sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim"} -- view diffs!

  use { -- 'tag = release' for stable neovim, main branch for nightly
    "lewis6991/gitsigns.nvim",
    branch = "main",
    requires = {"nvim-lua/plenary.nvim"},
    config = function() require("gitsigns").setup() end
  }

  use {
    "pwntester/octo.nvim",
    requires = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "kyazdani42/nvim-web-devicons"},
    config = function() require"octo".setup() end
  }

  -----------------------------------------------------------------------------------------------------------------
  -- </git>
  -----------------------------------------------------------------------------------------------------------------

  use {'https://gitlab.com/yorickpeterse/nvim-dd', config = function() require("dd").setup({}) end}
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup() end
  }

  use { -- indentation guides
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
        space_char_blankline = " ",
        filetype_exclude = {'dashboard'}
      }
    end
  }

  use {"npxbr/glow.nvim"} -- preview markdown
  -- You can alias plugin names
  use {"dracula/vim", as = "dracula"} -- DRACULA!
  use {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {styles = {comments = "italic,bold", functions = "italic", types = "italic,bold"}}
      })
    end
  } -- NIGHTFOX! -- treesitter support
  use {"rafamadriz/neon"} -- NEON! -- treesitter support
  use "pineapplegiant/spaceduck" -- SPACEDUCK! -- no treesitter support
  use "moll/vim-bbye"
  use "godlygeek/tabular" -- line up text
  use "preservim/vim-markdown" -- syntax highlighting/matching
  use "direnv/direnv.vim" -- nixos environments
  use "fedepujol/move.nvim" -- move lines and blocks
  use "luukvbaal/stabilize.nvim" -- stabilizes buffer content on window open/close vents
  use "yamatsum/nvim-cursorline" -- highlight words/lines on the cursor
  -- EZ OS commands 
  use "tpope/vim-eunuch" -- OS stuff (remove, move, chmod etc)
  use "junegunn/vim-easy-align" -- easy alignment of patterns ... another alignment tool? tabular
  use "jlanzarotta/bufexplorer" -- explore buffers!
  use {
    "sudormrfbin/cheatsheet.nvim",
    requires = {{"nvim-telescope/telescope.nvim"}, {"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
  }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup({check_ts = true, enable_check_bracket_line = false}) end
  }

  use {"akinsho/toggleterm.nvim", tag = "*", config = function() require("toggleterm").setup({}) end}

  use {
    "phaazon/hop.nvim",
    as = "hop",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require"hop".setup {}
    end
  }

  use {"GustavoKatel/sidebar.nvim", config = function() require"sidebar-nvim".setup {side = "right"} end}
  ------------------------------------------------------------------------------------------------------------
  --  _____ ___ _    ___ ___  ___ ___  ___ ___ 
  -- |_   _| __| |  | __/ __|/ __/ _ \| _ \ __|
  --   | | | _|| |__| _|\__ \ (_| (_) |  _/ _| 
  --   |_| |___|____|___|___/\___\___/|_| |___|
  --                                           
  ------------------------------------------------------------------------------------------------------------
  -- telescope
  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = {"nvim-lua/plenary.nvim"},
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
  }

  use {
    "nvim-telescope/telescope-fzy-native.nvim",
    config = function() require("telescope").load_extension("fzy_native") end
  }

  use {"nvim-telescope/telescope-project.nvim", config = function() require("telescope").load_extension("project") end}

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function() require("telescope").load_extension("file_browser") end
  }

  use { -- search tabs with telescope
    "TC72/telescope-tele-tabby.nvim",
    config = function() require("telescope").load_extension "tele_tabby" end
  }

  use { -- selection eye candy
    "nvim-telescope/telescope-ui-select.nvim",
    config = function() require("telescope").load_extension "ui-select" end
  }

  use { -- search devicons with telescope
    "ghassan0/telescope-glyph.nvim",
    config = function() require("telescope").load_extension "glyph" end
  }

  use { -- telescope terminal toggle
    "https://git.sr.ht/~havi/telescope-toggleterm.nvim",
    event = "TermOpen",
    requires = {"akinsho/toggleterm.nvim", "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function() require("telescope").load_extension "toggleterm" end
  }
  ------------------------------------------------------------------------------------------------------------------
  -- </telescope>
  ------------------------------------------------------------------------------------------------------------------
  use { -- colors hex strings, eyecandy
    "norcalli/nvim-colorizer.lua",
    config = function() require"colorizer".setup() end
  }

  use {"folke/which-key.nvim", branch = "main", config = function() require("which-key").setup {} end} -- easy mappings
end
local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

return plugins
