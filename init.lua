require('plugins')
require('utils')
require('keybinds')
require('dashboard')

local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

cmd 'colorscheme spaceduck'
cmd 'set background=light'
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.hidden = true
opt.hlsearch = true
opt.backspace = {'indent', 'eol', 'start' }
opt.shiftwidth = 2
opt.guifont = 'PragmataPro Mono Liga:h12'
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
vim.g.auto_session_root_dir = "/home/insipx/projects/vim-sessions"
vim.g.godot_executable = "/nix/store/jbc1rl2gg72sy29p4rxl5qg53mf2778s-user-environment/bin/godot"

-- formatters
cmd [[
let g:chadtree_settings = {
      \ 'theme.text_colour_set': 'nord'
      \ }

let g:bufExplorerShowTabBuffer=1
let g:python3_host_prog = "/nix/store/1qahkcn00wmakmdwl1jg3vaz85q8jwff-user-environment/bin/python3"
let g:neoformat_enabled_rust = ['rustfmt']
let g:neoformat_toml_dprint = {
            \ 'exe': 'dprint',
            \ 'args': ['fmt', '--stdin', expand('%:p')],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_toml = ['dprint']
let g:neoformat_enabled_json = ['dprint']

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

let g:dashboard_default_executive ='telescope'
nnoremap <leader>sv :source $MYVIMRC<CR>
]]

-- tnoremap <Esc> <C-\><C-n> Remap Terminal exit to ESC (conflicts with VI mode in fish)

