return {
  tools = {
    inlay_hints = {only_current_line = true, show_variable_name = true},
    hover_actions = {auto_focus = true},
    crate_graph = {backend = "cgimage"}
  },
  server = {
    on_attach = function(client)
      require("lsp-format").on_attach(client)
      -- client.server_capabilities.document_formatting = false
      -- client.server_capabilities.document_range_formatting = false
    end,
    settings = {
      ["rust_analyzer"] = {
        procMacro = {enable = false},
        diagnostics = {disabled = {"unresolved-proc-macro"}},
        checkOnSave = {command = "clippy"}
      }
    }
  }
}
