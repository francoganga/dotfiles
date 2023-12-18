-- vim.api.nvim_create_autocmd("BufRead", {
--     pattern = "*.js",
--     command = "setlocal shiftwidth=2 tabstop=2"
-- })
--
-- vim.api.nvim_create_autocmd("BufRead", {
--     pattern = "*.jsx",
--     command = "setlocal shiftwidth=2 tabstop=2"
-- })
--
-- vim.api.nvim_create_autocmd("BufRead", {
--     pattern = "*.tsx",
--     command = "setlocal shiftwidth=2 tabstop=2"
-- })
--
-- vim.api.nvim_create_autocmd("BufRead", {
--     pattern = "*.ts",
--     command = "setlocal shiftwidth=2 tabstop=2"
-- })

local au_goimports = vim.api.nvim_create_augroup("goimports", {})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    group = au_goimports,
    callback = function()
        require("go_tests").goimports()
    end
})

-- local au_center = vim.api.nvim_create_augroup("au_center", {})
--
-- vim.api.nvim_create_autocmd("CursorMoved", {
--     group = au_center,
--     callback = function()
--         local lines = vim.fn.line("$")
--
--         local cur_pos = vim.fn.getcurpos()
--
--         if #cur_pos < 2 then
--             print("cursor position length less than 2, cannot continue")
--             return
--         end
--
--         local cur_line =cur_pos[2]
--         local diff = lines - cur_line
--
--         if lines - cur_line <= 10 then
--             vim.cmd("normal! zz")
--         end
--     end
-- })

-- local au_djlint = vim.api.nvim_create_augroup("au_djlint", {})
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = "*.gohtml",
--     group = au_djlint,
--     callback = function()
--         require("go_tests").djlint()
--     end
-- })

-- local termgo = vim.api.nvim_create_augroup("termgo", {})
-- vim.api.nvim_create_autocmd("BufRead", {
--     pattern = "*.go",
--     group = augroup,
--     callback = function()
--         vim.api.nvim_set_keymap('n', ',t', ':vs term://zsh<cr>', { noremap = true, silent = true })
--     end
-- })

-- local prettier_svelte = vim.api.nvim_create_augroup("prettier_svelte", {})
--
-- vim.api.nvim_create_autocmd("BufRead", {
--     pattern = "*.svelte",
--     group = augroup,
--     callback = function()
--         require("go_tests").prettier_svelte()
--     end
-- })

-- vim.api.nvim_create_autocmd("BufRead", {
--     pattern = "*.templ",
--     callback = function()
--         vim.lsp.start({
--             name="templ",
--             cmd = {"templ", "lsp"},
--             filetypes = {"templ"},
--             root_dir = vim.fs.dirname(vim.fs.find({'go.mod', '.git'}, { upward = true })[1]),
--         })
--     end
-- })

vim.api.nvim_create_autocmd("LspAttach", {
    pattern = "*.templ",
    callback = function(args)


        local bufnr = args.buf

        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
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
        buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)

    end
})

-- vim.api.nvim_create_autocmd("BufRead", {
--     pattern = "*.twig",
--     command = "TSDisable highlight ['html.twig.js.css']"
-- })

-- vim.api.nvim_create_autocmd("CursorMoved", {
--     command = "set nohlsearch"
-- })

-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = "*.tsx",
--     callback = function ()
--         vim.lsp.buf.formatting()
--     end
-- })

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile"
})

--TODO
-- vim.api.nvim_create_autocmd("BufWritePost", {
--     group = vim.api.nvim_create_augroup("go_tests", { clear = true }),
--     pattern = "*test.go",
--     callback = function ()
--         local package = "./" .. vim.fn.expand("%:h")
--         print("package=" .. package)
--         vim.fn.jobstart({"go", "test", package, "-json"}, {
--             stdout_buffered = true,
--             on_stdout = function (_, data)
--                 if not data then
--                     return
--                 end
--                 print("data")
--                 P(data)
--
--                 for _, line in ipairs(data) do
--                     if line ~= "" then
--                         local decoded = vim.json.decode(line)
--                         print("decodad")
--                         P(decoded)
--                     end
--                 end
--             end
--         })
--     end
--
-- })

-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = "*.html",
--     command = "!djhtml -i %"
-- })
