

function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end 

-- The function is called `t` for `termcodes`.
-- You don't have to call it that, but I find the terseness convenient
function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function rename()
  print("hello")
  -- local fname = vim.fn.input("File: ", "", "file") 
  -- vim.call('Rename', fname)
end
