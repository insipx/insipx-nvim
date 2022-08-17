-- require('statusline')

local packer = nil
local function init()
  if packer == nil then
    packer = require 'packer'
    packer.init { log = { level = 'debug' }, autoremove = true }
  end

  local use = packer.use
  packer.reset()

  -- Packer
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  -- Post-install/update hook with neovim command
  use {
    'nvim-treesitter/nvim-treesitter', 
    run = ':TSUpdate', 
    config = function() 
      require('nvim-treesitter.configs').setup {
        highlight = {
          enable = true
        },
        indent = {
          enable = true
        }
      }
    end
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'glepnir/dashboard-nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use { 'ms-jpq/coq_nvim', branch = 'coq' }
  use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
  use { 'ms-jpq/coq.thirdparty', branch = '3p'}

  use {
    'nvim-lualine/lualine.nvim',
    config = statusline_config,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { 'arkav/lualine-lsp-progress' }


  use { 
    'williamboman/mason.nvim', config = function()
      require('mason').setup({})
    end
  }
  
  use { 'williamboman/mason-lspconfig.nvim', config = function()
       require('mason-lspconfig').setup({
	ensure_installed = { "rust_analyzer" }
      })
    end
  }
  use 'neovim/nvim-lspconfig'
  
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function() 
      require("lsp_lines").setup()
    end,
  })

  use { 'simrat39/rust-tools.nvim', 
    config = function()
      require('rust-tools').setup ({
        tools = {
          inlay_hints = {
            only_current_line = true,
            show_variable_name = true,
          },
          hover_actions = {
            auto_focus = true,
          },
          crate_graph = {
            backend = "cgimage",
          }
        }
      })
    end,
    requires = "nvim-lua/plenary.nvim"
  }

  use {
      'saecki/crates.nvim',
      tag = 'v0.2.1',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
          require('crates').setup({
            src = {
              coq = { enabled = true }
            }
          })
      end,
  }

  
  use { 
    'https://gitlab.com/yorickpeterse/nvim-dd',
    config = function()
      require("dd").setup({})
    end
  }
  
  use 'folke/lsp-colors.nvim'
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
  
  use {
    "ms-jpq/chadtree",
    branch = "chad",
    run = "python3 -m chadtree deps"
  }

  -- use {
  --"folke/todo-comments.nvim",
  --requires = "nvim-lua/plenary.nvim",
  --config = function()
  --  require("todo-comments").setup()
  --end
  -- }
  
  use {'andymass/vim-matchup', event = 'VimEnter'}
  use { "npxbr/glow.nvim" }
  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'} -- DRACULA!
  use 'EdenEast/nightfox.nvim' -- NIGHTFOX!
  use 'pineapplegiant/spaceduck' -- SPACEDUCK!
  use 'rakr/vim-one'
  use { "akinsho/toggleterm.nvim", branch = "main" }
  -- use 'voldikss/vim-floaterm'
  use 'moll/vim-bbye'
  use 'editorconfig/editorconfig-vim'
  use 'godlygeek/tabular'
  use 'preservim/vim-markdown'
  use 'sbdchd/neoformat'
  use 'direnv/direnv.vim' 
  use 'fedepujol/move.nvim'
  use 'luukvbaal/stabilize.nvim'
  use 'yamatsum/nvim-cursorline'  
  use "lukas-reineke/indent-blankline.nvim"
  -- EZ OS commands 
  use "tpope/vim-eunuch"
  use "junegunn/vim-easy-align"
  use { 'tpope/vim-fugitive' }
  use "habamax/vim-godot"
  use "jlanzarotta/bufexplorer"

  use { 'windwp/nvim-autopairs', 
    config = function()
      require('nvim-autopairs').setup({
        check_ts = true,
        enable_check_bracket_line = false
      })
    end
  }

  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup {}
    end
  }

  use {
    'GustavoKatel/sidebar.nvim',
    config = function() require'sidebar-nvim'.setup 
      {
        side = "right",
      }
    end
  }
  
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use {
    "https://git.sr.ht/~havi/telescope-toggleterm.nvim",
    event = "TermOpen",
    requires = {
       "akinsho/toggleterm.nvim",
       "nvim-telescope/telescope.nvim",
       "nvim-lua/popup.nvim",
       "nvim-lua/plenary.nvim",
    },
    config = function()
       require("telescope").load_extension "toggleterm"
    end,
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup() end
  }
  
  use { 
    'TimUntersberger/neogit', 
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() 
      require('neogit').setup {
        integrations = {
          diffview = true
        },
        sections = {
          unstaged = {
            folded = true
          },
          unmerged = {
            folded = true
          }
        }
      }
    end
  }
  
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  
  use {
    "folke/which-key.nvim",
    branch = "main",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use {
      "nvim-neorg/neorg",
      config = function()
          require('neorg').setup {
            load = {
        	  ["core.defaults"] = {}, -- Load all the default modules
        	  ["core.norg.concealer"] = {}, -- Allows for use of icons
        	  ["core.norg.dirman"] = { -- Manage your directories with Neorg
        	      config = {
        		  workspaces = {
        		      my_workspace = "~/neorg"
        		  }
        	      }
        	  },
                ["core.integrations.telescope"] = {}, -- Enable the telescope module
              }
          }
      end,
      requires = "nvim-lua/plenary.nvim",
      requires = "nvim-neorg/neorg-telescope"
  }
end
  local plugins = setmetatable({}, {
    __index = function(_, key)
      init()
	return packer[key]
      end,
  })
  
return plugins
