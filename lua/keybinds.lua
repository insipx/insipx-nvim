require('utils')
local wk = require('which-key')

-- Normal Mode
wk.register({
  ["<leader>"] = {
    name = "general",
    f = {
      name = "file",
      f = { "<cmd>Telescope find_files<cr>",   "find File"        },
      r = { "<cmd>Telescope oldfiles<cr>",     "open recent file" },
      n = { "<cmd>enew<cr>", 		       "new file"         },
      b = { "<cmd>Telescope file_browser<cr>", "browse files" 	  },
    },
    b = {
      name = "buffer",
      B = { "<cmd>Telescope buffers<cr>", 	"list buffers"	      },
      n = { '<cmd>bnext<cr>', 			"next buffer"	      },
      p = { '<cmd>bprevious<cr>', 		"previous buffer"     },
      k = { '<cmd>Bdelete<cr>', 		"close buffer"	      },
      a = { '<cmd>bufdo Bdelete<cr>',		"delete all buffers"  },
    },
    g = {
      name = "godot",
      r = { "<cmd>GodotRun<cr>",		"run the main scene"		},
      R = { "<cmd>GodotRun",			"select a scene to run" 	},
      f = { "<cmd>GodotRunFZF<cr>",		"select a schene with fzf"	},
    },
    p = {
      name = "project",
      f = { "<cmd>Telescope git_files<cr>", 	"find file in project" 		},
      t = { "<cmd>NvimTreeToggle<CR>", 		"open tree explorer" 		},
      tr = {"<cmd>NvimTreeRefresh<CR>", 	"refresh tree explorer" 	},
      tn = {"<cmd>NvimTreeFindFile<CR>", 	"find file with tree" 		},
      s = { "<cmd>SidebarNvimToggle<CR>",	"toggle diagnostic sidebar" 	},
    },
    w = {
      name = "window",
      h =     { '<C-W>h', 		'left'		       },
      l =     { '<C-W>l', 		'right'		       },
      j =     { '<C-W>j', 		'down'		       },
      k =     { '<C-W>k',		'up'		       },
      v =     { '<C-w>v', 		'vertical split'       },
      s =     { '<C-w>s', 		'horizontal split'     },
      q =     { '<cmd>q<cr>',		'close'	               },
      ["="] = { '<C-w>=',		'balance windows'      },
      L =     { '<C-w>>2',		'resize right'         },
      H =     { '<C-w><2',		'resize left'	       },
      J =     { '<C-w>+2',		'resize down'	       },
      K =     { '<C-w>-2', 		'resize up'	       },
    },
    t = {
      name = "terminal",
      t = { "<cmd>FloatermToggle<CR>",	          "toggle floating terminal" },
      o = { "<cmd>terminal<cr>",		  "open terminal in a window" },
      n = { "<cmd>FloatermNext<cr>",		  "next terminal" }, 
      p = { "<cmd>FloatermPrev<cr>",		  "previous terminal" },
    },
    i = {
      name = "insert",
      c = { "+y", 					"to clipboard"   },
      y = { '"+p',					"from clipboard" },
      r = { "<cmd>Telescope registers<CR>",		"from register"  },
      -- unicode
      -- emoji
    },
    e = {
      name = "editor config",
      -- t = { ":Twilight<CR>",			"Toggle Twilight" },
    },
    ["<Tab>"] = {
      name = "workspace",
      n 		= { "<cmd>tabedit<cr>", 	"new workspace"		      },
      d 		= { "<cmd>tabclose<cr>", 	"close workspace"	      },
      ["]"] 		= { "<C-PageDown>", 		"next workspace"	      },
      ["["] 		= { "<C-PageUp>", 		"previous workspace"	      },
      ["<Right>"] 	= { ":tabm +1<CR>",		"move workspace to the right" },
      ["<Left>"] 	= { ":tabm -1<CR>",		"move workspace to the left"  },
    },
    ["/"] = { "<cmd>Telescope live_grep<cr>", "search project" },
  },
  ["\\\\"] = {
      name = "navigation",
      w = { ":HopWord<cr>", 			"hop to a word" 	    },
      b = { ":HopWordBC<CR>",			"hop word backwards" 	    },
      f = { ":HopWordAC<CR>",			"hop word forwards"	    },
  },
})

--  :FloatermNew --autoclose=0 gcc % -o %< && ./%<
-- Terminal Mode
wk.register({
  t = {
    name = "terminal",
    t = { t("<C-\\><C-N>:FloatermToggle<CR>"),		"toggle floating terminal" },
    n = { "<cmd>FloatermNext<cr>",		  	"next Terminal" 	   }, 
    p = { "<cmd>FloatermPrev<cr>",		  	"previous Terminal" 	   },
  },
}, { prefix = "<leader>", mode = 't', noremap = true, silent = true })


-- Visual Mode
wk.register({
  ["<leader>"] = {},
  ["\\\\"] = {
    name = "navigation",
    w = { ":HopWord<CR>", 				"hop to a word" 	    },
    b = { ":HopWordBC<CR>",				"hop word backwards" 	    },
    f = { ":HopWordAC<CR>",				"hop word forwards"	    },
  }
}, { mode = 'v' })

-- Vim move Keybindings
vim.api.nvim_set_keymap('v', '<A-j>', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-k>', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })

