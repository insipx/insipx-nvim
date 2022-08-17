require 'impatient'

require 'utils'
require 'keybinds'
require 'dashboard_config'

local cmd = vim.cmd
local opt = vim.opt
local g = vim.g


g.loaded_python_provider = 0
g.python3_host_prog = "/Users/andrewplaza/.asdf/installs/python/3.10.4/bin/python3"

g.bufExplorerShowTabBuffer=1
g.dashboard_default_executive ='telescope'


cmd 'colorscheme darkblue'
cmd 'colorscheme spaceduck'
cmd 'set background=light'
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.hidden = true
opt.hlsearch = true
opt.backspace = {'indent', 'eol', 'start' }
opt.shiftwidth = 2
opt.guifont = 'FiraCode Nerd Font Mono:h14'
opt.laststatus = 2

-- Disable some unused built-in Neovim plugins
vim.g.loaded_man = false
vim.g.loaded_gzip = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false
vim.g.coq_settings = { auto_start = 'shut-up' }
vim.g.chadtree_settings = {
  theme = { text_colour_set = 'nord' }
}
g.mapleader = ' '
g.nocompatible = true

------------------------ MAPPINGS --------------------------------
map('i', 'jk', '<esc>') -- remap esc
map('', '<leader>ic', '"+y') -- Copy to clipboard in normal, visual, select and operator modes


-- Auto session plugin
vim.g.godot_executable = "/Applications/Godot.app"

-- Commands
cmd [[command! WhatHighlight :call util#syntax_stack()]]
cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

-- formatters
cmd [[
let g:neoformat_enabled_rust = ['rustfmt']
let g:neoformat_toml_dprint = {
	    \ 'exe': 'dprint',
	    \ 'args': ['fmt', '--stdin', expand('%:p')],
	    \ 'stdin': 1,
	    \ }
let g:neoformat_enabled_toml = ['dprint']
let g:neoformat_enabled_json = ['dprint']
let g:chadtree_settings = {
      \ 'theme.text_colour_set': 'nord'
      \ }

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

nnoremap <leader>sv :source $MYVIMRC<CR>
]]

-- tnoremap <Esc> <C-\><C-n> Remap Terminal exit to ESC (conflicts with VI mode in fish)
local coq = require('coq')
local lspconfig = require('lspconfig')
lspconfig.gdscript.setup (coq.lsp_ensure_capabilities())
lspconfig.rust_analyzer.setup (
	coq.lsp_ensure_capabilities({
	    settings = {
	      ["rust-analyzer"] = {
		procMacro = {
		  enable = false
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

-- vim.diagnostic.config({
--  virtual_text = false,
-- })
