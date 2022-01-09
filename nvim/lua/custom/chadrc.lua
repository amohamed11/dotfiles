-- This is an example chadrc file , its supposed to be placed in /lua/custom dir
-- lua/custom/chadrc.lua

local M = {}

M.options = {
   -- custom = {}
   -- general nvim/vim options , check :h optionname to know more about an option
   clipboard = "unnamed,unnamedplus",
   relativenumber = true,
}

M.plugins = {
   status = {
      colorizer = true,
      -- dashboard = true,
   },
   options = {
      nvimtree = {
         enable_git = 0,
      },
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },

}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "onedark",
}

-- plugins related mappings
--
-- M.mappings.plugins = {
--    telescope = {
--       find_files = "<C-p>",
--    },
-- }

return M
