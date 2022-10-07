-- require 'impatient'
require "utils"
require "keybinds"
require "dashboard_config"

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
cmd "colorscheme terafox"
-- cmd 'set background=light'
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.hidden = true
opt.hlsearch = true
opt.backspace = {"indent", "eol", "start"}
opt.shiftwidth = 2
opt.guifont = "mononoki Nerd Font:h12"
opt.laststatus = 2
opt.encoding = "utf-8"
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
vim.g.coq_settings = {auto_start = "shut-up"}
vim.g.chadtree_settings = {theme = {text_colour_set = "nord"}}
g.mapleader = " "
g.nocompatible = true

------------------------ MAPPINGS --------------------------------
map("i", "jk", "<esc>") -- remap esc
map("", "<leader>ic", "\"+y") -- Copy to clipboard in normal, visual, select and operator modes

-- Auto session plugin
-- vim.g.auto_session_root_dir = "/home/insipx/projects/vim-sessions"
-- Godot
vim.g.godot_executable = "/nix/store/h3drz27p8q64y560p893ghm3432pphsk-user-environment/bin/godot"

-- Commands
cmd [[command! WhatHighlight :call util#syntax_stack()]]
cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

-- formatters
-- let g:python3_host_prog = "/nix/store/r1w11gr97qx6pddvxqglq8fxn92kgjxi-user-environment/bin/python3"
cmd [[
let g:chadtree_settings = {
      \ 'theme.text_colour_set': 'nord'
      \ }
]]

local coq = require("coq")
local lspconfig = require("lspconfig")
lspconfig.gdscript.setup(coq.lsp_ensure_capabilities())
-- lspconfig.null_ls.setup(coq.lsp_ensure_capabilities({on_attach = require("lsp-format").on_attach}))
vim.diagnostic.config({virtual_text = false, virtual_lines = {only_current_line = true}})
