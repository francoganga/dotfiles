local nvim_lsp = require'lspconfig'
local nlspsettings = require("nlspsettings")
local lsp_utils = require('lspconfig/util')

nlspsettings.setup({
  config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
  local_settings_root_markers = { '.git' },
  jsonls_append_default_schemas = true
})



-- FORMATING ON SAVE -------------------------
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        async = true,
        -- filter = function(client)
        --     -- apply whatever logic you want (in this example, we'll only use null-ls)
        --     return client.name == "null-ls"
        -- end,
        bufnr = bufnr,
    })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
------------------------------------------


local on_attach = function(client, bufnr)

    -- if client.name == "tsserver" then
    --     client.resolved_capabilities.document_formatting = false
    -- end

    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        -- vim.api.nvim_create_autocmd("BufWritePre", {
        --     group = augroup,
        --     buffer = bufnr,
        --     callback = function()
        --         lsp_formatting(bufnr)
        --     end,
        -- })
    end
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    --buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)

end


-- nvim_lsp.solargraph.setup({
--     on_attach = on_attach
-- })

nvim_lsp.rust_analyzer.setup({
    on_attach = on_attach,
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                allFeatures = true,
                overrideCommand = {
                    'cargo', 'clippy', '--workspace', '--message-format=json',
                    '--all-targets', '--all-features'
                }
            }
        }
    }
})

-- nvim_lsp.templ.setup({
--     on_attach = on_attach,
--     cmd = {"templ", "lsp"},
--     filetypes = { 'templ' },
--     root_dir = nvim_lsp.util.root_pattern("go.mod", ".git"),
-- })

nvim_lsp.emmet_ls.setup{
    filetypes = {"html", "eruby", "twig", "templ", "htmldjango", "svelte", "vue"}
}

nvim_lsp.gopls.setup{
    on_attach = on_attach,
    -- settings = {
    --     gopls = {
    --         analyses = {
    --             shadow = true
    --         }
    --     }
    -- }
}

-- nvim_lsp.tsserver.setup {
--     on_attach = on_attach,
--     filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" }
-- }

local function get_typescript_server_path(root_dir)
  local project_root = lsp_utils.find_node_modules_ancestor(root_dir)

  local local_tsserverlib = project_root ~= nil and lsp_utils.path.join(project_root, 'node_modules', 'typescript', 'lib', 'tsserverlibrary.js')
  local global_tsserverlib = '/home/fganga/.nvm/versions/node/v18.13.0/lib/node_modules/typescript/lib/tsserverlibrary.js'

  if local_tsserverlib and lsp_utils.path.exists(local_tsserverlib) then
    return local_tsserverlib
  else
    return global_tsserverlib
  end
end

nvim_lsp.volar.setup {
    -- on_new_config = function(new_config, new_root_dir)
    --     new_config.init_options.typescript.serverPath = get_typescript_server_path(new_root_dir)
    -- end,
    on_attach = on_attach,
    filetypes = {'typescript', 'javascript', 'vue', 'json'},
    cmd = {"vue-language-server", "--stdio"}
}

-- nvim_lsp.elixirls.setup {
--     cmd = { "/home/fganga/.local/share/nvim/lsp_servers/elixir/elixir-ls/language_server.sh" };
-- }

local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"|", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })


vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

nvim_lsp.tailwindcss.setup({
    filetypes = {
        "templ",
        "html"
    }
})

local servers = {"intelephense", "pylsp", "tsserver", "elmls", "rust_analyzer", "clangd", "csharp_ls", "jsonls", "rescriptls", "elixirls", "ocamllsp", "svelte", "jsonls"}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)
        end,
        flags = {
            debounce_text_changes = 150,
        },
    }
end
