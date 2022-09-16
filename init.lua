-- require 'impatient'
require 'utils'
require 'keybinds'
require 'dashboard_config'

local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

g.loaded_python_provider = 0

g.bufExplorerShowTabBuffer = 1
g.dashboard_default_executive = 'telescope'

-- cmd 'colorscheme darkblue'
cmd 'colorscheme spaceduck'
cmd 'set background=light'
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.hidden = true
opt.hlsearch = true
opt.backspace = {'indent', 'eol', 'start'}
opt.shiftwidth = 2
opt.guifont = 'PragmataPro Mono Liga:h14'
opt.laststatus = 2
opt.encoding = 'utf-8'
opt.showtabline = 1
opt.list = true
-- opt.listchars:append "eol:↴"
-- opt.listchars:append "space:⋅"

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

-- Auto session plugin
vim.g.auto_session_root_dir = "/home/insipx/projects/vim-sessions"
vim.g.godot_executable = "/nix/store/h3drz27p8q64y560p893ghm3432pphsk-user-environment/bin/godot"

-- Commands
cmd [[command! WhatHighlight :call util#syntax_stack()]]
cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

-- formatters
cmd [[
let g:python3_host_prog = "/nix/store/r1w11gr97qx6pddvxqglq8fxn92kgjxi-user-environment/bin/python3"
let g:chadtree_settings = {
      \ 'theme.text_colour_set': 'nord'
      \ }
]]

local coq = require('coq')
local lspconfig = require('lspconfig')
lspconfig.gdscript.setup(coq.lsp_ensure_capabilities())
vim.diagnostic.config({virtual_text = false, virtual_lines = {only_current_line = true}})

-- Format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
null_ls.setup({
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end
      })
    end
  end,
  sources = {
    null_ls.builtins.formatting.lua_format.with({args = {"--tab-width", 2, "--indent-width", 2, "--column-limit", 120}}),
    null_ls.builtins.formatting.dprint, 
    null_ls.builtins.formatting.prettier, 
    null_ls.builtins.completion.spell, 
    null_ls.builtins.formatting.rustfmt.with({ disabled_filetypes = { "rust" } })
  }
})
