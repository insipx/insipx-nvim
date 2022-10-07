-- Configuration for lua plugins plugins
-- Will only load if plugins have loaded

if isModuleAvailable('nightfox') then vim.cmd("colorscheme terafox") end
if isModuleAvailable('which-key') then require('keybinds') end
if isModuleAvailable('dashboard_config') then require('dashboard_config') end

-- Godot
vim.g.godot_executable = "/nix/store/h3drz27p8q64y560p893ghm3432pphsk-user-environment/bin/godot"

if isModuleAvailable('coq')
then
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
	callback = function() vim.lsp.buf.format({bufnr = bufnr}) end
      })
    end
  end,
  sources = {
    null_ls.builtins.formatting.lua_format.with({args = {"--tab-width", 2, "--indent-width", 2, "--column-limit", 120}}),
    null_ls.builtins.formatting.dprint, null_ls.builtins.formatting.prettier, null_ls.builtins.completion.spell, null_ls.builtins.formatting.rustfmt.with({disabled_filetypes = {"rust"}})
  }
  })
end

if isModuleAvailable('lualine') then 
  require('line_eyecandy')
  local config = statusline_config()
  require('lualine').setup(config)
end
    

