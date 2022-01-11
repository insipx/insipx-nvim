-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

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

  use { 'ms-jpq/coq-nvim', branch = 'coq' }
  use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }

  use { 'neovim/nvim-lspconfig', config = function()
    require('lspconfig').rust_analyzer.setup {
      cmd = { "rust-analyzer" },
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
    }
    end
  }
  
  use { 
    'https://gitlab.com/yorickpeterse/nvim-dd',
    config = function()
      require("dd").setup { 
      
      }
    end
  }
  
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
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() 
	require'nvim-tree'.setup {
		-- your config comes here	
	} 
    end
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }

  use '9mm/vim-closer'
  use {'andymass/vim-matchup', event = 'VimEnter'}
  use { "npxbr/glow.nvim" }
  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'} -- DRACULA!
  use 'EdenEast/nightfox.nvim' -- NIGHTFOX!
  use 'pineapplegiant/spaceduck' -- SPACEDUCK!
  use 'voldikss/vim-floaterm'
  use 'moll/vim-bbye'
  use 'editorconfig/editorconfig-vim'
  use 'godlygeek/tabular'
  use 'sbdchd/neoformat'
  use 'direnv/direnv.vim' 
  use 'fedepujol/move.nvim'
  use 'luukvbaal/stabilize.nvim'

  use "lukas-reineke/indent-blankline.nvim"
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
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup() end
  }

  use {
    'shadmansaleh/lualine.nvim',
     requires = {'kyazdani42/nvim-web-devicons', opt = true},
     config = function() require'lualine'.setup
	{
          options = {theme = 'auto'},
          extensions = {'nvim-tree'}
	}
     end
  } 
  -- Post-install/update hook with call of vimscript function with argument
  
  -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use specific branch, dependency and run lua file after load 
  --  use { 'tamton-aquib/staline.nvim', requires = { 'kyazdani42/nvim-web-devicons' }, config = function() require('staline').setup{} end }
  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  
--   use 'maxbrunsfeld/vim-yankstack' make your own kill-ring plugin

  use {
    "folke/which-key.nvim",
    branch = "master",
    config = function()
      require("which-key").setup {
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
      }
    end
  }

  use { 
    "vhyrro/neorg",
    config = function()
        require('neorg').setup {
            -- Tell Neorg what modules to load
            load = {
                ["core.defaults"] = {}, -- Load all the default modules
                ["core.norg.concealer"] = {}, -- Allows for use of icons
                ["core.norg.dirman"] = { -- Manage your directories with Neorg
                    config = {
                        workspaces = {
                            my_workspace = "~/neorg"
                        }
                    }
                }
            },
        }
    end,
    requires = "nvim-lua/plenary.nvim"
  }
end)

