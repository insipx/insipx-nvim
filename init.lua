require "setup.vim_opts"
-- bootstrap plugin manager
require("setup.lazy_boostrap")()
require("lazy").setup("plugins", require("setup.lazy_opts"))
require "utils"
if isModuleAvailable("impatient") then require("impatient") end
require "setup.plugin_config"
require "setup.plugin_opts"

vim.g.bufExplorerShowTabBuffer = 1
