-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]
require('statusline')

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

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
  use { 'arkav/lualine-lsp-progress' }

  use {
    'nvim-lualine/lualine.nvim',
    config = statusline_config,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { 'williamboman/nvim-lsp-installer', 
    config = function() 
      local lsp_installer = require("nvim-lsp-installer")

      lsp_installer.on_server_ready(function(server)
	  local opts = {}

	  if server.name == "rust_analyzer" then
	      -- Initialize the LSP via rust-tools instead
	      require("rust-tools").setup {
		  -- The "server" property provided in rust-tools setup function are the
		  -- settings rust-tools will provide to lspconfig during init.            -- 
		  -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
		  -- with the user's own settings (opts).
		  server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
	      }
	      server:attach_buffers()
	      -- Only if standalone support is needed
	      require("rust-tools").start_standalone_if_required()
	  else
	      server:setup(opts)
	end
      end)


    end
  }

  use { 'neovim/nvim-lspconfig', config = function()
    local coq = require('coq')
    require('lspconfig').rust_analyzer.setup (
      coq.lsp_ensure_capabilities({
	settings = {
	    ["rust-analyzer"] = {
		procMacro = {
		    enable = true
		},
		diagnostics = {
		  disabled = {"unresolved-proc-macro"}
		},
		checkOnSave = {
		  command = "clippy"
		}
	    }
	  }
      })
    )
    require('lspconfig').gdscript.setup (coq.lsp_ensure_capabilities())
    end
  }

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
      require("dd").setup { 
      
      }
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
  use { 'tpope/vim-fugitive' }
  use "habamax/vim-godot"
  use { 
    'rmagatti/auto-session', 
    config = 
    function() require'auto-session'.setup
      {
	  auto_session_enabled = true,
      } 
    end 
  }
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

end)

