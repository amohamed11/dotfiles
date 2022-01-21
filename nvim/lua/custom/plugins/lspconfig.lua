local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config

   local servers = { "html", "cssls", "pylsp" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end
   
   lspconfig.rust_analyzer.setup {
     cmd = { "rustup", "run", "nightly", "rust-analyzer" },
     on_attach = attach,
     capabilities = capabilities, 
   }
   
   lspconfig.gopls.setup {
     cmd = { "~/go/bin/gopls" },
     on_attach = attach,
     capabilities = capabilities, 
   }

end

return M

