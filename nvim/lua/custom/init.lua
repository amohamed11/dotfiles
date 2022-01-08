require "custom.plugins"

local hooks = require "core.hooks"

-- MAPPINGS
-- To add new plugins, use the "setup_mappings" hook,

hooks.add("setup_mappings", function(map)
end)

-- NOTE : opt is a variable  there (most likely a table if you want multiple options),
-- you can remove it if you dont have any custom options


-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough
