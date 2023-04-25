local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazy_configuration = require('setup/lazy_opts')
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

return function()
  require("lazy").setup("plugins", lazy_configuration)
end

