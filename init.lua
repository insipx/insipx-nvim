require 'utils'
if isModuleAvailable('impatient') then require('impatient') end
require('plugin_config')
local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

g.loaded_python_provider = 0

g.bufExplorerShowTabBuffer = 1
g.dashboard_default_executive = 'telescope'

-- cmd 'colorscheme darkblue'

vim.g.neon_style = "doom"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.hidden = true
opt.hlsearch = true
opt.backspace = {'indent', 'eol', 'start'}
opt.shiftwidth = 2
opt.guifont = 'PragmataProMonoLiga Nerd Font:h14'
opt.laststatus = 3
opt.encoding = 'utf-8'
opt.showtabline = 1
opt.list = true
-- opt.listchars:append "eol:↴"
opt.listchars:append "space:⋅"

-- Disable some unused built-in Neovim plugins
vim.g.loaded_man = false
vim.g.loaded_gzip = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false
vim.g.coq_settings = {auto_start = 'shut-up'}
vim.g.chadtree_settings = {theme = {text_colour_set = 'nord'}}
g.mapleader = ' '
g.nocompatible = true

------------------------ MAPPINGS --------------------------------
map('i', 'jk', '<esc>') -- remap esc
map('', '<leader>ic', '"+y') -- Copy to clipboard in normal, visual, select and operator modes

-- Commands
cmd [[command! WhatHighlight :call util#syntax_stack()]]
cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

cmd [[
let g:python3_host_prog = "/usr/bin/python3"
]]
