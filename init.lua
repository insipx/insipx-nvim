vim.g.mapleader = " "
vim.opt.termguicolors = true
-- bootstrap plugin manager
require("setup.lazy_boostrap")()
require("lazy").setup("plugins", require("setup.lazy_opts"))
require 'utils'
if isModuleAvailable('impatient') then require('impatient') end
require('setup/plugin_config')
-- options/aliases
local cmd = vim.cmd
local opt = vim.opt
local g = vim.g
g.loaded_python_provider = 0
g.bufExplorerShowTabBuffer = 1
g.dashboard_default_executive = "telescope"
-- cmd 'colorscheme darkblue'
vim.g.neon_style = "doom"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true
opt.number = true
opt.relativenumber = true
opt.hidden = true
opt.hlsearch = true
opt.backspace = {"indent", "eol", "start"}
opt.shiftwidth = 2
opt.guifont = 'PragmataProMonoLiga Nerd Font:h10'
opt.laststatus = 3
opt.encoding = 'utf-8'
opt.showtabline = 1
opt.list = true
opt.signcolumn = "yes"
-- opt.listchars:append "eol:↴"
opt.listchars:append "space:⋅"

g.nocompatible = true
-- Disable some unused built-in Neovim plugins
g.loaded_man = false
g.loaded_gzip = false
g.loaded_netrwPlugin = false
g.loaded_tarPlugin = false
g.loaded_zipPlugin = false
g.loaded_2html_plugin = false
g.loaded_remote_plugins = false

g.coq_settings = {auto_start = "shut-up"}
g.chadtree_settings = {theme = {text_colour_set = "nord"}}

------------------------ MAPPINGS --------------------------------
map("i", "jk", "<esc>") -- remap esc
map("", "<leader>ic", "\"+y") -- Copy to clipboard in normal, visual, select and operator modes
