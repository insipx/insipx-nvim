require('utils')
local wk = require('which-key')
local neogit = require('neogit')
local cmd = vim.cmd
local opts = {noremap = true, silent = true}

-- Normal Mode
wk.register({
    ["<leader>"] = {
        name = "general",
        f = {
            name = "file",
            f = {"<cmd>Telescope find_files<cr>", "find file"},
            r = {"<cmd>Telescope oldfiles<cr>", "open recent file"},
	    b = { function() require("telescope").extensions.file_browser.file_browser() end, "browse files" },
	    m = {"<cmd>Telescope marks<cr>", "find marks"},
            h = {"<cmd>Telescope oldfiles<cr>", "find history"}
            -- c = { "<cmd> Telescope frecency<cr>", 	"use frecency to find frequently-used files" },
            -- p = { "<cmd> Telescope ports<cr>", 	"find open ports, kill process with <CTRL>-K" },
        },
        b = {
            name = "buffer",
            B = {"<cmd>Telescope buffers<cr>", "list buffers"},
            e = {"<cmd>ToggleBufExplorer<CR>", "toggle buffer explorer"},
            n = {'<cmd>bnext<cr>', "next buffer"},
            p = {'<cmd>bprev<cr>', "previous buffer"},
            k = {'<cmd>Bdelete<cr>', "close buffer"},
            a = {'<cmd>bufdo Bdelete<cr>', "delete all buffers"},
            t = {'<cmd>Telescope tele_tabby list<CR>', "tab search"}
        },
        q = {
            name = "search/quickfix",
            o = {"<cmd>copen<CR>", "open the quickfix window"},
            c = {"<cmd>ccl<CR>", "close the quickfix window"},
            n = {"<cmd>cn<CR>", "go to the next error in window"},
            p = {"<cmd>cp<CR>", "go to previous error in window"}
        },
        c = {
            name = "commands (OS)",
            n = {"<cmd>enew<cr>", "new file"},
            r = {function() rename() end, "Rename file"}
        },
        r = {
            name = "godot",
            r = {"<cmd>GodotRun<cr>", "run the main scene"},
            R = {"<cmd>GodotRun", "select a scene to run"},
            f = {"<cmd>GodotRunFZF<cr>", "select a scene with fzf"}
        },
        p = {
            name = "project",
            f = {"<cmd>Telescope git_files<cr>", "find file in project"},
            t = {
                name = "Tree Explorer",
		t = {"<cmd>CHADopen<CR>", "open tree explorer"},
                k = {
                    "<cmd>CHADhelp keybind<CR>",
                    "open help dialogue for tree binds"
                }
            },
            s = {
                name = "Diagnostic Sidebar",
                r = {"<cmd>SidebarNvimUpdate<CR>", "update diagnostic sidebar"},
                t = {"<cmd>SidebarNvimToggle<CR>", "toggle diagnostic sidebar"}
            },
            d = {"<cmd>TroubleToggle<CR>", "toggle Errror quickfix"},
            p = { function() require'telescope'.extensions.project.project{} end, "Open Projects"}
        },
        g = {
            name = "git",
            g = {function() neogit.open() end, "neogit status"},
            gs = {
                function() neogit.open({kind = "split"}) end,
                "neogit status split"
            },
            c = {function() neogit.open({"commit"}) end, "neogit commit"}
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
            t = {
                "<cmd>ToggleTerm size=20 dir=git_dir direction=horizontal<CR>",
                "toggle terminal"
            },
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
                h = {"<CMD>RustHoverActions<CR>", "Trigger actions on hover"}
            },
            a = {function() vim.lsp.buf.code_action() end, "select code action"},
            tl = {
                function() require("lsp_lines").toggle() end,
                "Toggle lsp_lines virtual text"
            },
	    f = { function() vim.lsp.buf.format() end, "format buffer" },

        },
        e = {
            name = "editor config",
            s = {"<CMD> source $MYVIMRC<CR>", "Source vim config"}
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
        ["/"] = {"<cmd>Telescope live_grep<cr>", "search project"}
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

