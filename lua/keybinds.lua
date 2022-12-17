require('utils')
local wk = require('which-key')
local neogit = require('neogit')
local cmd = vim.cmd
local opts = {noremap = true, silent = true}
local telescope = require('telescope.builtin')
local tele_themes = require('telescope.themes')
local tele_ext = require('telescope').extensions
-- Normal Mode
wk.register({
  ["<leader>"] = {
    name = "general",
    f = {
      name = "file",
      f = {function() telescope.find_files(tele_themes.get_ivy({})) end, "find file"},
      r = {function() telescope.old_files(tele_themes.get_ivy({})) end, "open recent file"},
      b = {function() tele_ext.file_browser.file_browser(tele_themes.get_ivy({})) end, "browse files"},
      m = {function() telescope.marks(tele_themes.get_ivy({})) end, "find marks"},
      h = {function() telescope.oldfiles(tele_themes.get_ivy({})) end, "find history"},
      -- c = { "<cmd> Telescope frecency<cr>", 	"use frecency to find frequently-used files" },
      -- p = { "<cmd> Telescope ports<cr>", 	"find open ports, kill process with <CTRL>-K" },
      t = {function() telescope.planets({}) end, "Use the telescope ..."}
    },
    b = {
      name = "buffer",
      B = {function() telescope.buffers(tele_themes.get_ivy({})) end, "list buffers"},
      e = {"<cmd>ToggleBufExplorer<CR>", "toggle buffer explorer"},
      n = {'<cmd>bnext<cr>', "next buffer"},
      p = {'<cmd>bprev<cr>', "previous buffer"},
      P = {"<cmd>BufferLineTogglePin<CR>", "Pin buffer to start of bufferline"},
      k = {'<cmd>Bdelete<cr>', "close buffer"},
      a = {'<cmd>bufdo Bdelete<cr>', "delete all buffers"},
      t = {function() tele_ext.tele_tabby.list(tele_themes.get_ivy({})) end, "tab search"}
    },
    q = {
      name = "search/quickfix",
      o = {"<cmd>copen<CR>", "open the quickfix window"},
      c = {"<cmd>ccl<CR>", "close the quickfix window"},
      n = {"<cmd>cn<CR>", "go to the next error in window"},
      p = {"<cmd>cp<CR>", "go to previous error in window"},
      l = {function() telescope.quickfix(tele_themes.get_ivy({})) end, "list items in the quickfix list"},
      h = {function() telescope.quickfixhistory(tele_themes.get_ivy({})) end, "search through quick fix history"}

    },
    c = {name = "commands (OS)", n = {"<cmd>enew<cr>", "new file"}, r = {function() rename() end, "Rename file"}},
    r = {
      name = "godot",
      r = {"<cmd>GodotRun<cr>", "run the main scene"},
      R = {"<cmd>GodotRun", "select a scene to run"},
      f = {"<cmd>GodotRunFZF<cr>", "select a scene with fzf"}
    },
    p = {
      name = "project",
      f = {function() telescope.git_files(tele_themes.get_ivy({})) end, "find file in project"},
      t = {
        name = "Tree Explorer",
        t = {"<cmd>CHADopen<CR>", "open tree explorer"},
        k = {"<cmd>CHADhelp keybind<CR>", "open help dialogue for tree binds"}
      },
      s = {
        name = "Diagnostic Sidebar",
        r = {"<cmd>SidebarNvimUpdate<CR>", "update diagnostic sidebar"},
        t = {"<cmd>SidebarNvimToggle<CR>", "toggle diagnostic sidebar"}
      },
      d = {"<cmd>TroubleToggle<CR>", "toggle error quickfix"},
      p = {function() tele_ext.project.project {} end, "Open Projects"}
    },
    g = {
      name = "git",
      g = {function() neogit.open() end, "neogit status"},
      G = {function() neogit.open({kind = "split"}) end, "neogit status split"},
      c = {function() neogit.open({"commit"}) end, "neogit commit"},
      f = {
        name = "Git forge, octo",
        p = {"<cmd>Octo pr list<CR>", "List PR's from this repository"},
        i = {"<cmd>Octo issue list<CR>", "List issues from this repo"}
      }
    },
    w = {
      name = "window",
      h = {'<C-W>h', 'left'},
      l = {'<C-W>l', 'right'},
      j = {'<C-W>j', 'down'},
      k = {'<C-W>k', 'up'},
      v = {'<C-w>v', 'vertical split'},
      s = {'<C-w>s', 'horizontal split'},
      q = {'<cmd>q<cr>', 'close'},
      ["="] = {'<C-w>=', 'balance windows'},
      L = {'<C-w>>2', 'resize right'},
      H = {'<C-w><2', 'resize left'},
      J = {'<C-w>+2', 'resize down'},
      K = {'<C-w>-2', 'resize up'}
    },
    t = {
      name = "terminal",
      t = {"<cmd>ToggleTerm size=20 dir=git_dir direction=horizontal<CR>", "toggle terminal"},
      f = {"<cmd>Telescope toggleterm<CR>", "find open terminal"},
      qq -- t = { "<cmd>FloatermToggle<CR>",	"toggle floating terminal" },
      -- n = { "<cmd>FloatermNext<cr>",		"next terminal" }, 
      -- p = { "<cmd>FloatermPrev<cr>",		"previous terminal" },
    },
    i = {
      name = "insert",
      c = {"+y", "to clipboard"},
      y = {'"+p', "from clipboard"},
      r = {"<cmd>Telescope registers<CR>", "from register"}
      -- unicode
      -- emoji
    },
    l = {
      name = "LSP",
      r = {
        name = "Rust",
        h = {function() require'rust-tools'.hover_actions.hover_actions() end, "Trigger actions on hover"},
        r = {function() require'rust-tools'.runnables.runnables() end, "List runnables in buffer"},
        c = {
          function() require'rust-tools'.open_cargo_toml.open_cargo_toml() end,
          "Open the Cargo.toml for the current buffer"
        },
        p = {function() require'rust-tools'.parent_module.parent_module() end, "Go to the parent module"}
      },
      a = {function() vim.lsp.buf.code_action() end, "select code action"},
      tl = {function() require("lsp_lines").toggle() end, "Toggle lsp_lines virtual text"},
      f = {function() vim.lsp.buf.format() end, "format buffer"},
      d = {
        name = "diagnostics",
        a = {function() telescope.diagnostics(tele_themes.get_ivy({})) end, "list diagnostics for all open buffers"},
        c = {
          function() telescope.diagnostics({theme = tele_themes.get_ivy({}), bufnr = 0}) end,
          "list diagnostics for currently open buffer"
        }
      },
      s = {"<CMD>SymbolsOutline<CR>", "toggle symbols outline"},
      c = {
	name = "GitHub Copilot",
	n = {"<Plug>(copilot-next)<CR>", "next suggestion"},
	p = {"<Plug>(copilot-prev)<CR>", "previous suggestion"},
	d = {"<Plug>(copilot-dismiss)<CR>", "dismiss suggestion"},
      }
    },
    e = {
      name = "neoVIM options",
      s = {"<CMD> source $MYVIMRC<CR>", "Source vim config"},
      c = {function() telescope.commands(tele_themes.get_ivy({})) end, "List available commands from vim/plugins"}

    },
    ["<Tab>"] = {
      name = "workspace",
      n = {"<cmd>tabedit<cr>", "new workspace"},
      d = {"<cmd>tabclose<cr>", "close workspace"},
      ["]"] = {"<C-PageDown>", "next workspace"},
      ["["] = {"<C-PageUp>", "previous workspace"},
      ["<Right>"] = {":tabm +1<CR>", "move workspace to the right"},
      ["<Left>"] = {":tabm -1<CR>", "move workspace to the left"}
    },
    ["/"] = {function() telescope.live_grep(tele_themes.get_ivy({})) end, "search project"},
    ["H"] = {function() telescope.search_history(tele_themes.get_ivy({})) end, "telescope search history"},
    ["?"] = {"<cmd>Cheatsheet<CR>", "time to CHEAT!!!"}
  },
  ["\\\\"] = {
    name = "navigation",
    w = {":HopWord<cr>", "hop to a word"},
    b = {":HopWordBC<CR>", "hop word backwards"},
    f = {":HopWordAC<CR>", "hop word forwards"}
  }
})

--  :FloatermNew --autoclose=0 gcc % -o %< && ./%<
-- Terminal Mode
wk.register({
  t = {
    name = "terminal",
    t = {t("<C-\\><C-N>:ToggleTerm<CR>"), "toggle floating terminal"}
    -- t = { t("<C-\\><C-N>:FloatermToggle<CR>"),		"toggle floating terminal" },
    -- n = { "<cmd>FloatermNext<cr>",		  	"next Terminal" 	   }, 
    -- p = { "<cmd>FloatermPrev<cr>",		  	"previous Terminal" 	   },
  }
}, {prefix = "<leader>", mode = 't', noremap = true, silent = true})

-- Visual Mode
wk.register({
  ["<leader>"] = {},
  ["\\\\"] = {
    name = "navigation",
    w = {":HopWord<CR>", "hop to a word"},
    b = {":HopWordBC<CR>", "hop word backwards"},
    f = {":HopWordAC<CR>", "hop word forwards"}
  }
}, {mode = 'v'})

-- Vim move Keybindings
vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)

vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)

cmd [[
  let g:dashboard_custom_shortcut={
    \ 'last_session'       : 'SPC s l',
    \ 'find_history'       : 'SPC f h',
    \ 'find_file'          : 'SPC f f',
    \ 'new_file'           : 'SPC f n',
    \ 'change_colorscheme' : 'SPC t c',
    \ 'find_word'          : 'SPC f a',
    \ 'book_marks'         : 'SPC p c b',
  \ }
]]
