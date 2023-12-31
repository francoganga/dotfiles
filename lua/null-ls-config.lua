
local null_ls = require("null-ls");

local formatting = null_ls.builtins.formatting;

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- null_ls.setup({
--     debug = false,
--     sources = {
--         formatting.prettier,
--         formatting.goimports
--     },
--     on_attach = function(client, bufnr)
--         if client.supports_method("textDocument/formatting") and vim.bo.filetype == "go" then
--             vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--             vim.api.nvim_create_autocmd("BufWritePre", {
--                 group = augroup,
--                 buffer = bufnr,
--                 callback = function()
--                     -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--                     -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
--                     vim.lsp.buf.format()
--                 end,
--             })
--         end
--     end,
-- })
