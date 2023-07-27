require "../utils"

-- Configuration for lua plugins plugins
-- Will only load if plugins have loaded
if isModuleAvailable("neon") then vim.cmd("colorscheme neon") end
if isModuleAvailable("which-key") then require("../keys/keybinds") end
if isModuleAvailable("dashboard_config") then require("../ui/dashboard_config") end

local on_attach = function(client)
  require("lsp-format").on_attach(client)

  -- ... anything else ...
end

-- Godot
vim.g.godot_executable = "/opt/homebrew/bin/godot"

if isModuleAvailable("coq") and isModuleAvailable("lspconfig") then
  local coq = require("coq")
  local lspconfig = require("lspconfig")
  lspconfig.gdscript.setup(coq.lsp_ensure_capabilities())
  lspconfig.tsserver.setup(coq.lsp_ensure_capabilities({on_attach = on_attach}))
  lspconfig.gopls.setup(coq.lsp_ensure_capabilities({on_attach = on_attach}))
  vim.diagnostic.config({virtual_text = false, virtual_lines = {only_current_line = true}})
  -- Format on save
  -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
end

if isModuleAvailable("null-ls") then
  local null_ls = require("null-ls")
  local sources = {
    null_ls.builtins.formatting.dprint.with({filetypes = {"toml"}}), -- bin: dprint
    -- bin: lua-format, LuaFormatter, https://github.com/Koihik/LuaFormatter, nix: luaformatter
    null_ls.builtins.formatting.prettier, null_ls.builtins.formatting.lua_format.with({
      args = {
        "--indent-width", "2", "--tab-width", "2", "--column-limit", "100", "--no-use-tab",
        "--single-quote-to-double-quote", "--align-args"
      }
    }), null_ls.builtins.code_actions.statix, -- bin: statix 
    null_ls.builtins.formatting.nixfmt, -- bin: nixfmt
    null_ls.builtins.diagnostics.deadnix, -- bin: deadnix
    null_ls.builtins.formatting.cbfmt, -- bin: cbfmt (for formatting codeblocks in markdown)
    -- null_ls.builtins.formatting.dotenv_linter, -- bin: dotenv-linter
    null_ls.builtins.code_actions.gitsigns, -- bin: git
    null_ls.builtins.diagnostics.codespell, -- bin: codespell
    null_ls.builtins.diagnostics.gdlint, -- bin: gdlint
    null_ls.builtins.formatting.gdformat, -- bin: gdformat
    null_ls.builtins.diagnostics.gitlint, -- bin: gitlint
    null_ls.builtins.diagnostics.yamllint, -- bin: yamllint
    null_ls.builtins.diagnostics.tidy, -- bin: tidy-html5
    -- null_ls.builtins.diagnostics.tsc, -- bin: tsc
    null_ls.builtins.formatting.htmlbeautifier -- bin: htmlbeautifier
  }
  null_ls.setup({sources = sources, on_attach = on_attach})
end
