require "../utils"

local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

-- BufExplorer
-- g.bufExplorerShowTabBuffer = 1
-- Coq
g.coq_settings = {auto_start = "shut-up"}

-- Chadtree
g.chadtree_settings = {theme = {text_colour_set = "nord"}}

-- Dashboard
g.dashboard_default_executive = "telescope"

-- Colorscheme, neon
vim.g.neon_style = "doom"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true
