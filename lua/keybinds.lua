require('utils')
local wk = require('which-key')
local neogit = require('neogit')
local cmd = vim.cmd

-- Normal Mode
wk.register({
  ["<leader>"] = {
    name = "general",
    f = {
      name = "file",
      f = { "<cmd>Telescope find_files<cr>",    "find File"        },
      r = { "<cmd>Telescope oldfiles<cr>",      "open recent file" },
      b = { "<cmd>Telescope marks<cr>", 	"browse files" 	   },
      h = { "<cmd>Telescope oldfiles<cr>", 	"find history" 	   },
    },
    b = {
      name = "buffer",
      -- B = { "<cmd>Telescope buffers<cr>", 	"list buffers"	      },
      B = { "<cmd>ToggleBufExplorer<CR>", 	"toggle buffer explorer"},
      n = { '<cmd>bnext<cr>', 			"next buffer"	      },
      p = { '<cmd>bprevious<cr>', 		"previous buffer"     },
      k = { '<cmd>Bdelete<cr>', 		"close buffer"	      },
      a = { '<cmd>bufdo Bdelete<cr>',		"delete all buffers"  },
    },
    c = {
      name = "commands (OS)",
      n = { "<cmd>enew<cr>", 		        "new file"		},
      r = { function() rename() end,		"Rename file"		},
    },
    r = {
      name = "godot",
      r = { "<cmd>GodotRun<cr>",		"run the main scene"		},
      R = { "<cmd>GodotRun",			"select a scene to run" 	},
      f = { "<cmd>GodotRunFZF<cr>",		"select a scene with fzf"	},
    },
    p = {
      name = "project",
      f = { "<cmd>Telescope git_files<cr>", 	"find file in project" 		},
      t = { "<cmd>CHADopen<CR>", 		"open tree explorer" 		},
      tk = { "<cmd>CHADhelp keybind<CR>", 	"open help dialogue for tree binds" },
      s = { "<cmd>SidebarNvimToggle<CR>",	"toggle diagnostic sidebar" 	},
      sr = { "<cmd>SidebarNvimUpdate<CR>",	"update diagnostic sidebar"	},
      td = { "<cmd>TroubleToggle<CR>",		"toggle TODO finder" 		},
    },
    g = {
      name = "git",
      g =  { function() neogit.open() end, 			"neogit status" },
      gs = { function() neogit.open({kind = "split" }) end, 	"neogit status split" },
      c =  { function() neogit.open({ "commit" }) end,		"neogit commit" },
    
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
      t = { "<cmd>ToggleTerm size=40 dir=git_dir direction=horizontal<CR>", "toggle floating terminal" },
      f = { "<cmd>Telescope toggleterm<CR>", "find open terminal" },
      -- t = { "<cmd>FloatermToggle<CR>",	          "toggle floating terminal" },
      -- n = { "<cmd>FloatermNext<cr>",		  "next terminal" }, 
      -- p = { "<cmd>FloatermPrev<cr>",		  "previous terminal" },
    },
    i = {
      name = "insert",
      c = { "+y", 					"to clipboard"   },
      y = { '"+p',					"from clipboard" },
      r = { "<cmd>Telescope registers<CR>",		"from register"  },
      -- unicode
      -- emoji
    },
    l = {
      name = "LSP",
      r = {
	name = "Rust",
	h = { "<CMD>RustHoverActions<CR>", "Trigger actions on hover" },
      }
    },
    e = {
      name = "editor config",
      s = { "<CMD> source $MYVIMRC<CR>", "Source vim config" },
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
    t = { t("<C-\\><C-N>:ToggleTerm<CR>"),		"toggle floating terminal" },
    -- t = { t("<C-\\><C-N>:FloatermToggle<CR>"),		"toggle floating terminal" },
    -- n = { "<cmd>FloatermNext<cr>",		  	"next Terminal" 	   }, 
    -- p = { "<cmd>FloatermPrev<cr>",		  	"previous Terminal" 	   },
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
-- vim.api.nvim_set_keymap('v', '<M-j>', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<M-k>', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })

cmd [[
  let g:dashboard_custom_shortcut={
    \ 'last_session'       : 'SPC s l',
    \ 'find_history'       : 'SPC f h',
    \ 'find_file'          : 'SPC f f',
    \ 'new_file'           : 'SPC f n',
    \ 'change_colorscheme' : 'SPC t c',
    \ 'find_word'          : 'SPC f a',
    \ 'book_marks'         : 'SPC f b',
  \ }
]]

