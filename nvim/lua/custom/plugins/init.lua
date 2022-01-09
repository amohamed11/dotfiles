local hooks = require "core.hooks"

-- Install plugins
-- To add new plugins, use the "install_plugins" hook,

hooks.add("install_plugins", function(use)
  use "tpope/vim-surround"
  use "Pocco81/TrueZen.nvim"
  use "dkarter/bullets.vim"
  use "ayu-theme/ayu-vim"
end)

-- custom plugin-related settings
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
